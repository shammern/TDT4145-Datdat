import sqlite3
from datetime import datetime
import re

# ANSI escape codes for colors
# These were found with the support from ChatGPT
GREEN = "\033[92m"
RED = "\033[91m"
RESET = "\033[0m"

# Formats string to be properly aligned when writing result to terminal
# This function was made with support from ChatGPT
def color_ljust(text: str, width: int) -> str:
    
    # Strip ANSI codes before measuring length
    stripped = re.sub(r'\x1b\[[0-9;]*m', '', text)
    diff = width - len(stripped)
    if diff > 0:
        text += ' ' * diff
    return text

# Runs a query on the DB returning the flight number and aircrafttype for a given route and date
def find_flight_number(db_path, route_id, flight_date):
    conn = sqlite3.connect(db_path)
    cur = conn.cursor()
    query = """
    SELECT f.FlightNumber, fr.TypeName
    FROM Flight f
    JOIN FlightSegment fs ON f.SegmentID = fs.SegmentID
    JOIN FlightRoute fr 
      ON fs.RouteID = fr.RouteID AND fs.WeekdayCode = fr.WeekdayCode
    WHERE fr.RouteID = ?
      AND f.Date = ?
      AND f.Status = 'Planned'
    """

    cur.execute(query, (route_id, flight_date))
    row = cur.fetchone()
    conn.close()

    #Returns flightNR and aircraft type name if found
    if row:
        return row[0], row[1]
    else:
        return None, None


# Runs a query on the DB retreiving seat config, given an aircraft type.
def get_seat_configuration(db_path, type_name):
    conn = sqlite3.connect(db_path)
    cur = conn.cursor()
    cur.execute("SELECT ConfigID FROM AircraftType WHERE TypeName = ?", (type_name,))
    row = cur.fetchone()
    conn.close()
    return row[0] if row else None

# Runs a query to find seat config details: RowNumber, Leftseats and rightseats, given an seat config ID.
def get_seat_rows(db_path, config_id):
    conn = sqlite3.connect(db_path)
    cur = conn.cursor()
    cur.execute("""
        SELECT RowNumber, LeftSeats, RightSeats
        FROM SeatRow
        WHERE ConfigID = ?
        ORDER BY RowNumber
    """, (config_id,))
    rows = cur.fetchall()
    conn.close()
    return rows

# Runs a query finding all available seats for a given flight
def get_available_seats(db_path, flight_number):
    conn = sqlite3.connect(db_path)
    cur = conn.cursor()
    cur.execute("SELECT Seat FROM BookedSeat WHERE FlightNumber = ? AND TicketID IS NULL", (flight_number,))
    seats = cur.fetchall()
    conn.close()
    return {seat[0] for seat in seats}


# Prints the seatlayout in a nicly formated way where each row is printed on the same line, 
# available seats in green, and unavaiable seats are marked with a red X.
# This function was made with support from ChatGPT
def print_seat_layout(db_path, route_id, flight_date):
    flight_number, type_name = find_flight_number(db_path, route_id, flight_date)
    if not flight_number:
        print("No planned flight found for that route and date.")
        return
    
    print(f"Flight number: {flight_number} (Aircraft type: {type_name})")
    
    config_id = get_seat_configuration(db_path, type_name)
    seat_rows = get_seat_rows(db_path, config_id)
    available_set = get_available_seats(db_path, flight_number)
    
    # Determine maximum number of seats on left and right sides for alignment.
    max_left = max((len(row[1]) for row in seat_rows), default=0)  # row[1] = LeftSeats
    max_right = max((len(row[2]) for row in seat_rows), default=0) # row[2] = RightSeats
    
    seat_width = 5
    
    for row_number, left_seats, right_seats in seat_rows:
        left_seats = left_seats or ""
        right_seats = right_seats or ""
        
        # Build the left side string
        left_side = ""
        for i in range(max_left):
            if i < len(left_seats):
                seat_label = f"{row_number}{left_seats[i]}"
                if seat_label in available_set:
                    # Available seat => print in green
                    seat_text = f"{GREEN}{seat_label}{RESET}"
                else:
                    # Taken seat => print red 'X'
                    seat_text = f"{RED}X{RESET}"
            else:
                seat_text = ""  # No seat in this position
            left_side += color_ljust(seat_text, seat_width)
        
        # Build the right side string
        right_side = ""
        for i in range(max_right):
            if i < len(right_seats):
                seat_label = f"{row_number}{right_seats[i]}"
                if seat_label in available_set:
                    seat_text = f"{GREEN}{seat_label}{RESET}"
                else:
                    seat_text = f"{RED}X{RESET}"
            else:
                seat_text = ""
            right_side += color_ljust(seat_text, seat_width)
        
        # Print the row with a gap between the two sides
        print(left_side + "   " + right_side)

if __name__ == '__main__':
    db_path = 'data/Project_DB.db'
    
    # Retrieve and display available Route IDs.
    conn = sqlite3.connect(db_path)
    cur = conn.cursor()
    cur.execute("SELECT DISTINCT RouteID FROM FlightRoute ORDER BY RouteID")
    route_ids = [row[0] for row in cur.fetchall()]
    print("Available Route IDs:")
    for rid in route_ids:
        print(rid)
    conn.close()
    
    # Get user input for route ID
    while True:
        route_id = input("\nEnter flight route ID: ").strip().upper()
        if route_id not in route_ids:
            print("Invalid route ID, please try again.")
        else:
            break
    
    # Get user input for flight date
    while True:
        flight_date = input("\nEnter flight date (YYYY-MM-DD): ").strip()
        try:
            datetime.strptime(flight_date, "%Y-%m-%d")
            break
        except ValueError:
            print("Invalid date format. Please enter the date in YYYY-MM-DD format.")
    
    # Print the seat layout with color coding
    print_seat_layout(db_path, route_id, flight_date)
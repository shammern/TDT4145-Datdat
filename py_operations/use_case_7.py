import sqlite3

# ANSI escape codes for colors
GREEN = "\033[92m"
RED = "\033[91m"
BLUE = "\033[94m"
RESET = "\033[0m"

# Modify the function to return True if successful, False otherwise.
def generate_booked_seats_from_flight(db_path, flight_number, placeholder_ticket_id=None):
    conn = sqlite3.connect(db_path)
    cur = conn.cursor()

    # Finds SegmentID from Flight table.
    cur.execute("SELECT SegmentID FROM Flight WHERE FlightNumber = ?", (flight_number,))
    flight_data = cur.fetchone()
    if not flight_data:
        print(f"\n  No flight found with FlightNumber: {RED}{flight_number}{RESET}")
        conn.close()
        return False  # Return False if flight not found
    segment_id = flight_data[0]

    # Finds RouteID and WeekdayCode from FlightSegment.
    cur.execute("SELECT RouteID, WeekdayCode FROM FlightSegment WHERE SegmentID = ?", (segment_id,))
    seg_data = cur.fetchone()
    if not seg_data:
        print(f"\n  No flight segment found with SegmentID {RED}{segment_id}{RESET}")
        conn.close()
        return False  # Return False if segment not found
    route_id, weekday_code = seg_data

    # Finds TypeName from FlightRoute.
    cur.execute("SELECT TypeName FROM FlightRoute WHERE RouteID = ? AND WeekdayCode = ?", (route_id, weekday_code))
    route_data = cur.fetchone()
    if not route_data:
        print(f"\n  No flight route found for RouteID {route_id} and WeekdayCode {weekday_code}.")
        conn.close()
        return False  # Return False if route not found
    type_name = route_data[0]

    # Finds the seat configuration from AircraftType.
    cur.execute("SELECT ConfigID FROM AircraftType WHERE TypeName = ?", (type_name,))
    config_data = cur.fetchone()
    if not config_data:
        print(f"\n  No seat configuration found for aircraft type {RED}{type_name}{RESET}")
        conn.close()
        return False  # Return False if configuration not found
    config_id = config_data[0]

    # Retrieve all seat rows for this configuration from SeatRow.
    cur.execute("""
        SELECT RowNumber, LeftSeats, RightSeats
        FROM SeatRow
        WHERE ConfigID = ?
        ORDER BY RowNumber
    """, (config_id,))
    seat_rows = cur.fetchall()
    if not seat_rows:
        print(f"\n  No seat rows found for configuration ID {RED}{config_id}{RESET}")
        conn.close()
        return False  # Return False if seat rows not found

    # Generate seat labels
    seats = []
    for row in seat_rows:
        row_number, left_seats, right_seats = row
        if left_seats:
            for letter in left_seats:
                seats.append(f"{row_number}{letter}")
        if right_seats:
            for letter in right_seats:
                seats.append(f"{row_number}{letter}")

    # Insert each generated seat into the BookedSeat table.
    for seat in seats:
        try:
            cur.execute("""
                INSERT INTO BookedSeat (FlightNumber, Seat, TicketID)
                VALUES (?, ?, ?)
            """, (flight_number, seat, placeholder_ticket_id))
        except sqlite3.IntegrityError as e:
            print(f"\n  {RED}Error inserting seat {seat}: {e}{RESET}")

    conn.commit()
    conn.close()
    print(f"\n{GREEN}Success:{RESET} Inserted \033[1m{len(seats)}\033[0m seats for flight \033[1m{flight_number}\033[0m.\n")
    return True  # Return True if successful

def run_sql_script(db_path, sql_file):
    """Executes an SQL script from a file."""
    conn = sqlite3.connect(db_path)
    cur = conn.cursor()
    
    with open(sql_file, 'r', encoding='utf-8') as file:
        sql_script = file.read()
    
    try:
        cur.executescript(sql_script)
        conn.commit()
        print(f"{GREEN}Success:{RESET} Executed {sql_file} successfully.\n \t You can now verify the booking in the database.\n")
    except sqlite3.Error as e:
        print(f"\n{RED}Error executing {sql_file}: {e}{RESET}")
    
    conn.close()

# Main loop
if __name__ == '__main__':
    db_path = 'data/Project_DB.db'
    sql_file = 'sql_operations/book_flight.sql'


    # Fetch and display the available flights.
    conn = sqlite3.connect(db_path)
    cur = conn.cursor()
    cur.execute("SELECT FlightNumber FROM Flight")
    flights = cur.fetchall()
    print("\nAvailable Flights:")
    for (flight_number,) in flights:
        print(f" \u2022 {flight_number}")

    while True:
        flight_number = input(f"\nEnter flight number:\n{BLUE}> ").strip().upper()
        print(RESET, end="")
        if generate_booked_seats_from_flight(db_path, flight_number):
            break  # Exit the loop if a valid flight number was provided
        print(f"\n  {RED}Invalid flight number. Please try again.{RESET}")

    conn.close()

    run_sql_script(db_path, sql_file)
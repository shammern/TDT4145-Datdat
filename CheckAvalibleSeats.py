import sqlite3

def find_flight_number(db_path, route_id, flight_date):
    """
    Finds a planned flight number and aircraft type for the given flight route and date.
    Returns (flight_number, type_name) or (None, None) if not found.
    """
    conn = sqlite3.connect(db_path)
    cur = conn.cursor()
    query = """
    SELECT f.FlightNumber, fr.TypeName
    FROM Flight f
    JOIN FlightSegment fs ON f.SegmentID = fs.SegmentID
    JOIN FlightRoute fr ON fs.RouteID = fr.RouteID AND fs.WeekdayCode = fr.WeekdayCode
    WHERE fr.RouteID = ?
      AND f.Date = ?
      AND f.Status = 'Planned'
    LIMIT 1;
    """
    cur.execute(query, (route_id, flight_date))
    row = cur.fetchone()
    conn.close()
    if row:
        return row[0], row[1]
    else:
        return None, None

def get_seat_configuration(db_path, type_name):
    """
    Retrieves the seat configuration ID (ConfigID) from AircraftType for the given aircraft type.
    """
    conn = sqlite3.connect(db_path)
    cur = conn.cursor()
    cur.execute("SELECT ConfigID FROM AircraftType WHERE TypeName = ?", (type_name,))
    row = cur.fetchone()
    conn.close()
    return row[0] if row else None

def get_seat_rows(db_path, config_id):
    """
    Retrieves all seat rows (RowNumber, LeftSeats, RightSeats) for the given configuration,
    ordered by RowNumber.
    """
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

def get_available_seats(db_path, flight_number):
    """
    Retrieves a set of seat labels (e.g., '1A') that are available (TicketID IS NULL)
    for the given flight number.
    """
    conn = sqlite3.connect(db_path)
    cur = conn.cursor()
    cur.execute("SELECT Seat FROM BookedSeat WHERE FlightNumber = ? AND TicketID IS NULL", (flight_number,))
    seats = cur.fetchall()
    conn.close()
    return {seat[0] for seat in seats}

def print_seat_layout(db_path, route_id, flight_date):
    """
    For the given flight route (route_id) and flight date, this function:
      1. Finds the planned flight and its aircraft type.
      2. Retrieves the seat configuration and seat rows.
      3. Determines the max number of seats on each side (for alignment).
      4. Fetches which seats are available (NULL TicketID).
      5. Prints the seat layout row by row:
         - Shows the seat label if available.
         - Prints 'X' if taken.
         - Left and right sides are separated by a gap.
    """
    flight_number, type_name = find_flight_number(db_path, route_id, flight_date)
    if not flight_number:
        print("No planned flight found for that route and date.")
        return
    
    print(f"Flight number: {flight_number} (Aircraft type: {type_name})")
    
    config_id = get_seat_configuration(db_path, type_name)
    if config_id is None:
        print("No seat configuration found for the aircraft type.")
        return
    
    seat_rows = get_seat_rows(db_path, config_id)
    if not seat_rows:
        print("No seat rows found for the configuration.")
        return
    
    available_set = get_available_seats(db_path, flight_number)
    
    # 1) Determine how many seats are on the left side and right side at most (for alignment).
    max_left = max((len(row[1]) for row in seat_rows), default=0)  # row[1] = LeftSeats
    max_right = max((len(row[2]) for row in seat_rows), default=0) # row[2] = RightSeats
    
    # Width for each seat display (adjust as desired)
    seat_width = 4
    
    # 2) Print row by row
    for row_number, left_seats, right_seats in seat_rows:
        # If left_seats is None or empty, we'll handle it gracefully
        left_seats = left_seats or ""
        right_seats = right_seats or ""
        
        # Build the left side string
        left_side = ""
        for i in range(max_left):
            if i < len(left_seats):
                seat_label = f"{row_number}{left_seats[i]}"
                # If seat_label is available, print it; otherwise 'X'
                seat_text = seat_label if seat_label in available_set else 'X'
            else:
                seat_text = ""  # no seat in this position
            left_side += seat_text.ljust(seat_width)
        
        # Build the right side string
        right_side = ""
        for i in range(max_right):
            if i < len(right_seats):
                seat_label = f"{row_number}{right_seats[i]}"
                seat_text = seat_label if seat_label in available_set else 'X'
            else:
                seat_text = ""
            right_side += seat_text.ljust(seat_width)
        
        # Print with a gap between the two sides
        print(left_side + "   " + right_side)

if __name__ == '__main__':
    # Update db_path to the correct location of your database file.
    db_path = 'Project_DB.db'
    route_id = input("Enter flight route ID (e.g., WF1302): ").strip()
    flight_date = input("Enter flight date (YYYY-MM-DD): ").strip()
    print_seat_layout(db_path, route_id, flight_date)

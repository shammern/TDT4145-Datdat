import sqlite3

def generate_booked_seats_from_flight(db_path, flight_number, placeholder_ticket_id=0):
    """
    For the given flight number, this function:
      1. Retrieves the flight's SegmentID from the Flight table.
      2. Uses that SegmentID to get the RouteID and WeekdayCode from FlightSegment.
      3. Retrieves the TypeName from FlightRoute (using RouteID and WeekdayCode).
      4. Looks up the seat configuration (ConfigID) from AircraftType using the TypeName.
      5. Retrieves all seat rows for that configuration from SeatRow.
      6. Generates seat labels (e.g., '1A', '1B', etc.) from the row information.
      7. Inserts one record per seat into the BookedSeat table.
    """
    conn = sqlite3.connect(db_path)
    cur = conn.cursor()

    # 1. Get SegmentID from Flight table using the flight number.
    cur.execute("SELECT SegmentID FROM Flight WHERE FlightNumber = ?", (flight_number,))
    flight_data = cur.fetchone()
    if not flight_data:
        print(f"No flight found with FlightNumber {flight_number}.")
        conn.close()
        return
    segment_id = flight_data[0]

    # 2. Get RouteID and WeekdayCode from FlightSegment using the SegmentID.
    cur.execute("SELECT RouteID, WeekdayCode FROM FlightSegment WHERE SegmentID = ?", (segment_id,))
    seg_data = cur.fetchone()
    if not seg_data:
        print(f"No flight segment found with SegmentID {segment_id}.")
        conn.close()
        return
    route_id, weekday_code = seg_data

    # 3. Get TypeName from FlightRoute using RouteID and WeekdayCode.
    cur.execute("SELECT TypeName FROM FlightRoute WHERE RouteID = ? AND WeekdayCode = ?", (route_id, weekday_code))
    route_data = cur.fetchone()
    if not route_data:
        print(f"No flight route found for RouteID {route_id} and WeekdayCode {weekday_code}.")
        conn.close()
        return
    type_name = route_data[0]

    # 4. Look up the seat configuration (ConfigID) from AircraftType using TypeName.
    cur.execute("SELECT ConfigID FROM AircraftType WHERE TypeName = ?", (type_name,))
    config_data = cur.fetchone()
    if not config_data:
        print(f"No seat configuration found for aircraft type {type_name}.")
        conn.close()
        return
    config_id = config_data[0]

    # 5. Retrieve all seat rows for this configuration from SeatRow.
    cur.execute("""
        SELECT RowNumber, LeftSeats, RightSeats
        FROM SeatRow
        WHERE ConfigID = ?
        ORDER BY RowNumber
    """, (config_id,))
    seat_rows = cur.fetchall()
    if not seat_rows:
        print(f"No seat rows found for configuration ID {config_id}.")
        conn.close()
        return

    # 6. Generate seat labels (e.g., "1A", "1B", etc.)
    seats = []
    for row in seat_rows:
        row_number, left_seats, right_seats = row
        if left_seats:
            for letter in left_seats:
                seats.append(f"{row_number}{letter}")
        if right_seats:
            for letter in right_seats:
                seats.append(f"{row_number}{letter}")

    # 7. Insert each generated seat into the BookedSeat table.
    for seat in seats:
        try:
            cur.execute("""
                INSERT INTO BookedSeat (FlightNumber, Seat, TicketID)
                VALUES (?, ?, ?)
            """, (flight_number, seat, placeholder_ticket_id))
        except sqlite3.IntegrityError as e:
            print(f"Error inserting seat {seat}: {e}")

    conn.commit()
    conn.close()
    print(f"Inserted {len(seats)} seats for flight {flight_number}.")

if __name__ == '__main__':
    # Update the db_path to point to your actual database file.
    db_path = 'Project_DB.db'
    flight_number = input("Enter flight number (e.g., WF1302): ").strip()
    generate_booked_seats_from_flight(db_path, flight_number)

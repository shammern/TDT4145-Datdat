import sqlite3

# Function to fill a flight with available seats given a flightnumber. Generates one entry pr seat for a given flight in the BookedSeat table. 
def generate_booked_seats_from_flight(db_path, flight_number, placeholder_ticket_id = None):

    conn = sqlite3.connect(db_path)
    cur = conn.cursor()

    # Finds SegmentID from Flight table.
    cur.execute("SELECT SegmentID FROM Flight WHERE FlightNumber = ?", (flight_number,))
    flight_data = cur.fetchone()
    if not flight_data:
        print(f"No flight found with FlightNumber {flight_number}.")
        conn.close()
        return
    segment_id = flight_data[0]

    # Finds RouteID and WeekdayCode from FlightSegment.
    cur.execute("SELECT RouteID, WeekdayCode FROM FlightSegment WHERE SegmentID = ?", (segment_id,))
    seg_data = cur.fetchone()
    if not seg_data:
        print(f"No flight segment found with SegmentID {segment_id}.")
        conn.close()
        return
    route_id, weekday_code = seg_data

    # Finds TypeName from FlightRoute.
    cur.execute("SELECT TypeName FROM FlightRoute WHERE RouteID = ? AND WeekdayCode = ?", (route_id, weekday_code))
    route_data = cur.fetchone()
    if not route_data:
        print(f"No flight route found for RouteID {route_id} and WeekdayCode {weekday_code}.")
        conn.close()
        return
    type_name = route_data[0]

    # Finds the seat configuration from AircraftType.
    cur.execute("SELECT ConfigID FROM AircraftType WHERE TypeName = ?", (type_name,))
    config_data = cur.fetchone()
    if not config_data:
        print(f"No seat configuration found for aircraft type {type_name}.")
        conn.close()
        return
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
        print(f"No seat rows found for configuration ID {config_id}.")
        conn.close()
        return

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
            print(f"Error inserting seat {seat}: {e}")

    conn.commit()
    conn.close()
    print(f"Inserted {len(seats)} seats for flight {flight_number}.")

# NB: If trying to insert seats into flight that already has seats SQL will throw a unique error. 
if __name__ == '__main__':
    db_path = 'Project_DB.db'

    # Fetch and display the available flights.
    conn = sqlite3.connect(db_path)
    cur = conn.cursor()
    cur.execute("SELECT FlightNumber FROM Flight")
    flights = cur.fetchall()
    print("Available Flights:")
    for (flight_number,) in flights:
        print(f"  {flight_number}")


    flight_number = input("Enter flight number: ").strip().upper()
    generate_booked_seats_from_flight(db_path, flight_number)

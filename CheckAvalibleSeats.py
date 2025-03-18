import sqlite3

def find_available_seats(db_path, flight_number, flight_date):
    """
    Finds all available seats for a given flight (specified by flight number and date).
    An available seat is one where TicketID is NULL.
    """
    conn = sqlite3.connect(db_path)
    cur = conn.cursor()

    # Query: Join Flight and BookedSeat and return seats that have not been booked (TicketID IS NULL)
    query = """
    SELECT bs.Seat
    FROM BookedSeat bs
    JOIN Flight f ON bs.FlightNumber = f.FlightNumber
    WHERE f.FlightNumber = ? 
      AND f.Date = ?
      AND bs.TicketID IS NULL;
    """
    cur.execute(query, (flight_number, flight_date))
    seats = cur.fetchall()
    conn.close()
    return seats

if __name__ == '__main__':
    # Update db_path to your actual database file location if needed.
    db_path = 'Project_DB.db'
    
    flight_number = input("Enter flight number (e.g., WF1302): ").strip()
    flight_date = input("Enter flight date (YYYY-MM-DD): ").strip()
    
    available_seats = find_available_seats(db_path, flight_number, flight_date)
    if available_seats:
        print("\nAvailable seats for flight", flight_number, "on", flight_date, ":")
        for seat in available_seats:
            print(seat[0])
    else:
        print("No available seats found for that flight.")

import sqlite3

def get_flight_routes(db_path, airport_code, weekday_code, dep_or_arr):
    """Fetch flight routes based on the selected airport, weekday, and whether the user wants departures or arrivals."""
    conn = sqlite3.connect(db_path)
    cur = conn.cursor()
    
    if dep_or_arr.lower() == 'departures':
        # For departures, join via AirportHasOutgoingRoute using SegmentID.
        query = """
        SELECT FR.RouteID,
               FS.DepartureTime AS Time,
               GROUP_CONCAT(FS.Origin || '->' || FS.Destination, ', ') AS RouteInfo
        FROM FlightSegment FS
        JOIN FlightRoute FR 
          ON FS.RouteID = FR.RouteID AND FS.WeekdayCode = FR.WeekdayCode
        JOIN AirportHasOutgoingRoute AOR 
          ON AOR.SegmentID = FS.SegmentID
        WHERE AOR.AirportCode = ? AND FS.WeekdayCode = ?
        GROUP BY FR.RouteID, FS.DepartureTime;
        """
    else:
        # For arrivals, join via AirportHasIncommingRoute using SegmentID.
        query = """
        SELECT FR.RouteID,
               FS.ArrivalTime AS Time,
               GROUP_CONCAT(FS.Origin || '->' || FS.Destination, ', ') AS RouteInfo
        FROM FlightSegment FS
        JOIN FlightRoute FR 
          ON FS.RouteID = FR.RouteID AND FS.WeekdayCode = FR.WeekdayCode
        JOIN AirportHasIncommingRoute AIR 
          ON AIR.SegmentID = FS.SegmentID
        WHERE AIR.AirportCode = ? AND FS.WeekdayCode = ?
        GROUP BY FR.RouteID, FS.ArrivalTime;
        """
    
    cur.execute(query, (airport_code, weekday_code))
    results = cur.fetchall()
    conn.close()
    return results

if __name__ == '__main__':
    db_path = 'Project_DB.db'

    conn = sqlite3.connect(db_path)
    cur = conn.cursor()
    cur.execute("SELECT AirportCode, AirportName FROM Airport ORDER BY AirportCode")
    airports = cur.fetchall()
    print("Available Airports:")
    for code, name in airports:
        print(f"{code}: {name}")
    conn.close()
    
    airport_code = input("Choose an airport [Use airportcode from list]: ").strip()
    weekday_code = input("Choose a weekday [1-7]: ").strip()
    dep_or_arr = input("Departures or arrivals? [departures, arrivals]: ").strip()

    routes = get_flight_routes(db_path, airport_code, weekday_code, dep_or_arr)
    if routes:
        print("\nResult:")
        for route in routes:
            print(f"Flight Route ID: {route[0]}, Time: {route[1]}, Route: {route[2]}")
    else:
        print("No routes found for your criteria.")

import sqlite3

# Runs a query to find flight routes for a given airport, weekday and wether the user wants departures or arrivals from the given airport
def get_flight_routes(db_path, airport_code, weekday_code, dep_or_arr):
    conn = sqlite3.connect(db_path)
    cur = conn.cursor()
    
    # For departures, join via AirportHasOutgoingRoute using SegmentID.
    if dep_or_arr.lower() == 'departures':
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

    # For arrivals, join via AirportHasIncommingRoute using SegmentID.
    else:
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
    db_path = 'data/Project_DB.db'
    
    # Fetch and display the available airports.
    conn = sqlite3.connect(db_path)
    cur = conn.cursor()
    cur.execute("SELECT AirportCode, AirportName FROM Airport ORDER BY AirportCode")
    airports = cur.fetchall()
    print("\nAvailable Airports:")
    for code, name in airports:
        print(f"  {code}: {name}")
    conn.close()

    # Get user input for airport code.
    while True:
      airport_code = input("\nChoose an airport [Use airport code from list]: ").strip().upper()
      if not any(airport_code == code for code, name in airports):
        print("\tInvalid airport code, please try again.")
      else:
        break

    # Get user input for weekday code.
    while True:
        weekday_code = input("\nChoose a weekday [1-7]: ").strip()
        if weekday_code not in [str(i) for i in range(1, 8)]:
            print("\tInvalid weekday code, please try again.")
        else:
            break
        
    # Get user input for departures or arrivals.
    while True:
        dep_or_arr = input("\nDepartures or arrivals? [departures, arrivals]: ").strip().lower()
        if dep_or_arr not in ['departures', 'arrivals']:
            print("\tInvalid option, please choose 'departures' or 'arrivals'.")
        else:
            break

    # Fetch and display the flight routes.
    routes = get_flight_routes(db_path, airport_code, weekday_code, dep_or_arr)
    if routes:
        print("\nResult:")
        for route in routes:
            print(f"  Flight Route ID: {route[0]}, Time: {route[1]}, Route: {route[2]}\n")
    else:
        print("\tNo routes found for your criteria.")
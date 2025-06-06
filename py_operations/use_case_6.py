import sqlite3

# ANSI escape codes for colors
# START GPT CODE
GREEN = "\033[92m"
RED = "\033[91m"
BLUE = "\033[94m"
RESET = "\033[0m"
# END GPT CODE

# Runs a query to find flight routes for a given airport, weekday and wether the user wants departures or arrivals from the given airport
def find_routes_for_airport(db_path, airport_code, weekday_code, dep_or_arr):
    conn = sqlite3.connect(db_path)
    cur = conn.cursor()
    
    if dep_or_arr.lower() == 'departures':
        # Find route IDs where the chosen airport is the Origin
        query = """
        SELECT DISTINCT FR.RouteID
        FROM FlightSegment FS
        JOIN FlightRoute FR
          ON FS.RouteID = FR.RouteID
         AND FS.WeekdayCode = FR.WeekdayCode
        WHERE FS.Origin = ?
          AND FS.WeekdayCode = ?
        """
    else:
        # Find route IDs where the chosen airport is the Destination
        query = """
        SELECT DISTINCT FR.RouteID
        FROM FlightSegment FS
        JOIN FlightRoute FR
          ON FS.RouteID = FR.RouteID
         AND FS.WeekdayCode = FR.WeekdayCode
        WHERE FS.Destination = ?
          AND FS.WeekdayCode = ?
        """
    
    cur.execute(query, (airport_code, weekday_code))
    route_rows = cur.fetchall()
    conn.close()
    
    return [row[0] for row in route_rows]


# Finds the full route if the route has multiple legs.
def fetch_full_route_info(db_path, route_ids, weekday_code):
    if not route_ids:
        return []
    
    # Build dynamic placeholders for the IN clause.
    placeholders = ','.join(['?'] * len(route_ids))
    
    query = f"""
    SELECT FR.RouteID,
           MIN(FS.DepartureTime) AS Time,
           GROUP_CONCAT(FS.Origin || '->' || FS.Destination, ', ') AS FullRoute
    FROM FlightSegment FS
    JOIN FlightRoute FR
      ON FS.RouteID = FR.RouteID
     AND FS.WeekdayCode = FR.WeekdayCode
    WHERE FR.RouteID IN ({placeholders})
      AND FR.WeekdayCode = ?
      AND FS.Theoretical = 0
    GROUP BY FR.RouteID
    ORDER BY Time;
    """
    
    conn = sqlite3.connect(db_path)
    cur = conn.cursor()

    params = route_ids + [weekday_code]
    cur.execute(query, params)
    results = cur.fetchall()
    conn.close()
    return results


# Function to find uses the two above functions to build the routes passing through an Airport
def get_full_routes_for_airport(db_path, airport_code, weekday_code, dep_or_arr):

    matching_routes = find_routes_for_airport(db_path, airport_code, weekday_code, dep_or_arr)
    
    if not matching_routes:
        return []
    
    full_route_info = fetch_full_route_info(db_path, matching_routes, weekday_code)
    return full_route_info


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
        airport_code = input(f"\nChoose an airport [Use airport code from list]:\n{BLUE}> ").strip().upper()
        print(RESET, end="")
        if not any(airport_code == code for code, name in airports):
            print(f"\n  {RED}Invalid airport code, please try again.{RESET}")
        
        else:
            break

    # Get user input for weekday code.
    while True:
        weekday_code = input(f"\nChoose a weekday [1-7]:\n{BLUE}> ").strip().upper()
        print(RESET, end="")
        if weekday_code not in [str(i) for i in range(1, 8)]:
            print(f"\n {RED}Invalid weekday code, please try again.{RESET}")

        else:
            break
        
    # Get user input for departures or arrivals.
    while True:
        dep_or_arr = input(f"\nDepartures or arrivals? [departures, arrivals]:\n{BLUE}> ").strip().lower()
        print(RESET, end="")
        if dep_or_arr not in ['departures', 'arrivals']:
            print(f"\n  {RED}Invalid option, please choose 'departures' or 'arrivals'.{RESET}")

        else:
            break
    
    # Fetch and display the flight routes.
    route_data = get_full_routes_for_airport(db_path, airport_code, weekday_code, dep_or_arr)
    if not route_data:
        print("\nNo routes found for your criteria.")
    else:
        print(f"\n{GREEN}Result:{RESET}")
        for row in route_data:
            route_id, time, route_string = row
            print(f" \u2022 RouteID: {route_id}, Earliest Departure: {time}, Full Route: {route_string}")
        print()
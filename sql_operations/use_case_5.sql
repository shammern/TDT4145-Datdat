--USECASE 5: SQL query to find Airlines, AircraftType and Aircrafts.

SELECT al.AirlineName,
       a.TypeName,
       COUNT(*) AS Count
FROM Aircraft a
JOIN Airline al ON a.AirlineCode = al.AirlineCode
GROUP BY al.AirlineName, a.TypeName;


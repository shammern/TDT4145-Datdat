-- Populate incoming routes based on FlightSegment's destination
INSERT INTO AirportHasIncommingRoute (AirportCode, SegmentID)
SELECT Destination, SegmentID
FROM FlightSegment;

-- Populate outgoing routes based on FlightSegment's origin
INSERT INTO AirportHasOutgoingRoute (AirportCode, SegmentID)
SELECT Origin, SegmentID
FROM FlightSegment;


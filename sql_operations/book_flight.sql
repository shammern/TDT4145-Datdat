--USECASE 7: Booking of physical flight with assigned seats.

INSERT INTO Customer(CustomerID, Name, Phone, Email, Nationality) VALUES
  (00001, 'Ola Nordmann', '99 88 77 66', 'Ola@Nordmann.no', 'NOR'),
  (00002, 'Kari Nordmann', '55 44 33 22', 'kari@Nordmann.no', 'NOR');

INSERT INTO Booking (BookingRef, CustomerID, BookingDate, TotalPrice, Status) VALUES
  (2001, 00001, '2025-03-18', NULL, 'Active'),
  (2002, 00002, '2025-03-18', NULL, 'Active'),
  (2003, 00001, '2025-03-18', NULL, 'Active'),
  (2004, 00002, '2025-03-18', NULL, 'Active'),
  (2005, 00001, '2025-03-18', NULL, 'Active'),
  (2006, 00002, '2025-03-18', NULL, 'Active'),
  (2007, 00001, '2025-03-18', NULL, 'Active'),
  (2008, 00002, '2025-03-18', NULL, 'Active'),
  (2009, 00001, '2025-03-18', NULL, 'Active'),
  (2010, 00002, '2025-03-18', NULL, 'Active');

INSERT INTO Ticket (ReferenceID, FlightNumber, PriceListID, SoldPrice, BoardingTime, EarliestCheckInTime, RegisteredCheckInTime, BookingID) VALUES
  (3001, 'F001_WF1302', 'P_WF1302E_1_2', NULL, '2025-04-01 06:00:00', '2025-04-01 04:30:00', NULL, 2001),
  (3002, 'F001_WF1302', 'P_WF1302E_1_2', NULL, '2025-04-01 06:00:00', '2025-04-01 04:30:00', NULL, 2002),
  (3003, 'F001_WF1302', 'P_WF1302E_1_2', NULL, '2025-04-01 06:00:00', '2025-04-01 04:30:00', NULL, 2003),
  (3004, 'F001_WF1302', 'P_WF1302E_1_2', NULL, '2025-04-01 06:00:00', '2025-04-01 04:30:00', NULL, 2004),
  (3005, 'F001_WF1302', 'P_WF1302E_1_2', NULL, '2025-04-01 06:00:00', '2025-04-01 04:30:00', NULL, 2005),
  (3006, 'F001_WF1302', 'P_WF1302E_1_2', NULL, '2025-04-01 06:00:00', '2025-04-01 04:30:00', NULL, 2006),
  (3007, 'F001_WF1302', 'P_WF1302B_1_2', NULL, '2025-04-01 06:00:00', '2025-04-01 04:30:00', NULL, 2007),
  (3008, 'F001_WF1302', 'P_WF1302B_1_2', NULL, '2025-04-01 06:00:00', '2025-04-01 04:30:00', NULL, 2008),
  (3009, 'F001_WF1302', 'P_WF1302P_1_2', NULL, '2025-04-01 06:00:00', '2025-04-01 04:30:00', NULL, 2009),
  (3010, 'F001_WF1302', 'P_WF1302P_1_2', NULL, '2025-04-01 06:00:00', '2025-04-01 04:30:00', NULL, 2010);
  

BEGIN TRANSACTION;

-- Assignes random seats to booking
UPDATE BookedSeat
SET TicketID = 3001
WHERE FlightNumber = 'F001_WF1302' AND Seat = '1C';

UPDATE BookedSeat
SET TicketID = 3002
WHERE FlightNumber = 'F001_WF1302' AND Seat = '2A';

UPDATE BookedSeat
SET TicketID = 3003
WHERE FlightNumber = 'F001_WF1302' AND Seat = '3C';

UPDATE BookedSeat
SET TicketID = 3004
WHERE FlightNumber = 'F001_WF1302' AND Seat = '4A';

UPDATE BookedSeat
SET TicketID = 3005
WHERE FlightNumber = 'F001_WF1302' AND Seat = '5C';

UPDATE BookedSeat
SET TicketID = 3006
WHERE FlightNumber = 'F001_WF1302' AND Seat = '6A';

UPDATE BookedSeat
SET TicketID = 3007
WHERE FlightNumber = 'F001_WF1302' AND Seat = '7C';

UPDATE BookedSeat
SET TicketID = 3008
WHERE FlightNumber = 'F001_WF1302' AND Seat = '8A';

UPDATE BookedSeat
SET TicketID = 3009
WHERE FlightNumber = 'F001_WF1302' AND Seat = '9C';

UPDATE BookedSeat
SET TicketID = 3010
WHERE FlightNumber = 'F001_WF1302' AND Seat = '10B';

COMMIT;
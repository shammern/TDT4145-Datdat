--USECASE 1: Airports
INSERT INTO Airport (AirportCode, AirportName) VALUES 
  ('BOO', 'Bodø Lufthavn'),
  ('BGO', 'Bergen lufthavn, Flesland'),
  ('OSL', 'Oslo lufthavn, Gardermoen'),
  ('SVG', 'Stavanger lufthavn, Sola'),
  ('TRD', 'Trondheim lufthavn, Værnes');

--USECASE 2: Airlines, AircraftTypes and Aircrafts
INSERT INTO Airline (AirlineCode, AirlineName) VALUES 
  ('DY', 'Norwegian'),
  ('SK', 'SAS'),
  ('WF', 'Widerøe');

INSERT INTO Manufacturer (ManufacturerName, Nationality, YearFounded) VALUES 
  ('The Boeing Company', 'USA', 1916),
  ('Airbus Group', 'Multinational', 1970),
  ('De Havilland Canada', 'Canada', 1928);

INSERT INTO AircraftType (TypeName, ManufacturerName, ProdStart, ProdEnd, ConfigID) VALUES 
  ('Boeing 737 800', 'The Boeing Company', 1997, 2020, 1),
  ('Airbus a320neo', 'Airbus Group', 2016, NULL, 2),
  ('Dash-8 100', 'De Havilland Canada', 1984, 2005, 3);

INSERT INTO SeatConfig (ConfigID, ConfigName) VALUES 
(1, 'Boeing 737 800 Configuration'),
(2, 'Airbus a320neo Configuration'),
(3, 'Dash-8 100 Configuration');

-- SeatConfig Boeng 737 800
INSERT INTO SeatRow (ConfigID, RowNumber, TotalSeats, LeftSeats, RightSeats, EmergencyExit) VALUES
  (1, 1, 6, 'ABC', 'DEF', 0),
  (1, 2, 6, 'ABC', 'DEF', 0),
  (1, 3, 6, 'ABC', 'DEF', 0),
  (1, 4, 6, 'ABC', 'DEF', 0),
  (1, 5, 6, 'ABC', 'DEF', 0),
  (1, 6, 6, 'ABC', 'DEF', 0),
  (1, 7, 6, 'ABC', 'DEF', 0),
  (1, 8, 6, 'ABC', 'DEF', 0),
  (1, 9, 6, 'ABC', 'DEF', 0),
  (1, 10, 6, 'ABC', 'DEF', 0),
  (1, 11, 6, 'ABC', 'DEF', 0),
  (1, 12, 6, 'ABC', 'DEF', 0),
  (1, 13, 6, 'ABC', 'DEF', 1),
  (1, 14, 6, 'ABC', 'DEF', 0),
  (1, 15, 6, 'ABC', 'DEF', 0),
  (1, 16, 6, 'ABC', 'DEF', 0),
  (1, 17, 6, 'ABC', 'DEF', 0),
  (1, 18, 6, 'ABC', 'DEF', 0),
  (1, 19, 6, 'ABC', 'DEF', 0),
  (1, 20, 6, 'ABC', 'DEF', 0),
  (1, 21, 6, 'ABC', 'DEF', 0),
  (1, 22, 6, 'ABC', 'DEF', 0),
  (1, 23, 6, 'ABC', 'DEF', 0),
  (1, 24, 6, 'ABC', 'DEF', 0),
  (1, 25, 6, 'ABC', 'DEF', 0),
  (1, 26, 6, 'ABC', 'DEF', 0),
  (1, 27, 6, 'ABC', 'DEF', 0),
  (1, 28, 6, 'ABC', 'DEF', 0),
  (1, 29, 6, 'ABC', 'DEF', 0),
  (1, 30, 6, 'ABC', 'DEF', 0),
  (1, 31, 6, 'ABC', 'DEF', 0);

-- Seatconfig Airbus a320neo
INSERT INTO SeatRow (ConfigID, RowNumber, TotalSeats, LeftSeats, RightSeats, EmergencyExit) VALUES
  (2, 1, 6, 'ABC', 'DEF', 0),
  (2, 2, 6, 'ABC', 'DEF', 0),
  (2, 3, 6, 'ABC', 'DEF', 0),
  (2, 4, 6, 'ABC', 'DEF', 0),
  (2, 5, 6, 'ABC', 'DEF', 0),
  (2, 6, 6, 'ABC', 'DEF', 0),
  (2, 7, 6, 'ABC', 'DEF', 0),
  (2, 8, 6, 'ABC', 'DEF', 0),
  (2, 9, 6, 'ABC', 'DEF', 0),
  (2, 10, 6, 'ABC', 'DEF', 0),
  (2, 11, 6, 'ABC', 'DEF', 1),
  (2, 12, 6, 'ABC', 'DEF', 1),
  (2, 13, 6, 'ABC', 'DEF', 0),
  (2, 14, 6, 'ABC', 'DEF', 0),
  (2, 15, 6, 'ABC', 'DEF', 0),
  (2, 16, 6, 'ABC', 'DEF', 0),
  (2, 17, 6, 'ABC', 'DEF', 0),
  (2, 18, 6, 'ABC', 'DEF', 0),
  (2, 19, 6, 'ABC', 'DEF', 0),
  (2, 20, 6, 'ABC', 'DEF', 0),
  (2, 21, 6, 'ABC', 'DEF', 0),
  (2, 22, 6, 'ABC', 'DEF', 0),
  (2, 23, 6, 'ABC', 'DEF', 0),
  (2, 24, 6, 'ABC', 'DEF', 0),
  (2, 25, 6, 'ABC', 'DEF', 0),
  (2, 26, 6, 'ABC', 'DEF', 0),
  (2, 27, 6, 'ABC', 'DEF', 0),
  (2, 28, 6, 'ABC', 'DEF', 0),
  (2, 29, 6, 'ABC', 'DEF', 0),
  (2, 30, 6, 'ABC', 'DEF', 0);

-- Seatconfig Dash-8 100
INSERT INTO SeatRow (ConfigID, RowNumber, TotalSeats, LeftSeats, RightSeats, EmergencyExit) VALUES
  (3, 1, 2, '', 'CD', 0),
  (3, 2, 4, 'AB', 'CD', 0),
  (3, 3, 4, 'AB', 'CD', 0),
  (3, 4, 4, 'AB', 'CD', 0),
  (3, 5, 4, 'AB', 'CD', 1),
  (3, 6, 4, 'AB', 'CD', 0),
  (3, 7, 4, 'AB', 'CD', 0),
  (3, 8, 4, 'AB', 'CD', 0),
  (3, 9, 4, 'AB', 'CD', 0),
  (3, 10, 4, 'AB', 'CD', 0);

INSERT INTO Aircraft (RegNR, SN, AircraftName, FirstFlightYear, AirlineCode, TypeName, ManufacturerName) VALUES
  ('LN-ENU', '42069', '', 2015, 'DY', 'Boeing 737 800', 'The Boeing Company'),
  ('LN-ENR', '42093', 'Jan Bålsrud', 2018, 'DY', 'Boeing 737 800', 'The Boeing Company'),
  ('LN-NIQ', '39403', 'Max Manus', 2011, 'DY', 'Boeing 737 800', 'The Boeing Company'),
  ('LN-ENS', '42281', '', 2017, 'DY', 'Boeing 737 800', 'The Boeing Company'),
  ('SE-RUB', '9518', 'Birger Viking', 2020, 'SK', 'Airbus a320neo', 'Airbus Group'),
  ('SE-DIR', '11421', 'Nora Viking', 2023, 'SK', 'Airbus a320neo', 'Airbus Group'),
  ('SE-RUP', '12066', 'Ragnhild Viking', 2024, 'SK', 'Airbus a320neo', 'Airbus Group'),
  ('SE-RZE', '12166', 'Ebbe Viking', 2024, 'SK', 'Airbus a320neo', 'Airbus Group'),
  ('LN-WIH', '383', 'Oslo', 1994, 'WF', 'Dash-8 100', 'De Havilland Canada'),
  ('LN-WIA', '359', 'Nordland', 1993, 'WF', 'Dash-8 100', 'De Havilland Canada'),
  ('LN-WIL', '298', 'Narvik', 1995, 'WF', 'Dash-8 100', 'De Havilland Canada');

--USECASE 3: FlightRoutes and Prices. 

--Data for WF1311
INSERT INTO FlightRoute (RouteID, WeekdayCode, AirlineCode, StartDate, EndDate, TypeName) VALUES
  ('WF1311', '1', 'WF', NULL, NULL, 'Dash-8 100'),
  ('WF1311', '2', 'WF', NULL, NULL, 'Dash-8 100'),
  ('WF1311', '3', 'WF', NULL, NULL, 'Dash-8 100'),
  ('WF1311', '4', 'WF', NULL, NULL, 'Dash-8 100'),
  ('WF1311', '5', 'WF', NULL, NULL, 'Dash-8 100');

INSERT INTO FlightSegment (SegmentID, RouteID, WeekdayCode, Origin, Destination, DepartureTime, ArrivalTime, Theoretical) VALUES
  ('WF1311_1_1', 'WF1311', '1', 'TRD', 'BOO', '15:15', '16:20', FALSE),
  ('WF1311_1_2', 'WF1311', '2', 'TRD', 'BOO', '15:15', '16:20', FALSE),
  ('WF1311_1_3', 'WF1311', '3', 'TRD', 'BOO', '15:15', '16:20', FALSE),
  ('WF1311_1_4', 'WF1311', '4', 'TRD', 'BOO', '15:15', '16:20', FALSE),
  ('WF1311_1_5', 'WF1311', '5', 'TRD', 'BOO', '15:15', '16:20', FALSE);

INSERT INTO PriceList (PriceListID, SegmentID, Category, CategoryPrice) VALUES
  ('P_WF1311P_1_1', 'WF1311_1_1', 'Premium', 2018),
  ('P_WF1311B_1_1', 'WF1311_1_1', 'Business', 899),
  ('P_WF1311E_1_1', 'WF1311_1_1', 'Economy', 599),

  ('P_WF1311P_1_2', 'WF1311_1_2', 'Premium', 2018),
  ('P_WF1311B_1_2', 'WF1311_1_2', 'Business', 899),
  ('P_WF1311E_1_2', 'WF1311_1_2', 'Economy', 599),

  ('P_WF1311P_1_3', 'WF1311_1_3', 'Premium', 2018),
  ('P_WF1311B_1_3', 'WF1311_1_3', 'Business', 899),
  ('P_WF1311E_1_3', 'WF1311_1_3', 'Economy', 599),

  ('P_WF1311P_1_4', 'WF1311_1_4', 'Premium', 2018),
  ('P_WF1311B_1_4', 'WF1311_1_4', 'Business', 899),
  ('P_WF1311E_1_4', 'WF1311_1_4', 'Economy', 599),

  ('P_WF1311P_1_5', 'WF1311_1_5', 'Premium', 2018),
  ('P_WF1311B_1_5', 'WF1311_1_5', 'Business', 899),
  ('P_WF1311E_1_5', 'WF1311_1_5', 'Economy', 599);


-- Data for WF1302
INSERT INTO FlightRoute (RouteID, WeekdayCode, AirlineCode, StartDate, EndDate, TypeName)
VALUES
  ('WF1302', '1', 'WF', NULL, NULL, 'Dash-8 100'),
  ('WF1302', '2', 'WF', NULL, NULL, 'Dash-8 100'),
  ('WF1302', '3', 'WF', NULL, NULL, 'Dash-8 100'),
  ('WF1302', '4', 'WF', NULL, NULL, 'Dash-8 100'),
  ('WF1302', '5', 'WF', NULL, NULL, 'Dash-8 100');

INSERT INTO FlightSegment (SegmentID, RouteID, WeekdayCode, Origin, Destination, DepartureTime, ArrivalTime, Theoretical)
VALUES
  ('WF1302_1_1', 'WF1302', '1', 'BOO', 'TRD', '07:35', '08:40', FALSE),
  ('WF1302_1_2', 'WF1302', '2', 'BOO', 'TRD', '07:35', '08:40', FALSE),
  ('WF1302_1_3', 'WF1302', '3', 'BOO', 'TRD', '07:35', '08:40', FALSE),
  ('WF1302_1_4', 'WF1302', '4', 'BOO', 'TRD', '07:35', '08:40', FALSE),
  ('WF1302_1_5', 'WF1302', '5', 'BOO', 'TRD', '07:35', '08:40', FALSE);

INSERT INTO PriceList (PriceListID, SegmentID, Category, CategoryPrice) VALUES
  ('P_WF1302P_1_1', 'WF1302_1_1', 'Premium', 2018),
  ('P_WF1302B_1_1', 'WF1302_1_1', 'Business', 899),
  ('P_WF1302E_1_1', 'WF1302_1_1', 'Economy', 599),
  
  ('P_WF1302P_1_2', 'WF1302_1_2', 'Premium', 2018),
  ('P_WF1302B_1_2', 'WF1302_1_2', 'Business', 899),
  ('P_WF1302E_1_2', 'WF1302_1_2', 'Economy', 599),
  
  ('P_WF1302P_1_3', 'WF1302_1_3', 'Premium', 2018),
  ('P_WF1302B_1_3', 'WF1302_1_3', 'Business', 899),
  ('P_WF1302E_1_3', 'WF1302_1_3', 'Economy', 599),
  
  ('P_WF1302P_1_4', 'WF1302_1_4', 'Premium', 2018),
  ('P_WF1302B_1_4', 'WF1302_1_4', 'Business', 899),
  ('P_WF1302E_1_4', 'WF1302_1_4', 'Economy', 599),
  
  ('P_WF1302P_1_5', 'WF1302_1_5', 'Premium', 2018),
  ('P_WF1302B_1_5', 'WF1302_1_5', 'Business', 899),
  ('P_WF1302E_1_5', 'WF1302_1_5', 'Economy', 599);


-- Data for DY753
INSERT INTO FlightRoute (RouteID, WeekdayCode, AirlineCode, StartDate, EndDate, TypeName) VALUES
  ('DY753', '1', 'DY', NULL, NULL, 'Boeing 737 800'),
  ('DY753', '2', 'DY', NULL, NULL, 'Boeing 737 800'),
  ('DY753', '3', 'DY', NULL, NULL, 'Boeing 737 800'),
  ('DY753', '4', 'DY', NULL, NULL, 'Boeing 737 800'),
  ('DY753', '5', 'DY', NULL, NULL, 'Boeing 737 800'),
  ('DY753', '6', 'DY', NULL, NULL, 'Boeing 737 800'),
  ('DY753', '7', 'DY', NULL, NULL, 'Boeing 737 800');

INSERT INTO FlightSegment (SegmentID, RouteID, WeekdayCode, Origin, Destination, DepartureTime, ArrivalTime, Theoretical) VALUES
  ('DY753_1_1', 'DY753', '1', 'TRD', 'OSL', '10:20', '11:15', FALSE),
  ('DY753_1_2', 'DY753', '2', 'TRD', 'OSL', '10:20', '11:15', FALSE),
  ('DY753_1_3', 'DY753', '3', 'TRD', 'OSL', '10:20', '11:15', FALSE),
  ('DY753_1_4', 'DY753', '4', 'TRD', 'OSL', '10:20', '11:15', FALSE),
  ('DY753_1_5', 'DY753', '5', 'TRD', 'OSL', '10:20', '11:15', FALSE),
  ('DY753_1_6', 'DY753', '6', 'TRD', 'OSL', '10:20', '11:15', FALSE),
  ('DY753_1_7', 'DY753', '7', 'TRD', 'OSL', '10:20', '11:15', FALSE);

INSERT INTO PriceList (PriceListID, SegmentID, Category, CategoryPrice) VALUES
  ('P_DY753P_1_1', 'DY753_1_1', 'Premium', 1500),
  ('P_DY753B_1_1', 'DY753_1_1', 'Business', 1000),
  ('P_DY753E_1_1', 'DY753_1_1', 'Economy', 500),
  
  ('P_DY753P_1_2', 'DY753_1_2', 'Premium', 1500),
  ('P_DY753B_1_2', 'DY753_1_2', 'Business', 1000),
  ('P_DY753E_1_2', 'DY753_1_2', 'Economy', 500),
  
  ('P_DY753P_1_3', 'DY753_1_3', 'Premium', 1500),
  ('P_DY753B_1_3', 'DY753_1_3', 'Business', 1000),
  ('P_DY753E_1_3', 'DY753_1_3', 'Economy', 500),
  
  ('P_DY753P_1_4', 'DY753_1_4', 'Premium', 1500),
  ('P_DY753B_1_4', 'DY753_1_4', 'Business', 1000),
  ('P_DY753E_1_4', 'DY753_1_4', 'Economy', 500),
  
  ('P_DY753P_1_5', 'DY753_1_5', 'Premium', 1500),
  ('P_DY753B_1_5', 'DY753_1_5', 'Business', 1000),
  ('P_DY753E_1_5', 'DY753_1_5', 'Economy', 500),
  
  ('P_DY753P_1_6', 'DY753_1_6', 'Premium', 1500),
  ('P_DY753B_1_6', 'DY753_1_6', 'Business', 1000),
  ('P_DY753E_1_6', 'DY753_1_6', 'Economy', 500),
  
  ('P_DY753P_1_7', 'DY753_1_7', 'Premium', 1500),
  ('P_DY753B_1_7', 'DY753_1_7', 'Business', 1000),
  ('P_DY753E_1_7', 'DY753_1_7', 'Economy', 500);


-- Data for SK332
INSERT INTO FlightRoute (RouteID, WeekdayCode, AirlineCode, StartDate, EndDate, TypeName) VALUES
  ('SK332', '1', 'SK', NULL, NULL, 'Airbus a320neo'),
  ('SK332', '2', 'SK', NULL, NULL, 'Airbus a320neo'),
  ('SK332', '3', 'SK', NULL, NULL, 'Airbus a320neo'),
  ('SK332', '4', 'SK', NULL, NULL, 'Airbus a320neo'),
  ('SK332', '5', 'SK', NULL, NULL, 'Airbus a320neo'),
  ('SK332', '6', 'SK', NULL, NULL, 'Airbus a320neo'),
  ('SK332', '7', 'SK', NULL, NULL, 'Airbus a320neo');

INSERT INTO FlightSegment (SegmentID, RouteID, WeekdayCode, Origin, Destination, DepartureTime, ArrivalTime, Theoretical) VALUES
  ('SK332_1_1', 'SK332', '1', 'OSL', 'TRD', '08:00', '09:05', FALSE),
  ('SK332_1_2', 'SK332', '2', 'OSL', 'TRD', '08:00', '09:05', FALSE),
  ('SK332_1_3', 'SK332', '3', 'OSL', 'TRD', '08:00', '09:05', FALSE),
  ('SK332_1_4', 'SK332', '4', 'OSL', 'TRD', '08:00', '09:05', FALSE),
  ('SK332_1_5', 'SK332', '5', 'OSL', 'TRD', '08:00', '09:05', FALSE),
  ('SK332_1_6', 'SK332', '6', 'OSL', 'TRD', '08:00', '09:05', FALSE),
  ('SK332_1_7', 'SK332', '7', 'OSL', 'TRD', '08:00', '09:05', FALSE);

INSERT INTO PriceList (PriceListID, SegmentID, Category, CategoryPrice) VALUES
  ('P_SK332P_1_1', 'SK332_1_1', 'Premium', 1500),
  ('P_SK332B_1_1', 'SK332_1_1', 'Business', 1000),
  ('P_SK332E_1_1', 'SK332_1_1', 'Economy', 500),
  
  ('P_SK332P_1_2', 'SK332_1_2', 'Premium', 1500),
  ('P_SK332B_1_2', 'SK332_1_2', 'Business', 1000),
  ('P_SK332E_1_2', 'SK332_1_2', 'Economy', 500),
  
  ('P_SK332P_1_3', 'SK332_1_3', 'Premium', 1500),
  ('P_SK332B_1_3', 'SK332_1_3', 'Business', 1000),
  ('P_SK332E_1_3', 'SK332_1_3', 'Economy', 500),
  
  ('P_SK332P_1_4', 'SK332_1_4', 'Premium', 1500),
  ('P_SK332B_1_4', 'SK332_1_4', 'Business', 1000),
  ('P_SK332E_1_4', 'SK332_1_4', 'Economy', 500),
  
  ('P_SK332P_1_5', 'SK332_1_5', 'Premium', 1500),
  ('P_SK332B_1_5', 'SK332_1_5', 'Business', 1000),
  ('P_SK332E_1_5', 'SK332_1_5', 'Economy', 500),
  
  ('P_SK332P_1_6', 'SK332_1_6', 'Premium', 1500),
  ('P_SK332B_1_6', 'SK332_1_6', 'Business', 1000),
  ('P_SK332E_1_6', 'SK332_1_6', 'Economy', 500),
  
  ('P_SK332P_1_7', 'SK332_1_7', 'Premium', 1500),
  ('P_SK332B_1_7', 'SK332_1_7', 'Business', 1000),
  ('P_SK332E_1_7', 'SK332_1_7', 'Economy', 500);

-- Data for SK888
INSERT INTO FlightRoute (RouteID, WeekdayCode, AirlineCode, StartDate, EndDate, TypeName) VALUES
  ('SK888', '1', 'SK', NULL, NULL, 'Airbus a320neo'),
  ('SK888', '2', 'SK', NULL, NULL, 'Airbus a320neo'),
  ('SK888', '3', 'SK', NULL, NULL, 'Airbus a320neo'),
  ('SK888', '4', 'SK', NULL, NULL, 'Airbus a320neo'),
  ('SK888', '5', 'SK', NULL, NULL, 'Airbus a320neo');


INSERT INTO FlightSegment (SegmentID, RouteID, WeekdayCode, Origin, Destination, DepartureTime, ArrivalTime, Theoretical) VALUES
  ('SK888_1_1', 'SK888', '1', 'TRD', 'BGO', '10:00', '11:10', FALSE),
  ('SK888_2_1', 'SK888', '1', 'BGO', 'SVG', '11:40', '12:10', FALSE),
  ('SK888_3_1', 'SK888', '1', 'TRD', 'SVG', '10:00', '12:10', TRUE),
  
  ('SK888_1_2', 'SK888', '2', 'TRD', 'BGO', '10:00', '11:10', FALSE),
  ('SK888_2_2', 'SK888', '2', 'BGO', 'SVG', '11:40', '12:10', FALSE),
  ('SK888_3_2', 'SK888', '2', 'TRD', 'SVG', '10:00', '12:10', TRUE),
  
  ('SK888_1_3', 'SK888', '3', 'TRD', 'BGO', '10:00', '11:10', FALSE),
  ('SK888_2_3', 'SK888', '3', 'BGO', 'SVG', '11:40', '12:10', FALSE),
  ('SK888_3_3', 'SK888', '3', 'TRD', 'SVG', '10:00', '12:10', TRUE),
  
  ('SK888_1_4', 'SK888', '4', 'TRD', 'BGO', '10:00', '11:10', FALSE),
  ('SK888_2_4', 'SK888', '4', 'BGO', 'SVG', '11:40', '12:10', FALSE),
  ('SK888_3_4', 'SK888', '4', 'TRD', 'SVG', '10:00', '12:10', TRUE),
  
  ('SK888_1_5', 'SK888', '5', 'TRD', 'BGO', '10:00', '11:10', FALSE),
  ('SK888_2_5', 'SK888', '5', 'BGO', 'SVG', '11:40', '12:10', FALSE),
  ('SK888_3_5', 'SK888', '5', 'TRD', 'SVG', '10:00', '12:10', TRUE);


INSERT INTO PriceList (PriceListID, SegmentID, Category, CategoryPrice) VALUES
  ('P_SK888P_1_1', 'SK888_1_1', 'Premium', 2000),
  ('P_SK888B_1_1', 'SK888_1_1', 'Business', 1500),
  ('P_SK888E_1_1', 'SK888_1_1', 'Economy', 800),
  ('P_SK888P_1_2', 'SK888_2_1', 'Premium', 2000),
  ('P_SK888B_1_2', 'SK888_2_1', 'Business', 1500),
  ('P_SK888E_1_2', 'SK888_2_1', 'Economy', 800),
  ('P_SK888P_1_3', 'SK888_3_1', 'Premium', 2000),
  ('P_SK888B_1_3', 'SK888_3_1', 'Business', 1500),
  ('P_SK888E_1_3', 'SK888_3_1', 'Economy', 800),
  
  ('P_SK888P_2_1', 'SK888_1_2', 'Premium', 1000),
  ('P_SK888B_2_1', 'SK888_1_2', 'Business', 700),
  ('P_SK888E_2_1', 'SK888_1_2', 'Economy', 350),
  ('P_SK888P_2_2', 'SK888_2_2', 'Premium', 1000),
  ('P_SK888B_2_2', 'SK888_2_2', 'Business', 700),
  ('P_SK888E_2_2', 'SK888_2_2', 'Economy', 350),
  ('P_SK888P_2_3', 'SK888_3_2', 'Premium', 1000),
  ('P_SK888B_2_3', 'SK888_3_2', 'Business', 700),
  ('P_SK888E_2_3', 'SK888_3_2', 'Economy', 350),
  
  ('P_SK888P_3_1', 'SK888_1_3', 'Premium', 2200),
  ('P_SK888B_3_1', 'SK888_1_3', 'Business', 1700),
  ('P_SK888E_3_1', 'SK888_1_3', 'Economy', 1000),
  ('P_SK888P_3_2', 'SK888_2_3', 'Premium', 2200),
  ('P_SK888B_3_2', 'SK888_2_3', 'Business', 1700),
  ('P_SK888E_3_2', 'SK888_2_3', 'Economy', 1000),
  ('P_SK888P_3_3', 'SK888_3_3', 'Premium', 2200),
  ('P_SK888B_3_3', 'SK888_3_3', 'Business', 1700),
  ('P_SK888E_3_3', 'SK888_3_3', 'Economy', 1000),

  ('P_SK888P_4_1', 'SK888_1_2', 'Premium', 1000),
  ('P_SK888B_4_1', 'SK888_1_2', 'Business', 700),
  ('P_SK888E_4_1', 'SK888_1_2', 'Economy', 350),
  ('P_SK888P_4_2', 'SK888_2_2', 'Premium', 1000),
  ('P_SK888B_4_2', 'SK888_2_2', 'Business', 700),
  ('P_SK888E_4_2', 'SK888_2_2', 'Economy', 350),
  ('P_SK888P_4_3', 'SK888_3_2', 'Premium', 1000),
  ('P_SK888B_4_3', 'SK888_3_2', 'Business', 700),
  ('P_SK888E_4_3', 'SK888_3_2', 'Economy', 350),
  
  ('P_SK888P_5_1', 'SK888_1_3', 'Premium', 2200),
  ('P_SK888B_5_1', 'SK888_1_3', 'Business', 1700),
  ('P_SK888E_5_1', 'SK888_1_3', 'Economy', 1000),
  ('P_SK888P_5_2', 'SK888_2_3', 'Premium', 2200),
  ('P_SK888B_5_2', 'SK888_2_3', 'Business', 1700),
  ('P_SK888E_5_2', 'SK888_2_3', 'Economy', 1000),
  ('P_SK888P_5_3', 'SK888_3_3', 'Premium', 2200),
  ('P_SK888B_5_3', 'SK888_3_3', 'Business', 1700),
  ('P_SK888E_5_3', 'SK888_3_3', 'Economy', 1000);


--USECASE 4: Insertion of physical flights (no assigned airplane).
INSERT INTO Flight (FlightNumber, RegNR, SegmentID, Date, Status, ActualDepartureTime, ActualArrivalTime) VALUES 
  ('F001_WF1302', NULL, 'WF1302_1_2', '2025-04-01', 'Planned', NULL, NULL),
  ('F001_DY753', NULL, 'DY753_1_2', '2025-04-01', 'Planned', NULL, NULL),
  ('F001_SK888', NULL, 'SK888_1_2', '2025-04-01', 'Planned', NULL, NULL),
  ('F002_SK888', NULL, 'SK888_2_2', '2025-04-01', 'Planned', NULL, NULL), 
  ('F003_SK888', NULL, 'SK888_3_2', '2025-04-01', 'Planned', NULL, NULL);

-- Populate incoming routes based on FlightSegment's destination
INSERT INTO AirportHasIncommingRoute (AirportCode, SegmentID)
SELECT Destination, SegmentID
FROM FlightSegment;

-- Populate outgoing routes based on FlightSegment's origin
INSERT INTO AirportHasOutgoingRoute (AirportCode, SegmentID)
SELECT Origin, SegmentID
FROM FlightSegment;
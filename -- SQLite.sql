INSERT INTO Airport (AirportCode, AirportName) VALUES ('BOO', 'Bodø Lufthavn');
INSERT INTO Airport (AirportCode, AirportName) VALUES ('BGO', 'Bergen lufthavn, Flesland');
INSERT INTO Airport (AirportCode, AirportName) VALUES ('OSL', 'Oslo lufthavn, Gardermoen');
INSERT INTO Airport (AirportCode, AirportName) VALUES ('SVG', 'Stavanger lufthavn, Sola');
INSERT INTO Airport (AirportCode, AirportName) VALUES ('TRD', 'Trondheim lufthavn, Værnes');

INSERT INTO Airline (AirlineCode, AirlineName) VALUES ('DY', 'Norwegian');
INSERT INTO Airline (AirlineCode, AirlineName) VALUES ('SK', 'SAS');
INSERT INTO Airline (AirlineCode, AirlineName) VALUES ('WF', 'Widerøe');

INSERT INTO Manufacturer (ManufacturerName, Nationality, YearFounded) 
VALUES ('The Boeing Company', 'USA', 1916);

INSERT INTO Manufacturer (ManufacturerName, Nationality, YearFounded) 
VALUES ('Airbus Group', 'Multinational', 1970);

INSERT INTO Manufacturer (ManufacturerName, Nationality, YearFounded) 
VALUES ('De Havilland Canada', 'Canada', 1928);

INSERT INTO AircraftType (TypeName, ManufacturerName, ProdStart, ProdEnd, ConfigID)
VALUES ('Boeing 737 800', 'The Boeing Company', 1997, 2020, 1);

INSERT INTO AircraftType (TypeName, ManufacturerName, ProdStart, ProdEnd, ConfigID)
VALUES ('Airbus a320neo', 'Airbus Group', 2016, NULL, 2);

INSERT INTO AircraftType (TypeName, ManufacturerName, ProdStart, ProdEnd, ConfigID)
VALUES ('Dash-8 100', 'De Havilland Canada', 1984, 2005, 3);

INSERT INTO SeatConfig (ConfigID, ConfigName) VALUES (1, 'Boeing 737 800 Configuration');
INSERT INTO SeatConfig (ConfigID, ConfigName) VALUES (2, 'Airbus a320neo Configuration');
INSERT INTO SeatConfig (ConfigID, ConfigName) VALUES (3, 'Dash-8 100 Configuration');

INSERT INTO SeatRow (ConfigID, RowNumber, TotalSeats, LeftSeats, RightSeats, EmergencyExit) VALUES (1, 1, 6, 'ABC', 'DEF', 0);
INSERT INTO SeatRow (ConfigID, RowNumber, TotalSeats, LeftSeats, RightSeats, EmergencyExit) VALUES (1, 2, 6, 'ABC', 'DEF', 0);
INSERT INTO SeatRow (ConfigID, RowNumber, TotalSeats, LeftSeats, RightSeats, EmergencyExit) VALUES (1, 3, 6, 'ABC', 'DEF', 0);
INSERT INTO SeatRow (ConfigID, RowNumber, TotalSeats, LeftSeats, RightSeats, EmergencyExit) VALUES (1, 4, 6, 'ABC', 'DEF', 0);
INSERT INTO SeatRow (ConfigID, RowNumber, TotalSeats, LeftSeats, RightSeats, EmergencyExit) VALUES (1, 5, 6, 'ABC', 'DEF', 0);
INSERT INTO SeatRow (ConfigID, RowNumber, TotalSeats, LeftSeats, RightSeats, EmergencyExit) VALUES (1, 6, 6, 'ABC', 'DEF', 0);
INSERT INTO SeatRow (ConfigID, RowNumber, TotalSeats, LeftSeats, RightSeats, EmergencyExit) VALUES (1, 7, 6, 'ABC', 'DEF', 0);
INSERT INTO SeatRow (ConfigID, RowNumber, TotalSeats, LeftSeats, RightSeats, EmergencyExit) VALUES (1, 8, 6, 'ABC', 'DEF', 0);
INSERT INTO SeatRow (ConfigID, RowNumber, TotalSeats, LeftSeats, RightSeats, EmergencyExit) VALUES (1, 9, 6, 'ABC', 'DEF', 0);
INSERT INTO SeatRow (ConfigID, RowNumber, TotalSeats, LeftSeats, RightSeats, EmergencyExit) VALUES (1, 10, 6, 'ABC', 'DEF', 0);
INSERT INTO SeatRow (ConfigID, RowNumber, TotalSeats, LeftSeats, RightSeats, EmergencyExit) VALUES (1, 11, 6, 'ABC', 'DEF', 0);
INSERT INTO SeatRow (ConfigID, RowNumber, TotalSeats, LeftSeats, RightSeats, EmergencyExit) VALUES (1, 12, 6, 'ABC', 'DEF', 0);
INSERT INTO SeatRow (ConfigID, RowNumber, TotalSeats, LeftSeats, RightSeats, EmergencyExit) VALUES (1, 13, 6, 'ABC', 'DEF', 1);
INSERT INTO SeatRow (ConfigID, RowNumber, TotalSeats, LeftSeats, RightSeats, EmergencyExit) VALUES (1, 14, 6, 'ABC', 'DEF', 0);
INSERT INTO SeatRow (ConfigID, RowNumber, TotalSeats, LeftSeats, RightSeats, EmergencyExit) VALUES (1, 15, 6, 'ABC', 'DEF', 0);
INSERT INTO SeatRow (ConfigID, RowNumber, TotalSeats, LeftSeats, RightSeats, EmergencyExit) VALUES (1, 16, 6, 'ABC', 'DEF', 0);
INSERT INTO SeatRow (ConfigID, RowNumber, TotalSeats, LeftSeats, RightSeats, EmergencyExit) VALUES (1, 17, 6, 'ABC', 'DEF', 0);
INSERT INTO SeatRow (ConfigID, RowNumber, TotalSeats, LeftSeats, RightSeats, EmergencyExit) VALUES (1, 18, 6, 'ABC', 'DEF', 0);
INSERT INTO SeatRow (ConfigID, RowNumber, TotalSeats, LeftSeats, RightSeats, EmergencyExit) VALUES (1, 19, 6, 'ABC', 'DEF', 0);
INSERT INTO SeatRow (ConfigID, RowNumber, TotalSeats, LeftSeats, RightSeats, EmergencyExit) VALUES (1, 20, 6, 'ABC', 'DEF', 0);
INSERT INTO SeatRow (ConfigID, RowNumber, TotalSeats, LeftSeats, RightSeats, EmergencyExit) VALUES (1, 21, 6, 'ABC', 'DEF', 0);
INSERT INTO SeatRow (ConfigID, RowNumber, TotalSeats, LeftSeats, RightSeats, EmergencyExit) VALUES (1, 22, 6, 'ABC', 'DEF', 0);
INSERT INTO SeatRow (ConfigID, RowNumber, TotalSeats, LeftSeats, RightSeats, EmergencyExit) VALUES (1, 23, 6, 'ABC', 'DEF', 0);
INSERT INTO SeatRow (ConfigID, RowNumber, TotalSeats, LeftSeats, RightSeats, EmergencyExit) VALUES (1, 24, 6, 'ABC', 'DEF', 0);
INSERT INTO SeatRow (ConfigID, RowNumber, TotalSeats, LeftSeats, RightSeats, EmergencyExit) VALUES (1, 25, 6, 'ABC', 'DEF', 0);
INSERT INTO SeatRow (ConfigID, RowNumber, TotalSeats, LeftSeats, RightSeats, EmergencyExit) VALUES (1, 26, 6, 'ABC', 'DEF', 0);
INSERT INTO SeatRow (ConfigID, RowNumber, TotalSeats, LeftSeats, RightSeats, EmergencyExit) VALUES (1, 27, 6, 'ABC', 'DEF', 0);
INSERT INTO SeatRow (ConfigID, RowNumber, TotalSeats, LeftSeats, RightSeats, EmergencyExit) VALUES (1, 28, 6, 'ABC', 'DEF', 0);
INSERT INTO SeatRow (ConfigID, RowNumber, TotalSeats, LeftSeats, RightSeats, EmergencyExit) VALUES (1, 29, 6, 'ABC', 'DEF', 0);
INSERT INTO SeatRow (ConfigID, RowNumber, TotalSeats, LeftSeats, RightSeats, EmergencyExit) VALUES (1, 30, 6, 'ABC', 'DEF', 0);
INSERT INTO SeatRow (ConfigID, RowNumber, TotalSeats, LeftSeats, RightSeats, EmergencyExit) VALUES (1, 31, 6, 'ABC', 'DEF', 0);

INSERT INTO SeatRow (ConfigID, RowNumber, TotalSeats, LeftSeats, RightSeats, EmergencyExit) VALUES (2, 1, 6, 'ABC', 'DEF', 0);
INSERT INTO SeatRow (ConfigID, RowNumber, TotalSeats, LeftSeats, RightSeats, EmergencyExit) VALUES (2, 2, 6, 'ABC', 'DEF', 0);
INSERT INTO SeatRow (ConfigID, RowNumber, TotalSeats, LeftSeats, RightSeats, EmergencyExit) VALUES (2, 3, 6, 'ABC', 'DEF', 0);
INSERT INTO SeatRow (ConfigID, RowNumber, TotalSeats,  LeftSeats, RightSeats, EmergencyExit) VALUES (2, 4, 6, 'ABC', 'DEF', 0);
INSERT INTO SeatRow (ConfigID, RowNumber, TotalSeats, LeftSeats, RightSeats, EmergencyExit) VALUES (2, 5, 6, 'ABC', 'DEF', 0);
INSERT INTO SeatRow (ConfigID, RowNumber, TotalSeats, LeftSeats, RightSeats, EmergencyExit) VALUES (2, 6, 6, 'ABC', 'DEF', 0);
INSERT INTO SeatRow (ConfigID, RowNumber, TotalSeats, LeftSeats, RightSeats, EmergencyExit) VALUES (2, 7, 6, 'ABC', 'DEF', 0);
INSERT INTO SeatRow (ConfigID, RowNumber, TotalSeats, LeftSeats, RightSeats, EmergencyExit) VALUES (2, 8, 6, 'ABC', 'DEF', 0);
INSERT INTO SeatRow (ConfigID, RowNumber, TotalSeats, LeftSeats, RightSeats, EmergencyExit) VALUES (2, 9, 6, 'ABC', 'DEF', 0);
INSERT INTO SeatRow (ConfigID, RowNumber, TotalSeats,  LeftSeats, RightSeats, EmergencyExit) VALUES (2, 10, 6, 'ABC', 'DEF', 0);
INSERT INTO SeatRow (ConfigID, RowNumber, TotalSeats, LeftSeats, RightSeats, EmergencyExit) VALUES (2, 11, 6, 'ABC', 'DEF', 1);
INSERT INTO SeatRow (ConfigID, RowNumber, TotalSeats, LeftSeats, RightSeats, EmergencyExit) VALUES (2, 12, 6, 'ABC', 'DEF', 1);
INSERT INTO SeatRow (ConfigID, RowNumber, TotalSeats, LeftSeats, RightSeats, EmergencyExit) VALUES (2, 13, 6, 'ABC', 'DEF', 0);
INSERT INTO SeatRow (ConfigID, RowNumber, TotalSeats, LeftSeats, RightSeats, EmergencyExit) VALUES (2, 14, 6, 'ABC', 'DEF', 0);
INSERT INTO SeatRow (ConfigID, RowNumber, TotalSeats, LeftSeats, RightSeats, EmergencyExit) VALUES (2, 15, 6, 'ABC', 'DEF', 0);
INSERT INTO SeatRow (ConfigID, RowNumber, TotalSeats, LeftSeats, RightSeats, EmergencyExit) VALUES (2, 16, 6, 'ABC', 'DEF', 0);
INSERT INTO SeatRow (ConfigID, RowNumber, TotalSeats, LeftSeats, RightSeats, EmergencyExit) VALUES (2, 17, 6, 'ABC', 'DEF', 0);
INSERT INTO SeatRow (ConfigID, RowNumber, TotalSeats, LeftSeats, RightSeats, EmergencyExit) VALUES (2, 18, 6, 'ABC', 'DEF', 0);
INSERT INTO SeatRow (ConfigID, RowNumber, TotalSeats, LeftSeats, RightSeats, EmergencyExit) VALUES (2, 19, 6, 'ABC', 'DEF', 0);
INSERT INTO SeatRow (ConfigID, RowNumber, TotalSeats, LeftSeats, RightSeats, EmergencyExit) VALUES (2, 20, 6, 'ABC', 'DEF', 0);
INSERT INTO SeatRow (ConfigID, RowNumber, TotalSeats, LeftSeats, RightSeats, EmergencyExit) VALUES (2, 21, 6, 'ABC', 'DEF', 0);
INSERT INTO SeatRow (ConfigID, RowNumber, TotalSeats, LeftSeats, RightSeats, EmergencyExit) VALUES (2, 22, 6, 'ABC', 'DEF', 0);
INSERT INTO SeatRow (ConfigID, RowNumber, TotalSeats, LeftSeats, RightSeats, EmergencyExit) VALUES (2, 23, 6, 'ABC', 'DEF', 0);
INSERT INTO SeatRow (ConfigID, RowNumber, TotalSeats, LeftSeats, RightSeats, EmergencyExit) VALUES (2, 24, 6, 'ABC', 'DEF', 0);
INSERT INTO SeatRow (ConfigID, RowNumber, TotalSeats, LeftSeats, RightSeats, EmergencyExit) VALUES (2, 25, 6, 'ABC', 'DEF', 0);
INSERT INTO SeatRow (ConfigID, RowNumber, TotalSeats, LeftSeats, RightSeats, EmergencyExit) VALUES (2, 26, 6, 'ABC', 'DEF', 0);
INSERT INTO SeatRow (ConfigID, RowNumber, TotalSeats, LeftSeats, RightSeats, EmergencyExit) VALUES (2, 27, 6, 'ABC', 'DEF', 0);
INSERT INTO SeatRow (ConfigID, RowNumber, TotalSeats, LeftSeats, RightSeats, EmergencyExit) VALUES (2, 28, 6, 'ABC', 'DEF', 0);
INSERT INTO SeatRow (ConfigID, RowNumber, TotalSeats, LeftSeats, RightSeats, EmergencyExit) VALUES (2, 29, 6, 'ABC', 'DEF', 0);
INSERT INTO SeatRow (ConfigID, RowNumber, TotalSeats, LeftSeats, RightSeats, EmergencyExit) VALUES (2, 30, 6, 'ABC', 'DEF', 0);

INSERT INTO SeatRow (ConfigID, RowNumber, TotalSeats, LeftSeats, RightSeats, EmergencyExit) VALUES (3, 1, 2, '', 'CD', 0);
INSERT INTO SeatRow (ConfigID, RowNumber, TotalSeats, LeftSeats, RightSeats, EmergencyExit) VALUES (3, 2, 4, 'AB', 'CD', 0);
INSERT INTO SeatRow (ConfigID, RowNumber, TotalSeats, LeftSeats, RightSeats, EmergencyExit) VALUES (3, 3, 4, 'AB', 'CD', 0);
INSERT INTO SeatRow (ConfigID, RowNumber, TotalSeats, LeftSeats, RightSeats, EmergencyExit) VALUES (3, 4, 4, 'AB', 'CD', 0);
INSERT INTO SeatRow (ConfigID, RowNumber, TotalSeats, LeftSeats, RightSeats, EmergencyExit) VALUES (3, 5, 4, 'AB', 'CD', 1);
INSERT INTO SeatRow (ConfigID, RowNumber, TotalSeats, LeftSeats, RightSeats, EmergencyExit) VALUES (3, 6, 4, 'AB', 'CD', 0);
INSERT INTO SeatRow (ConfigID, RowNumber, TotalSeats, LeftSeats, RightSeats, EmergencyExit) VALUES (3, 7, 4, 'AB', 'CD', 0);
INSERT INTO SeatRow (ConfigID, RowNumber, TotalSeats, LeftSeats, RightSeats, EmergencyExit) VALUES (3, 8, 4, 'AB', 'CD', 0);
INSERT INTO SeatRow (ConfigID, RowNumber, TotalSeats, LeftSeats, RightSeats, EmergencyExit) VALUES (3, 9, 4, 'AB', 'CD', 0);
INSERT INTO SeatRow (ConfigID, RowNumber, TotalSeats, LeftSeats, RightSeats, EmergencyExit) VALUES (3, 10, 4, 'AB', 'CD', 0);

INSERT INTO Aircraft (RegNR, SN, AircraftName, FirstFlightYear, AirlineCode, TypeName, ManufacturerName)
VALUES ('LN-ENU', '42069', '', 2015, 'DY', 'Boeing 737 800', 'The Boeing Company');

INSERT INTO Aircraft (RegNR, SN, AircraftName, FirstFlightYear, AirlineCode, TypeName, ManufacturerName)
VALUES ('LN-ENR', '42093', 'Jan Bålsrud', 2018, 'DY', 'Boeing 737 800', 'The Boeing Company');

INSERT INTO Aircraft (RegNR, SN, AircraftName, FirstFlightYear, AirlineCode, TypeName, ManufacturerName)
VALUES ('LN-NIQ', '39403', 'Max Manus', 2011, 'DY', 'Boeing 737 800', 'The Boeing Company');

INSERT INTO Aircraft (RegNR, SN, AircraftName, FirstFlightYear, AirlineCode, TypeName, ManufacturerName)
VALUES ('LN-ENS', '42281', '', 2017, 'DY', 'Boeing 737 800', 'The Boeing Company');

INSERT INTO Aircraft (RegNR, SN, AircraftName, FirstFlightYear, AirlineCode, TypeName, ManufacturerName)
VALUES ('SE-RUB', '9518', 'Birger Viking', 2020, 'SK', 'Airbus a320neo', 'Airbus Group');

INSERT INTO Aircraft (RegNR, SN, AircraftName, FirstFlightYear, AirlineCode, TypeName, ManufacturerName)
VALUES ('SE-DIR', '11421', 'Nora Viking', 2023, 'SK', 'Airbus a320neo', 'Airbus Group');

INSERT INTO Aircraft (RegNR, SN, AircraftName, FirstFlightYear, AirlineCode, TypeName, ManufacturerName)
VALUES ('SE-RUP', '12066', 'Ragnhild Viking', 2024, 'SK', 'Airbus a320neo', 'Airbus Group');

INSERT INTO Aircraft (RegNR, SN, AircraftName, FirstFlightYear, AirlineCode, TypeName, ManufacturerName)
VALUES ('SE-RZE', '12166', 'Ebbe Viking', 2024, 'SK', 'Airbus a320neo', 'Airbus Group');

INSERT INTO Aircraft (RegNR, SN, AircraftName, FirstFlightYear, AirlineCode, TypeName, ManufacturerName)
VALUES ('LN-WIH', '383', 'Oslo', 1994, 'WF', 'Dash-8 100', 'De Havilland Canada');

INSERT INTO Aircraft (RegNR, SN, AircraftName, FirstFlightYear, AirlineCode, TypeName, ManufacturerName)
VALUES ('LN-WIA', '359', 'Nordland', 1993, 'WF', 'Dash-8 100', 'De Havilland Canada');

INSERT INTO Aircraft (RegNR, SN, AircraftName, FirstFlightYear, AirlineCode, TypeName, ManufacturerName)
VALUES ('LN-WIL', '298', 'Narvik', 1995, 'WF', 'Dash-8 100', 'De Havilland Canada');

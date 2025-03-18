PRAGMA foreign_keys = ON;

CREATE TABLE Airline (
    AirlineCode TEXT PRIMARY KEY,
    AirlineName TEXT
);

CREATE TABLE Manufacturer (
    ManufacturerName TEXT PRIMARY KEY,
    Nationality TEXT,
    YearFounded INTEGER
);

CREATE TABLE SeatConfig (
    ConfigID INTEGER PRIMARY KEY,
    ConfigName TEXT 
);

CREATE TABLE SeatRow (
    ConfigID INTEGER,
    RowNumber INTEGER,
    TotalSeats INTEGER,
    LeftSeats TEXT,
    RightSeats TEXT,
    EmergencyExit BOOLEAN, 
    PRIMARY KEY (ConfigID, RowNumber),
    FOREIGN KEY (ConfigID) REFERENCES SeatConfig(ConfigID)
        ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE Airport (
    AirportCode TEXT PRIMARY KEY,
    AirportName TEXT UNIQUE
);

CREATE TABLE Customer (
    CustomerID INTEGER PRIMARY KEY,
    Name TEXT,
    Phone TEXT,
    Email TEXT,
    Nationality TEXT
);

CREATE TABLE AircraftType (
    TypeName TEXT PRIMARY KEY,
    ManufacturerName TEXT NOT NULL,
    ProdStart INTEGER,
    ProdEnd INTEGER,
    ConfigID INTEGER NOT NULL,
    FOREIGN KEY (ManufacturerName) REFERENCES Manufacturer(ManufacturerName)
        ON DELETE RESTRICT ON UPDATE CASCADE,
    FOREIGN KEY (ConfigID) REFERENCES SeatConfig(ConfigID)
        ON DELETE RESTRICT ON UPDATE CASCADE
);

CREATE TABLE Aircraft (
    RegNR TEXT PRIMARY KEY,
    SN TEXT,
    AircraftName TEXT,
    FirstFlightYear INTEGER,
    AirlineCode TEXT NOT NULL,
    TypeName TEXT NOT NULL,
    ManufacturerName TEXT NOT NULL,
    FOREIGN KEY (AirlineCode) REFERENCES Airline(AirlineCode)
        ON DELETE RESTRICT ON UPDATE CASCADE,
    FOREIGN KEY (TypeName) REFERENCES AircraftType(TypeName)
        ON DELETE RESTRICT ON UPDATE CASCADE,
    FOREIGN KEY (ManufacturerName) REFERENCES Manufacturer(ManufacturerName)
        ON DELETE RESTRICT ON UPDATE CASCADE,
    UNIQUE (ManufacturerName, SN)
);

CREATE TABLE LoyalityProgram (
    ProgramCode TEXT PRIMARY KEY,
    AirlineCode TEXT NOT NULL,
    ProgramName TEXT,
    FOREIGN KEY (AirlineCode) REFERENCES Airline(AirlineCode)
        ON DELETE RESTRICT ON UPDATE CASCADE
);

CREATE TABLE FlightRoute (
    RouteID TEXT,
    WeekdayCode TEXT,
    AirlineCode TEXT NOT NULL,
    StartDate DATE,
    EndDate DATE,
    TypeName TEXT NOT NULL,
    PRIMARY KEY (RouteID, WeekdayCode),
    FOREIGN KEY (AirlineCode) REFERENCES Airline(AirlineCode)
        ON DELETE RESTRICT ON UPDATE CASCADE,
    FOREIGN KEY (TypeName) REFERENCES AircraftType(TypeName)
        ON DELETE RESTRICT ON UPDATE CASCADE
);

CREATE TABLE FlightSegment (
    SegmentID TEXT PRIMARY KEY,
    RouteID TEXT NOT NULL,
    WeekdayCode TEXT NOT NULL,
    Origin TEXT NOT NULL,
    Destination TEXT NOT NULL,
    DepartureTime TIME,
    ArrivalTime TIME,
    FOREIGN KEY (RouteID, WeekdayCode) REFERENCES FlightRoute(RouteID, WeekdayCode)
        ON DELETE CASCADE ON UPDATE CASCADE,
    FOREIGN KEY (Origin) REFERENCES Airport(AirportCode)
        ON DELETE RESTRICT ON UPDATE CASCADE,
    FOREIGN KEY (Destination) REFERENCES Airport(AirportCode)
        ON DELETE RESTRICT ON UPDATE CASCADE
);

CREATE TABLE Flight (
    FlightNumber TEXT PRIMARY KEY,
    RegNR TEXT,
    SegmentID TEXT NOT NULL,
    Date DATE,
    Status TEXT CHECK(Status IN ('Planned', 'Cancelled', 'Ongoing', 'Finished')),
    ActualDepartureTime DATETIME,
    ActualArrivalTime DATETIME,
    FOREIGN KEY (RegNR) REFERENCES Aircraft(RegNR)
        ON DELETE SET NULL ON UPDATE CASCADE,
    FOREIGN KEY (SegmentID) REFERENCES FlightSegment(SegmentID)
        ON DELETE RESTRICT ON UPDATE CASCADE
    UNIQUE (SegmentID, Date)
);

CREATE TABLE PriceList (
    PriceListID TEXT PRIMARY KEY,
    SegmentID TEXT NOT NULL,
    Category TEXT CHECK (Category IN ('Economy', 'Business', 'Premium')),
    CategoryPrice NUMERIC,
    FOREIGN KEY (SegmentID) REFERENCES FlightSegment(SegmentID)
        ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE Booking (
    BookingRef INTEGER PRIMARY KEY,
    CustomerID INTEGER NOT NULL,
    LoyalityRef TEXT,
    BookingDate DATE,
    TotalPrice NUMERIC,
    Status TEXT CHECK (Status IN ('Active', 'Inactive', 'Pending')),
    FOREIGN KEY (CustomerID) REFERENCES Customer(CustomerID)
        ON DELETE RESTRICT ON UPDATE CASCADE,
    FOREIGN KEY (LoyalityRef) REFERENCES LoyalityProgram(ProgramCode)
        ON DELETE SET NULL ON UPDATE CASCADE
);

CREATE TABLE Ticket (
    ReferenceID INTEGER PRIMARY KEY,
    FlightNumber TEXT NOT NULL,
    PriceListID TEXT NOT NULL,
    SoldPrice NUMERIC, 
    BoardingTime DATETIME,
    EarliestCheckInTime DATETIME,
    RegisteredCheckInTime DATETIME,
    BookingID INTEGER NOT NULL,
    FOREIGN KEY (FlightNumber) REFERENCES Flight(FlightNumber)
        ON DELETE RESTRICT ON UPDATE CASCADE,
    FOREIGN KEY (PriceListID) REFERENCES PriceList(PriceListID)
        ON DELETE RESTRICT ON UPDATE CASCADE,
    FOREIGN KEY (BookingID) REFERENCES Booking(BookingRef)
        ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE BookedSeat (
    FlightNumber TEXT NOT NULL,
    Seat TEXT NOT NULL,
    TicketID INTEGER,
    PRIMARY KEY (FlightNumber, Seat),
    FOREIGN KEY (FlightNumber) REFERENCES Flight(FlightNumber)
        ON DELETE CASCADE ON UPDATE CASCADE,
    FOREIGN KEY (TicketID) REFERENCES Ticket(ReferenceID)
        ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE ProgramMembers (
    LoyalityRef TEXT PRIMARY KEY,
    ProgramCode TEXT NOT NULL,
    CustomerID INTEGER NOT NULL,
    FOREIGN KEY (ProgramCode) REFERENCES LoyalityProgram(ProgramCode)
        ON DELETE CASCADE ON UPDATE CASCADE,
    FOREIGN KEY (CustomerID) REFERENCES Customer(CustomerID)
        ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE Luggage (
    LuggageID INTEGER PRIMARY KEY,
    BookingRef INTEGER NOT NULL,
    Weight NUMERIC,
    LatestDropOfTime DATETIME,
    RegisteredDropOfTime DATETIME,
    FOREIGN KEY (BookingRef) REFERENCES Booking(BookingRef)
        ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE LuggageOnFlight (
    LuggageID INTEGER NOT NULL,
    FlightNR TEXT NOT NULL,
    PRIMARY KEY (LuggageID, FlightNR),
    FOREIGN KEY (LuggageID) REFERENCES Luggage(LuggageID)
        ON DELETE CASCADE ON UPDATE CASCADE,
    FOREIGN KEY (FlightNR) REFERENCES Flight(FlightNumber)
        ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE AirportHasIncommingRoute (
    AirportCode TEXT NOT NULL,
    SegmentID TEXT NOT NULL,
    PRIMARY KEY (AirportCode, SegmentID),
    FOREIGN KEY (AirportCode) REFERENCES Airport(AirportCode)
        ON DELETE CASCADE ON UPDATE CASCADE,
    FOREIGN KEY (SegmentID) REFERENCES FlightSegment(SegmentID)
        ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE AirportHasOutgoingRoute (
    AirportCode TEXT NOT NULL,
    SegmentID TEXT NOT NULL,
    PRIMARY KEY (AirportCode, SegmentID),
     FOREIGN KEY (AirportCode) REFERENCES Airport(AirportCode)
        ON DELETE CASCADE ON UPDATE CASCADE,
    FOREIGN KEY (SegmentID) REFERENCES FlightSegment(SegmentID)
        ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TRIGGER SetSoldPriceOnTicket
AFTER INSERT ON Ticket
FOR EACH ROW
WHEN NEW.SoldPrice IS NULL
BEGIN
    UPDATE Ticket
    SET SoldPrice = (
        SELECT CategoryPrice 
        FROM PriceList 
        WHERE PriceListID = NEW.PriceListID
    )
    WHERE ReferenceID = NEW.ReferenceID;
END;

CREATE TRIGGER EnforceTicketFlightStatus
BEFORE INSERT ON Ticket
FOR EACH ROW
BEGIN
    SELECT CASE 
        WHEN ( (SELECT Status 
                FROM Flight 
                WHERE FlightNumber = NEW.FlightNumber) != 'Planned' )
        THEN RAISE(ABORT, 'Tickets can only be sold for planned flights')
    END;
END;

CREATE TRIGGER UpdateBookingTotalAfterInsert
AFTER INSERT ON Ticket
BEGIN
    UPDATE Booking
    SET TotalPrice = (
        SELECT SUM(SoldPrice)
        FROM Ticket
        WHERE BookingID = NEW.BookingID
    )
    WHERE BookingRef = NEW.BookingID;
END;
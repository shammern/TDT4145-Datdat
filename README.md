<!-- NOTE: In VS Code, right-click README.md and select “Open Preview” to view the formatted document. -->

# TDT4145 - Datamodellering og Databasesystemer: Project Part 2

## Table of Contents
- [Overview](#overview)
  - [Project Contributors](#project-contributors)
- [Requirements](#requirements)
- [Project Initialization (Use Case 1-4)](#project-initialization-use-case-1-4)
- [Database Operations and Queries](#database-operations-and-queries)
  - [Retrieving Airline and Aircraft Data (Use Case 5)](#retrieving-airline-and-aircraft-data-use-case-5)
  - [Airport Schedule Lookup (Use Case 6)](#airport-schedule-lookup-use-case-6)
  - [Booking Flights (Use Case 7)](#booking-flights-use-case-7)
  - [Finding Available Seats on Flights (Use Case 8)](#finding-available-seats-on-flights-use-case-8)

## Overview
This project is developed as part of **TDT4145 - Datamodellering og Databasesystemer** and is implemented using **VS Code** and **SQLite3**.  
It focuses on designing and managing a relational database to support various use cases in database management.

For a detailed project description, see [`docs/project_description.pdf`](docs/project_description.pdf).

### **Project Contributors:**
- Erik Alexander Standal
- Torstein Pundsnes
- Sigve Semdshammer

## Requirements
Before running the project, ensure that the following are installed and set up:

- **Editor:**  
  - **Visual Studio Code (VS Code)** - recommended for running queries.
- **VS Code Extensions:**
  - **SQLite** - Work with SQLite databases in VS Code.
  - **SQLite Viewer** - View and explore SQLite databases.
  - Optional: **vscode-pdf** – View PDFs in the [`docs`](docs) folder.

## Project Initialization (Use Case 1-4)

This section covers the process of setting up the database and inserting initial data to ensure the system is ready for further operations.

#### **Steps to Initialize the Database:**

1. **Verify or Create the Database**
    - Open the project directory and locate [`data/Project_DB.db`](data/Project_DB.db).  
    - If the file exists but is **not empty**, delete it and create a new database file named "Project_DB.db" in the [`data`](data) folder.  
        - The file **must** have this exact name for the Python scripts to work.

2. **Run Database Initialization Script**
    - Open [`init/DB_Init.sql`](init/DB_Init.sql) in VS Code.  
    - Press `CTRL + SHIFT + P` → Select `SQLite: Run Query`.
    - When prompted, select [`data/Project_DB.db`](data/Project_DB.db).  

3. **Insert Sample Data**
    - Open [`init/DB_Insertions.sql`](init/DB_Insertions.sql) in VS Code.  
    - Press `CTRL + SHIFT + P` → Select `SQLite: Run Query`.
    - Select [`data/Project_DB.db`](data/Project_DB.db) (same file as in Step 2).

4. **Verify Database Initialization**
    - Navigate to [`data/Project_DB.db`](data/Project_DB.db) and click the **refresh button (top left)**.  
        - Some tables may remain empty, depending on the dataset.

The database is now initialized with entries as described in Use Cases 1-4.

## Database Operations and Queries

### **Retrieving Airline and Aircraft Data (Use Case 5)**
---
This use case allows users to retrieve information about airlines, aircraft types, and the number of aircraft in the fleet using SQL queries.

#### **Steps to Retrieve Airline and Aircraft Data:**  

1. **Open the Query File:**
   - Navigate to the [`sql_operations/use_case_5.sql`](sql_operations/use_case_5.sql) file in **VS Code**.

2. **Execute the SQL Query:**
   - Press `CTRL + SHIFT + P` → Select `SQLite: Run Query`.
   - Select [`data/Project_DB.db`](data/Project_DB.db).

3. **View Query Results:**
   - The results will be displayed in the right-side panel of **VS Code**.

### **Airport Schedule Lookup (Use Case 6)**  
---
This use case allows users to retrieve flight schedules from the database based on selected parameters.

#### **Steps to Check Flight Schedules:**

1. **Open the Script:**
   - Navigate to [`py_operations/use_case_6.py`](py_operations/use_case_6.py) in **VS Code**.

2. **Select a Python Interpreter:**
   - Press `CTRL + SHIFT + P` → Select `Python: Select Interpreter`.
   - Choose an interpreter that supports SQLite (e.g., one with Python 3.x installed).

3. **Run the Script:**
   - Press `CTRL + SHIFT + P` → Select `Python: Run Python File in Terminal`.

4. **Interact with the Terminal:**
   - The script will prompt you to:
     - Choose an **airport** from the database.
     - Select a **day of the week**.
     - Specify whether you want **departures** or **arrivals**.
   - After inputting these details, the script will fetch and display the relevant flight schedules.

### **Booking Flights (Use Case 7)**
---
This use case allows users to place flight reservations in the system.

#### **Steps to Book a Flight:**

1. **Open the Script:**
   - Navigate to [`py_operations/use_case_7.sql`](py_operations/use_case_7.py) in **VS Code**.

2. **Run the Script:**
   - Press `CTRL + SHIFT + P` → Select `Python: Run Python File in Terminal`.
   - Select the script and execute it.

3. **Interact with the Terminal:**
   - The script will prompt the user to:
     - Select a **flight number**.
     - Enter **passenger details**.

4. **Automatic Execution of the SQL Booking Process**  
   - The Python script will automatically execute [`sql_operations/book_flight.sql`](sql_operations/book_flight.sql) to process the reservation.

5. **Verify Booking:**
   - The system will store the reservation in the database.

### **Finding Available Seats on Flights (Use Case 8)**
---
This use case allows users to check seat availability on specific flights.

#### **Steps to Find Available Seats:**

1. **Open the Script:**
   - Navigate to [`py_operations/use_case_8.py`](py_operations/use_case_8.py) in **VS Code**.

2. **Run the Script:**
   - Press `CTRL + SHIFT + P` → Select `Python: Run Python File in Terminal`.
   - Select the script and execute it.

3. **Provide Search Criteria:**
   - The script will prompt the user to:
     - Enter a **flight number**.
     - Choose a **departure date**.

4. **View Available Seats:**
   - The system will query the database and display a list of open seats.
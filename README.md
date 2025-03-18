# TDT4145 - Datamodellering og Databasesystemer: Project

## Overview
This project has been implemented using **VS Code** and **SQLite3**.

## Requirements
Ensure you have the following installed before running the project:

- **Extensions:** SQLite, SQLite Viewer (VS Code)
- **Database:** An empty database file (**Project_DB.db**) is provided
- **Editor:** Visual Studio Code (VS Code)

## Project Initialization
Follow these steps to initialize the database:

### 1. Verify or Create the Database
- Navigate to `Project_DB.db` to ensure it is empty.
- If the database is not empty, delete `Project_DB.db` and create a new database file named **Project_DB.db** (the name must match exactly for the Python scripts to function properly).

### 2. Run Database Initialization Script
- Open `InitFiles/DB_Init.sql`
- Press **CTRL + SHIFT + P** → Select **SQLite: Run Query**
- Choose **Project_DB.db** when prompted.
- Ensure that you have selected the correct database file; otherwise, queries may not execute as expected.

### 3. Insert Sample Data
- Open `InitFiles/DB_Insertions.sql`
- Press **CTRL + SHIFT + P** → Select **SQLite: Run Query**
- Choose **Project_DB.db** (same as in Step 2).
- Some tables may remain empty after this step, depending on the dataset.

### 4. Verify Database Initialization
- Open **SQLite Viewer** in VS Code.
- Navigate to **Project_DB.db** and click the **refresh button (top left)**.
- Some tables will contain data, while others might be empty. This is expected behavior.
- The database is now initialized with entries described in Use Cases 1-4.

## Running Queries
To execute queries from the provided SQL script:

1. Open **Queries.sql**
2. Press **CTRL + SHIFT + P** → Select **SQLite: Run Query**
3. Choose **Project_DB.db**  
4. The query results should be displayed in the right-side panel in VS Code.
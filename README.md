# TDT4145 - Datamodellering og Databasesystemer: Project

## Table of Contents
- [Overview](#overview)
- [Requirements](#requirements)
- [Project Initialization](#project-initialization)
- [Running Queries](#running-queries)

## Overview
This project is developed as part of **TDT4145 - Datamodellering og Databasesystemer** and is implemented using **VS Code** and **SQLite3**.  
It focuses on designing and managing a relational database to support various use cases in database management.

## Requirements
Before running the project, ensure that the following are installed and set up:

- **VS Code Extensions:**
  - SQLite
  - SQLite Viewer
- **Database File:**  
  - An empty database file (`Project_DB.db`) is provided in the project directory.
- **Editor:**  
  - **Visual Studio Code (VS Code)** is recommended for running queries.

## Project Initialization
Follow these steps to initialize the database:

1. **Verify or Create the Database**
    - Open the project directory and locate `Project_DB.db`.  
    - If the file exists but is **not empty**, delete it and create a new database file named `Project_DB.db`.  
        - The file **must** have this exact name for the Python scripts to work.

2. **Run Database Initialization Script**
    - Open `InitFiles/DB_Init.sql` in VS Code.  
    - Press **CTRL + SHIFT + P** → Select **SQLite: Run Query**
    - When prompted, select `Project_DB.db`.  

3. **Insert Sample Data**
    - Open `InitFiles/DB_Insertions.sql` in VS Code.  
    - Press **CTRL + SHIFT + P** → Select **SQLite: Run Query**
    - Select `Project_DB.db` (same file as in Step 2).

4. **Verify Database Initialization**
    - Open **SQLite Viewer** in VS Code.  
    - Navigate to `Project_DB.db` and click the **refresh button (top left)**.  
        - Some tables may remain empty, depending on the dataset.
    - The database is now initialized with entries as described in Use Cases 1-4.

## Running Queries
To execute SQL queries:

1. Open **Queries.sql** in VS Code.  
2. Press **CTRL + SHIFT + P** → Select **SQLite: Run Query**
3. Select `Project_DB.db`.  
4. The query results will be displayed in the right-side panel in VS Code.
TDT4145 Datamodellering og databasesyster - Project

NOTE: 
This project has been realized using VScode and sqlite3

Reqirements:
    - Extensions: SQLite, SQLite Viewer
    - Empty DB, provided is Project_DB.db
    - VScode

Initizialisation of project:
    0. Verify that Project_DB is empty by navigating to it and viewing with SQLite Viewer
    1. When in DB_Init.sql press CTRL + SHIFT + P -> SQLite: Run Query
    2. Select Project_DB.db (or another empty DB)
    3. Go to DB_Insertions.sql, press CTRL + SHIFT + P -> SQLite: Run Query
    4. Select Project_DB.db (the same as in step 2)
    5. Verify that DB has been created and filled with entries by navigating to it and viewing with SQLite Viewer (Hit refresh button top left)
    6. The DB will now have been initilized and filled with entires described in usecase 1-4

Queries:
    1. When in Queries.sql press CTRL + SHIFT + P -> SQLite: Run Query
    2. Select Project_DB.db
    3. The result should be shown in window on right side in VScode


Erik's comments:
 - In requirements there isnt an empty DB, needed to delete existing one and make a new file
 - In init:
    0. How do i view it with SQLite Viewer?
    1. Maybe change to "When in Initfiles/DB_Init.sql press CTRL + SHIFT + P -> SQLite: Run Query".
    2. Good
    3. Same as in stage 1.
    4. Good
    5. Good, maybe mention that some tables should and will be empty
    6. Good
- Queries:
    1. Good
    2. Good
    3. Good
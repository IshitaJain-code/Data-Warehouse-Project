/*
===============================================================================
Create Database and Schemas
===============================================================================

Script Purpose:
    This script creates a new PostgreSQL database named 'nykaa_dw'.

    If the database already exists, it should be dropped before recreating it
    (run while connected to the 'postgres' database).

    After connecting to 'nykaa_dw', this script creates the following schemas:

        • bronze  - Raw data layer
        • silver  - Cleaned and standardized data layer
        • gold    - Business-ready dimensional model

Loading Strategy:
    Full Refresh (TRUNCATE + INSERT)

WARNING:
    Executing the database recreation script will permanently delete the
    existing 'nykaa_dw' database and all of its contents.

    Ensure you have backed up any important data before running the script.

===============================================================================
*/


--Drop if DB already exists
DROP DATABASE IF EXISTS nykaa_dw;

--Create the 'nykaa_dw' database
CREATE DATABASE nykaa_dw;


/*
===============================================================================
Create Bronze, Silver and Gold Schemas
===============================================================================

Script Purpose:

This script creates the schemas used in the Medallion Architecture.

bronze → Raw source data

silver → Cleaned and transformed data

gold → Analytics-ready Star Schema

===============================================================================
*/


CREATE SCHEMA Bronze;

CREATE SCHEMA Silver;

CREATE SCHEMA Gold;

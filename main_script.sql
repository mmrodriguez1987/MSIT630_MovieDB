
-- Drop the database if exist
DROP DATABASE IF EXISTS MovieDB;
-- Create the database
CREATE DATABASE IF NOT EXISTS MovieDB;

-- Use database
USE MovieDB;

-- Execute the scripts
source db_definition.sql;
source db_data.sql;
source queries.sql;
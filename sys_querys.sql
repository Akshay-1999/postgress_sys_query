-- Query to find all columns with the data type 'timestamp without time zone'
SELECT table_schema, table_name, column_name, data_type
FROM information_schema.columns
WHERE data_type IN ('timestamp without time zone')
ORDER BY table_schema, table_name;
--helps to identify all relevant columns in the database with the data type

-- Query to check the current timezone setting of the database
SHOW timezone;


-- Generate ALTER TABLE statements to convert 'timestamp without time zone' columns to 'timestamptz'
-- Assuming the intended timezone is UTC; adjust as necessary
SELECT 'ALTER TABLE ' || table_name || 
       ' ALTER COLUMN ' || column_name || 
       ' TYPE timestamptz USING ' || column_name || ' AT TIME ZONE ''UTC'';'
FROM information_schema.columns
WHERE data_type = 'timestamp without time zone';
-- this helps to generate the necessary SQL commands to perform the conversion
-- Note: Execute the generated commands separately after reviewing them
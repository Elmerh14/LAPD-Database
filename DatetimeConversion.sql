-- Step 1: Add temporary columns
ALTER TABLE incident 
ADD COLUMN Date_OCC_temp DATETIME,
ADD COLUMN Date_Rptd_temp DATETIME,
ADD COLUMN Time_OCC_temp TIME;

-- Step 2: Convert and copy values
UPDATE incident
SET 
  Date_OCC_temp = STR_TO_DATE(Date_OCC, '%m/%d/%Y %r'),
  Date_Rptd_temp = STR_TO_DATE(Date_Rptd, '%m/%d/%Y %r'),
  Time_OCC_temp = STR_TO_DATE(Time_OCC, '%H%i');

-- Step 3: Drop the original VARCHAR columns
ALTER TABLE incident 
DROP COLUMN Date_OCC,
DROP COLUMN Date_Rptd,
DROP COLUMN Time_OCC;

-- Step 4: Rename the temp columns to original names
ALTER TABLE incident 
CHANGE Date_OCC_temp Date_OCC DATETIME,
CHANGE Date_Rptd_temp Date_Rptd DATETIME,
CHANGE Time_OCC_temp Time_OCC TIME;

USE global_energy_consumption;

-- =====================================================
-- CREATE CLEANED TABLE
-- =====================================================

DROP TABLE IF EXISTS cleaned_energy_data;

CREATE TABLE cleaned_energy_data AS
SELECT
    TRIM(Country) AS country,
    Year AS year,

    `Total Energy Consumption (TWh)` AS total_energy_twh,
    `Per Capita Energy Use (kWh)` AS per_capita_energy_kwh,
    `Renewable Energy Share (%)` AS renewable_share_pct,
    `Fossil Fuel Dependency (%)` AS fossil_dependency_pct,
    `Industrial Energy Use (%)` AS industrial_energy_pct,
    `Household Energy Use (%)` AS household_energy_pct,
    `Carbon Emissions (Million Tons)` AS carbon_emissions_mt,
    `Energy Price Index (USD/kWh)` AS energy_price

FROM global_energy_consumption;

-- =====================================================
-- Chechking data types
-- =====================================================
SELECT 
    COLUMN_NAME, 
    DATA_TYPE, 
    COLUMN_TYPE
FROM 
    information_schema.COLUMNS 
WHERE 
    TABLE_NAME = 'cleaned_energy_data';

-- =====================================================
-- REMOVE NULL OR INVALID VALUES
-- =====================================================
SELECT 
    COUNT(*) AS total_rows,
    SUM(country IS NULL) AS null_country,
    SUM(year IS NULL) AS null_year,
    SUM(total_energy_twh IS NULL) AS null_energy
FROM cleaned_energy_data;

SET SQL_SAFE_UPDATES = 0;
DELETE FROM cleaned_energy_data
WHERE country IS NULL
   OR year IS NULL
   OR total_energy_twh IS NULL;
   
-- =====================================================
-- Remove duplicates
-- =====================================================
CREATE TABLE temp_deduplicated AS
SELECT DISTINCT *
FROM cleaned_energy_data;

DROP TABLE cleaned_energy_data;

RENAME TABLE temp_deduplicated TO cleaned_energy_data;  
 
-- =====================================================
-- Remove extra spaces in country names
-- =====================================================
UPDATE cleaned_energy_data
SET country = TRIM(country);


-- =====================================================
-- ADD DERIVED COLUMNS
-- =====================================================

ALTER TABLE cleaned_energy_data
ADD COLUMN renewable_ratio DECIMAL(5,2),
ADD COLUMN fossil_ratio DECIMAL(5,2);

-- Calculate ratios
UPDATE cleaned_energy_data
SET 
    renewable_ratio = renewable_share_pct / 100,
    fossil_ratio = fossil_dependency_pct / 100;
    
-- =====================================================
-- ADD Waste or Other Energy
-- =====================================================    
ALTER TABLE cleaned_energy_data ADD COLUMN other_sector_pct DECIMAL(5,2);

UPDATE cleaned_energy_data 
SET other_sector_pct = ROUND(100 - (industrial_energy_pct + household_energy_pct), 2);

-- =====================================================
-- ADD Carbon per Unit of Energy
-- =====================================================
ALTER TABLE cleaned_energy_data ADD COLUMN pollution_score DECIMAL(10,4);

UPDATE cleaned_energy_data 
SET pollution_score = ROUND(carbon_emissions_mt / total_energy_twh, 4);

-- =====================================================
-- ADD Renewable vs Fossil Ratio
-- =====================================================
ALTER TABLE cleaned_energy_data ADD COLUMN green_dominance DECIMAL(10,2);

UPDATE cleaned_energy_data 
SET green_dominance = ROUND(renewable_ratio / fossil_ratio, 2);

SELECT * FROM cleaned_energy_data;
   
   


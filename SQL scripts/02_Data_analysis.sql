USE global_energy_consumption;

-- =====================================================
-- GLOBAL ENERGY TREND OVER TIME
-- =====================================================

SELECT 
    year,
    SUM(total_energy_twh) AS total_energy,
    SUM(carbon_emissions_mt) AS total_emissions
FROM cleaned_energy_data
GROUP BY year
ORDER BY year;

-- =====================================================
-- TOP 10 COUNTRIES BY TOTAL ENERGY CONSUMPTION
-- =====================================================

SELECT 
    country,
    SUM(total_energy_twh) AS total_energy
FROM cleaned_energy_data
GROUP BY country
ORDER BY total_energy DESC
LIMIT 10;

-- =====================================================
-- TOP 10 COUNTRIES BY RENEWABLE SHARE
-- =====================================================

SELECT 
    country,
    AVG(renewable_share_pct) AS avg_renewable_share
FROM cleaned_energy_data
GROUP BY country
ORDER BY avg_renewable_share DESC
LIMIT 10;

-- =====================================================
-- MOST FOSSIL FUEL DEPENDENT COUNTRIES
-- =====================================================

SELECT 
    country,
    AVG(fossil_dependency_pct) AS avg_fossil_dependency
FROM cleaned_energy_data
GROUP BY country
ORDER BY avg_fossil_dependency DESC
LIMIT 10;

-- =====================================================
-- COUNTRIES WITH HIGHEST CARBON INTENSITY
-- =====================================================

SELECT 
    country,
    AVG(pollution_score) AS avg_pollution_score
FROM cleaned_energy_data
GROUP BY country
ORDER BY avg_pollution_score DESC
LIMIT 10;

-- =====================================================
-- GREEN DOMINANT COUNTRIES
-- =====================================================

SELECT 
    country,
    AVG(green_dominance) AS green_score
FROM cleaned_energy_data
GROUP BY country
HAVING green_score > 1
ORDER BY green_score DESC;

-- =====================================================
-- FOSSIL DEPENDENT COUNTRIES
-- =====================================================

SELECT 
    country,
    AVG(green_dominance) AS green_score
FROM cleaned_energy_data
GROUP BY country
HAVING green_score < 1
ORDER BY green_score ASC;

-- =====================================================
-- PER CAPITA ENERGY CONSUMPTION (TOP 10)
-- =====================================================

SELECT 
    country,
    AVG(per_capita_energy_kwh) AS avg_per_capita_energy
FROM cleaned_energy_data
GROUP BY country
ORDER BY avg_per_capita_energy DESC
LIMIT 10;

-- =====================================================
-- ENERGY PRICE VS CONSUMPTION RELATION
-- =====================================================

SELECT 
    country,
    AVG(energy_price) AS avg_price,
    AVG(total_energy_twh) AS avg_energy
FROM cleaned_energy_data
GROUP BY country
ORDER BY avg_price DESC;

-- =====================================================
-- SECTORAL ENERGY DISTRIBUTION
-- =====================================================

SELECT 
    country,
    AVG(industrial_energy_pct) AS industrial_avg,
    AVG(household_energy_pct) AS household_avg,
    AVG(other_sector_pct) AS other_avg
FROM cleaned_energy_data
GROUP BY country
ORDER BY industrial_avg DESC;

-- =====================================================
-- RENEWABLE GROWTH TREND (YEARLY)
-- =====================================================

SELECT 
    year,
    AVG(renewable_share_pct) AS avg_renewable_share
FROM cleaned_energy_data
GROUP BY year
ORDER BY year;

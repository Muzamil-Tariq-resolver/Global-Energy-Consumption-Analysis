## Overview
End-to-end data analytics for analyzing global energy consumption patterns across countries and over time. It combines SQL-based data transformation with Tableau visualizations to explore energy demand, carbon emissions, and the transition from fossil fuels to renewable energy sources.

Emphasizes a structured, data-driven approach to uncover trends, compare national energy systems, and evaluate sustainability through engineered metrics and interactive dashboards.

---

## Objectives
- Analyze long-term global energy consumption and emissions trends  
- Compare renewable and fossil fuel usage using derived indicators  
- Identify differences in sectoral energy distribution across countries  
- Evaluate carbon intensity and energy efficiency at the country level  
- Develop interactive dashboards to support data exploration and insight generation  

---

## Tools and Technologies
- SQL: Data cleaning, transformation, and feature engineering  
- Tableau: Interactive dashboards and visual analytics  

---

## Dataset
The dataset consists of country-level energy metrics observed over multiple years. Each record represents a country-year combination with key indicators related to energy consumption, emissions, and sectoral usage.

### Feature Description
- Country: Name of the country  
- Year: Year of observation  
- Total Energy Consumption (TWh): Total energy consumed  
- Per Capita Energy Use (kWh): Average energy consumption per person  
- Renewable Energy Share (%): Share of energy from renewable sources  
- Fossil Fuel Dependency (%): Share of energy from fossil fuels  
- Industrial Energy Use (%): Energy used by industry  
- Household Energy Use (%): Energy used by households  
- Carbon Emissions (MT): Total carbon emissions  
- Energy Price (USD/kWh): Average energy cost  

---

## Feature Engineering
To enhance analytical depth, additional metrics were derived using SQL:

- Other Sector (%):  
  `100 - (Industrial % + Household %)`  
  Captures energy usage from transport, infrastructure, and other sectors  

- Pollution Score (Carbon Intensity):  
  `Carbon Emissions / Total Energy`  
  Measures emissions produced per unit of energy  

- Green Dominance:  
  `Renewable Ratio / Fossil Ratio`  
  Indicates whether renewable growth outpaces fossil fuel dependency  

- Renewable Energy (TWh):  
  `Total Energy * Renewable Ratio`  
  Converts percentage share into absolute renewable energy output  

- Year-over-Year Growth (%):  
  Measures annual change in energy and renewable metrics to capture volatility  

---

## Dashboard Overview

### 1. Global Trends Dashboard
Focuses on time-based analysis of global energy systems:
- Energy–Emissions Over Time  
- Energy Growth (YoY)  
- Decoupling Index  
- Renewable Growth  

### 2. Country-Level Analysis Dashboard
Provides comparative insights across countries:
- Carbon Intensity  
- Green Dominance  
- Energy by Sector  
- Price vs Consumption  

---

## Key Insights

- Global energy consumption is increasing steadily, but growth is non-linear and influenced by external factors  
- The 2020 spike represents an abnormal surge, followed by stabilization in subsequent years  
- High energy consumption does not necessarily imply high emissions efficiency; significant variation exists across countries  
- Renewable energy adoption is progressing globally, with no single country dominating the transition  
- Industrial activity is the primary driver of energy demand across all analyzed countries  
- Energy growth is highly volatile, with clear cycles of decline and recovery  
- Larger economies tend to exhibit higher energy volatility compared to more stable systems  
- Recent trends show periods where emissions are rising faster than energy consumption, indicating continued reliance on fossil fuels  

---

## Structure
- SQL Scripts: Data cleaning, transformation, and feature engineering  
- Tableau Dashboards: Interactive visualizations and insights  
- Documentation: Project explanation and analytical findings   

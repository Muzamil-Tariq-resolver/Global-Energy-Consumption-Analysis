# Global Energy Analytics Pipeline

## Overview
This project presents an end-to-end data analytics pipeline to analyze global energy consumption patterns, compare fossil fuel and renewable energy usage, and explore country-level energy trends. The project focuses on data cleaning, transformation, and analytical querying using SQL, followed by interactive dashboard development in Tableau.

The objective is to generate meaningful insights into global energy usage and the transition toward renewable energy sources through structured data analysis and visualization.

---

## Objectives
* **Analyze** long-term global energy consumption trends.
* **Compare** fossil fuel and renewable energy usage through engineered ratios.
* **Identify** country-level differences in energy sector distribution.
* **Evaluate** renewable energy adoption and carbon intensity across countries.
* **Build** interactive dashboards for data exploration and insights.

---

## Tools and Technologies
* **SQL:** Data cleaning, schema management, and feature engineering.
* **Tableau:** Interactive dashboards and data visualization.

---

## Dataset
The dataset contains country-level energy consumption metrics across multiple years. Each row represents a country-year observation with various energy-related indicators.

### Features Description
* **Country:** Name of the country.
* **Year:** Year of observation.
* **Total Energy Consumption (TWh):** Total energy consumed in terawatt-hours.
* **Per Capita Energy Use (kWh):** Average energy consumption per person.
* **Renewable Energy Share (%):** Percentage of total energy from renewable sources.
* **Fossil Fuel Dependency (%):** Percentage of energy derived from fossil fuels.
* **Industrial Energy Use (%):** Share of energy consumed by the industrial sector.
* **Household Energy Use (%):** Share of energy consumed by households.
* **Carbon Emissions (Million Tons):** Total carbon emissions produced.
* **Energy Price Index (USD/kWh):** Average energy price per kilowatt-hour.

### Engineered Metrics
To deepen the analysis, the following standardized columns were created using SQL:
* **Other Sector %:** `100 - (Industrial % + Household %)` — Calculates non-industrial/non-household usage.
* **Pollution Score:** `Carbon Emissions / Total Energy` — Measures carbon intensity.
* **Green Dominance:** `Renewable Ratio / Fossil Ratio` — A ratio to identify leading "green" transition nations. 

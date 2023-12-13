
CREATE OR REPLACE TABLE t_{jmeno}_{prijmeni}_project_SQL_secondary_final AS
SELECT e.YEAR, GDP AS GDP_Czech_Republic
FROM economies e 
JOIN countries c 
    ON e.country = c.country 
	AND e.country = 'Czech Republic'    	
	AND GDP IS NOT NULL;
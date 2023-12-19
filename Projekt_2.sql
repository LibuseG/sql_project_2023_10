

CREATE OR REPLACE TEMPORARY TABLE europe_countries AS (
	SELECT country, year, population, GDP, gini
	FROM economies 
	WHERE GDP IS NOT NULL AND gini IS NOT NULL
);
CREATE OR REPLACE TABLE t_libuse_gregorova_project_SQL_secondary_final AS
SELECT ec.country, ec.YEAR, ec.population, ec.GDP, ec.gini, cp.value AS payroll, cp2.value
FROM europe_countries ec 
JOIN countries c 
    ON ec.country = c.country
    AND region_in_world LIKE '%Europe%'
LEFT JOIN 
	czechia_payroll cp 
ON ec.YEAR = cp.payroll_year AND
    cp.value_type_code = 5958 AND 
    calculation_code = 200 AND 
    c.country = 'Czech Republic'
LEFT JOIN czechia_price cp2 
ON ec.YEAR = YEAR(cp2.date_from) 
	AND cp2.region_code IS NULL
	AND ec.country = 'Czech Republic';
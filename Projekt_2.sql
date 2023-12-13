
CREATE OR REPLACE TABLE t_libuse_gregorova_project_SQL_secondary_final AS
SELECT e.YEAR, cp.value AS payroll, cp2.value AS price, GDP AS GDP_Czech_Republic
FROM economies e 
JOIN countries c 
    ON e.country = c.country 
	AND e.country = 'Czech Republic'    	
	AND GDP IS NOT NULL
LEFT JOIN 
	czechia_payroll cp 
ON e.YEAR = cp.payroll_year AND
    cp.value_type_code = 5958 AND 
    calculation_code = 200   
JOIN czechia_price cp2 
ON e.YEAR = YEAR(cp2.date_from) AND 
	cp2.region_code IS NULL
GROUP BY YEAR 	;


-- 1.	Rostou v průběhu let mzdy ve všech odvětvích, nebo v některých klesají?--


SELECT
    a.name,
    first_year_payroll,
    last_year_payroll,
    CASE  
    	WHEN last_year_payroll - first_year_payroll > 0 THEN 'increse'
    	WHEN last_year_payroll - first_year_payroll < 0 THEN 'decrese'
    	ELSE 'no chage'
    END payroll_difference
FROM (
	SELECT
	name,
    round(avg (avg_payroll)) AS last_year_payroll
	FROM t_libuse_gregorova_project_SQL_primary_final
	WHERE payroll_year  IN (
    	SELECT
        MAX(payroll_year)
    	FROM t_libuse_gregorova_project_SQL_primary_final)
    	GROUP BY name
    ) a
LEFT JOIN (
SELECT
	name,
    round(avg (avg_payroll)) AS first_year_payroll
FROM t_libuse_gregorova_project_SQL_primary_final
WHERE payroll_year  IN (
    SELECT
        min(payroll_year)
    FROM t_libuse_gregorova_project_SQL_primary_final)
    GROUP BY name
    ) b
ON a.name = b.name
ORDER BY payroll_difference desc
;


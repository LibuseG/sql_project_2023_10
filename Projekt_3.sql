

-- 1.	Rostou v průběhu let mzdy ve všech odvětvích, nebo v některých klesají?--


SELECT
    a.name,
    first_year_payroll,
    last_year_payroll
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
;


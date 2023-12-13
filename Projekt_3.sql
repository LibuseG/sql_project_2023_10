

-- 1.	Rostou v průběhu let mzdy ve všech odvětvích, nebo v některých klesají?--

SELECT name,
	min (payroll_year) AS first_year,
	max (payroll_year) AS last_year
FROM t_libuse_gregorova_project_SQL_primary_final
GROUP BY name ;
	
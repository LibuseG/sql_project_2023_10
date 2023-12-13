
--3. Která kategorie potravin zdražuje nejpomaleji 
(je u ní nejnižší percentuální meziroční nárůst)?--

SELECT a.food_category,
	round(avg(a.price),2),
	a.payroll_year AS year,
	(YEAR(cp.date_from)-1) AS prev_year
FROM t_libuse_gregorova_project_SQL_primary_final a
JOIN czechia_price cp 
ON a.payroll_year = YEAR(cp.date_from)
GROUP BY payroll_year;
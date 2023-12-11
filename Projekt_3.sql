
--3. Která kategorie potravin zdražuje nejpomaleji 
(je u ní nejnižší percentuální meziroční nárůst)?--

SELECT a.food_category,
	a.price,
	a.payroll_year,
	(b.payroll_year-1) AS prev_year
FROM t_libuse_gregorova_project_SQL_primary_final a
JOIN t_libuse_gregorova_project_SQL_primary_final b
ON a.food_category = b.food_category 
AND a.payroll_year = b.payroll_year-1;
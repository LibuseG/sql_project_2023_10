
--3. Která kategorie potravin zdražuje nejpomaleji 
(je u ní nejnižší percentuální meziroční nárůst)?--


WITH first_year AS (
	SELECT food_category,
		payroll_year,
		price
	FROM t_libuse_gregorova_project_sql_primary_final 
	ORDER BY payroll_year
	LIMIT 1),
	last_year AS (
	SELECT food_category,
		payroll_year,
		price
	FROM t_libuse_gregorova_project_sql_primary_final 
	ORDER BY payroll_year DESC 
	LIMIT 1),
food_category_increase AS (
	SELECT 
		food_category,
		payroll_year,
		price
	FROM t_libuse_gregorova_project_SQL_primary_final
)
SELECT a.food_category,
	a.payroll_year,
	a.price,
	fci.payroll_year AS prev_year,
	(fci.price - a.price)/a.price AS price_change
FROM t_libuse_gregorova_project_SQL_primary_final a
JOIN food_category_increase fci
 ON a.payroll_year=fci.payroll_year-1 
 AND a.food_category = fci.food_category
 GROUP BY a.food_category
;
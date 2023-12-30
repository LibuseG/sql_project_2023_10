
--4.	Existuje rok, ve kterém byl meziroční nárůst cen potravin
 výrazně vyšší než růst mezd (větší než 10 %)?--
 
 
SELECT
 	a.payroll_year,
 	b.payroll_year AS previous_year
FROM t_libuse_gregorova_project_SQL_primary_final a
left JOIN t_libuse_gregorova_project_SQL_primary_final b
	ON a.payroll_year = b.payroll_year-1
	AND a.food_category = b.food_category  
GROUP BY a.payroll_year;



	(b.avg_payroll-a.avg_payroll)/a.avg_payroll AS pct_payroll_change,
 	(avg(b.price) - avg(a.price))/avg(a.price) AS pct_price_change
 	CASE
 		WHEN (pct_price_change)-(pct_payroll_change)> 0,1 THEN 1
 		ELSE 0
 	END 
 	
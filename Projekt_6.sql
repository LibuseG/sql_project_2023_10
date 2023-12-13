
--4.	Existuje rok, ve kterém byl meziroční nárůst cen potravin
 výrazně vyšší než růst mezd (větší než 10 %)?--
 
 
 SELECT
 	payroll_year,
 	avg(avg_payroll),
 	avg(price)
 FROM t_libuse_gregorova_project_SQL_primary_final
 GROUP BY payroll_year;
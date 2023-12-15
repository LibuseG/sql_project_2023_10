

-- 5.	Má výška HDP vliv na změny ve mzdách a cenách potravin? 
Neboli, pokud HDP vzroste výrazněji v jednom roce, projeví se to na cenách potravin
 či mzdách ve stejném nebo násdujícím roce výraznějším růstem?--
 
 
 
 SELECT a.YEAR,
 	(b.payroll - a.payroll)/a.payroll AS payroll_change,
 	(b.price - a.price)/a.price AS price_change,
 	(b.GDP_Czech_Republic - a.GDP_Czech_Republic)/a.GDP_Czech_Republic AS GDP_change,
 	CASE
 		WHEN (b.GDP_Czech_Republic - a.GDP_Czech_Republic)/a.GDP_Czech_Republic > 0.03 THEN 1
 		ELSE 0
 	END AS GDP_sign_increase,
 	CASE
 		WHEN (b.payroll - a.payroll)/a.payroll > 0.05 THEN 'increase'
 		WHEN (b.payroll - a.payroll)/a.payroll < 0 THEN 'decrease'
 		ELSE 'small_change'
 	END AS payroll_significant_change,
 	CASE
 		WHEN (b.price - a.price)/a.price > 0.03 THEN 'increase'
 		WHEN (b.price - a.price)/a.price < 0 THEN 'decrease'
 		ELSE 'small_change'
 	END AS price_significant_increase
 FROM engeto_2023_10_26.t_libuse_gregorova_project_sql_secondary_final a
 JOIN engeto_2023_10_26.t_libuse_gregorova_project_sql_secondary_final b
 ON a.YEAR = b.YEAR-1;
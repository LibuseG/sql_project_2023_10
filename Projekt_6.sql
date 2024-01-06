
--4.	Existuje rok, ve kterém byl meziroční nárůst cen potravin
 výrazně vyšší než růst mezd (větší než 10 %)?--
 
 
 CREATE OR REPLACE temporary TABLE payroll_price_change AS (
 SELECT payroll_year, avg(avg_payroll) as avg_payroll, avg(price) as avg_price
 FROM t_libuse_gregorova_project_sql_primary_final tlgpspf 
 group BY payroll_year);
 
select 
	a.payroll_year, round(a.avg_payroll), round(((b.avg_payroll-a.avg_payroll)/a.avg_payroll),3) as payroll_chng,
	round(a.avg_price,2)as avg_price, round(((b.avg_price - a.avg_price)/a.avg_price),3) as price_chng,
	CASE
 		WHEN ((b.avg_price - a.avg_price)/a.avg_price) - ((b.avg_payroll-a.avg_payroll)/a.avg_payroll)> 0.01 THEN 1
 		ELSE 0
 	END AS more_than_10
 FROM payroll_price_change a
 join payroll_price_change b
 on a.payroll_year = b.payroll_year-1
 ;



--3. Která kategorie potravin zdražuje nejpomaleji 
(je u ní nejnižší percentuální meziroční nárůst)?--

create or replace temporary table food_cathegory_increase as (
SELECT food_category, payroll_year,
	   avg(price) as avg_price
fROM t_libuse_gregorova_project_sql_primary_final 
	group BY food_category, payroll_year
);

SELECT a.food_category, a.payroll_year,b.payroll_year,c.payroll_year, a.avg_price, c.avg_price,
	   (b.avg_price - a.avg_price)/a.avg_price as year_chng
FROM food_cathegory_increase a
left JOIN food_cathegory_increase b
ON a.payroll_year = b.payroll_year-1 
and a.food_category = b.food_category
left JOIN food_cathegory_increase c
ON b.payroll_year = c.payroll_year
and a.food_category = c.food_category
group BY a.food_category, a.payroll_year
;

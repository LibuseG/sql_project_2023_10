
--3. Která kategorie potravin zdražuje nejpomaleji 
(je u ní nejnižší percentuální meziroční nárůst)?--

create or replace temporary table food_category_increase as (
SELECT food_category, payroll_year,
	   avg(price) as avg_price
fROM t_libuse_gregorova_project_sql_primary_final 
	group BY food_category, payroll_year
);

create or replace temporary table food_category_change as (
SELECT a.food_category, b.payroll_year as next_year, a.avg_price,
	   avg((b.avg_price - a.avg_price)/a.avg_price) as year_chng
FROM food_category_increase a
left JOIN food_category_increase b
ON a.payroll_year = b.payroll_year-1 
and a.food_category = b.food_category
and a.payroll_year between 2006 and 2018
left JOIN food_category_increase c
ON b.food_category = c.food_category
and  a.payroll_year = c.payroll_year-1
group BY a.food_category, a.payroll_year
);

select food_category, round(avg(year_chng),5) as year_change
	from food_category_change
	where year_chng >0
group by food_category 
order by year_chng asc ;



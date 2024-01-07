
--3. Která kategorie potravin zdražuje nejpomaleji 
(je u ní nejnižší percentuální meziroční nárůst)?--

with food_cathegory_increase as (
SELECT food_category, payroll_year,
	   price
fROM t_libuse_gregorova_project_sql_primary_final 
	group BY food_category, payroll_year
)
SELECT a.food_category, a.payroll_year, avg(a.price),avg(b.price),
	   (avg(b.price) - avg(a.price))/avg(a.price)
FROM food_cathegory_increase a
left JOIN food_cathegory_increase b
ON a.food_category = b.food_category 
AND a.payroll_year = b.payroll_year-1 
group BY a.payroll_year;
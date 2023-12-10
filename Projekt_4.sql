

--2.	Kolik je možné si koupit litrů mléka a kilogramů chleba za první a poslední srovnatelné období
v dostupných datech cen a mezd?--

SELECT*
FROM czechia_price_category;


WITH milk_and_bread AS (
    SELECT category_code
    FROM czechia_price
    WHERE category_code = 111301 OR category_code = 114201
)
SELECT a.food_category , a.payroll_year, 
	round (a.avg_payroll/a.price) AS amount
FROM milk_and_bread 
RIGHT JOIN t_libuse_gregorova_project_sql_primary_final AS a
ON milk_and_bread.category_code = a.category_code 
group BY a.payroll_year
;
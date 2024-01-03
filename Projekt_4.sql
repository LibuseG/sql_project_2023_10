

--2.	Kolik je možné si koupit litrů mléka a kilogramů chleba za první a poslední srovnatelné období
v dostupných datech cen a mezd?--

SELECT*
FROM czechia_price_category;

SELECT DISTINCT
        payroll_year
        FROM t_libuse_gregorova_project_sql_primary_final tlgpspf 
       group BY payroll_year;

WITH milk_and_bread AS (
    SELECT category_code
    FROM czechia_price
    WHERE category_code = 111301 OR category_code = 114201
)
SELECT a.food_category , a.payroll_year, round(avg(a.avg_payroll)) AS avg_yearly_payroll, round(avg(a.price),2) AS avg_yearly_price,
	round(avg(a.avg_payroll/avg(a.price)) AS  amount_to_buy, a.price_unit
FROM milk_and_bread 
left JOIN t_libuse_gregorova_project_sql_primary_final AS a
ON milk_and_bread.category_code = a.category_code 
 AND a.payroll_year IN (2006, 2018)
group BY a.payroll_year, a.food_category
;

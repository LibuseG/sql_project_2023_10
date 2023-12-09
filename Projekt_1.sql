

SELECT
    name, value AS avg_payroll, payroll_year, payroll_quarter 
FROM czechia_payroll_industry_branch cpib 
LEFT JOIN
czechia_payroll cp 
ON cpib.code = cp.industry_branch_code
WHERE value IS NOT NULL AND value_type_code = 5958
ORDER BY name, payroll_year, payroll_quarter ;




















ctreate TABLE t_libuse_gregorova_project_SQL_primary_final as

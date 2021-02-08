# 1468. Calculate Salaries (Medium)
SELECT company_id, employee_id, employee_name, ROUND(salary*(1-tax_rate)) AS salary
FROM
(SELECT *, CASE WHEN max_salary < 1000 THEN 0
    WHEN max_salary <= 10000 THEN 0.24
    ELSE 0.49 END AS tax_rate
FROM
(SELECT *, MAX(salary) OVER (PARTITION BY company_id) AS max_salary
FROM Salaries) AS T) AS T2
# 607. Sales Person (EASY)
SELECT name FROM salesperson
WHERE name NOT IN 
(SELECT DISTINCT S.name FROM
salesperson AS S LEFT JOIN orders ON S.sales_id = orders.sales_id
LEFT JOIN company ON orders.com_id = company.com_id
WHERE company.name = 'RED')
# 1070. Product Sales Analysis III (Medium)
SELECT DISTINCT product_id, first_year, quantity, price FROM
(SELECT *, MIN(year) OVER (PARTITION BY product_id) AS first_year 
FROM Sales) AS T
WHERE year = first_year

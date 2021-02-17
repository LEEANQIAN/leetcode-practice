# 1543. Fix Product Name Format (EASY)
SELECT LOWER(TRIM(' ' FROM product_name)) AS product_name,
DATE_FORMAT(sale_date, '%Y-%m') AS sale_date, COUNT(sale_id) AS total
FROM Sales
GROUP BY 1,2
ORDER BY product_name, sale_date
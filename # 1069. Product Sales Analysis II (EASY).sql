# 1069. Product Sales Analysis II (EASY)
SELECT Product.product_id, SUM(quantity) AS total_quantity FROM
Product INNER JOIN Sales ON Product.product_id = Sales.product_id
GROUP BY Product.product_id
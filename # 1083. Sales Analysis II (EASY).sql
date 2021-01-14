# 1083. Sales Analysis II (EASY)
SELECT DISTINCT buyer_id 
FROM Sales LEFT JOIN Product ON Sales.product_id = Product.product_id
WHERE buyer_id IN 
(SELECT buyer_id FROM Sales LEFT JOIN Product ON Sales.product_id = Product.product_id WHERE product_name = 'S8')
AND buyer_id NOT IN 
(SELECT buyer_id FROM Sales LEFT JOIN Product ON Sales.product_id = Product.product_id WHERE product_name = 'iPhone')
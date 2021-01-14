# 1084. Sales analysis III (EASY)
SELECT DISTINCT Product.product_id, product_name
FROM Sales LEFT JOIN Product ON Sales.product_id = Product.product_id
WHERE Product.product_id IN 
(SELECT Product.product_id FROM Sales LEFT JOIN Product ON Sales.product_id = Product.product_id WHERE sale_date BETWEEN '2019-01-01' AND '2019-03-31' )
AND Product.product_id NOT IN 
(SELECT Product.product_id FROM Sales LEFT JOIN Product ON Sales.product_id = Product.product_id WHERE sale_date NOT BETWEEN '2019-01-01' AND '2019-03-31' )
ORDER BY Product.product_id
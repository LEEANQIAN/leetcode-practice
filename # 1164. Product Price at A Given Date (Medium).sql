# 1164. Product Price at A Given Date (Medium)
WITH CTE AS(
    SELECT product_id, MAX(change_date) AS most_recent_date
    FROM Products WHERE change_date <= '2019-08-16'
    GROUP BY product_id
)

SELECT Products.product_id, new_price AS price
FROM Products JOIN CTE ON Products.product_id = CTE.product_id AND
Products.change_date = CTE.most_recent_date UNION 
(SELECT product_id, 10 FROM Products WHERE product_id NOT IN (SELECT product_id FROM CTE))
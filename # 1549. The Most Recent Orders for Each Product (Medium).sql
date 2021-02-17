# 1549. The Most Recent Orders for Each Product (Medium)
WITH CTE AS (
    SELECT product_name, P.product_id, order_id, order_date,
    MAX(order_date) OVER (PARTITION BY P.product_id) AS recent 
    FROM Products AS P LEFT JOIN Orders AS O 
    ON P.product_id = O.product_id
)
SELECT product_name, product_id, order_id, order_date FROM CTE
WHERE order_date = recent
ORDER BY product_name, product_id, order_id
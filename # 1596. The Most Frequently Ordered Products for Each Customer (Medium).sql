# 1596. The Most Frequently Ordered Products for Each Customer (Medium)
WITH CTE AS (
    SELECT C.customer_id, O.product_id, product_name, 
    COUNT(*) AS num FROM
    Customers AS C LEFT JOIN Orders AS O ON C.customer_id = O.customer_id
    LEFT JOIN Products AS P ON O.product_id = P.product_id
    GROUP BY O.customer_id, O.product_id
)

SELECT customer_id, product_id, product_name FROM
(SELECT *, MAX(num) OVER (PARTITION BY customer_id) AS most_frq 
FROM CTE WHERE product_id IS NOT NULL) AS T
WHERE num = most_frq
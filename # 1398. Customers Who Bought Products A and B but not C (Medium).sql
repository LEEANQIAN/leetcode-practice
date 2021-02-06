# 1398. Customers Who Bought Products A and B but Not C (Medium)
WITH CTE AS (
    SELECT customer_id FROM Orders
    WHERE product_name = 'A' or product_name = 'B'
    GROUP BY customer_id
    HAVING COUNT(DISTINCT product_name) = 2
)

SELECT Orders.customer_id, customer_name
FROM Orders LEFT JOIN Customers ON Orders.customer_id = Customers.customer_id
WHERE Orders.customer_id in (SELECT customer_id FROM CTE)
GROUP BY Orders.customer_id
HAVING SUM(CASE WHEN product_name = 'C' THEN 1 ELSE 0 END) = 0
ORDER BY Orders.customer_id
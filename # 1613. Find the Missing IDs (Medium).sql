# 1613. Find the Missing IDs (Medium)
WITH RECURSIVE CTE AS (
    SELECT 1 AS customer_id UNION ALL
    SELECT customer_id + 1 FROM CTE
    WHERE customer_id < (SELECT MAX(customer_id) FROM Customers)
)

SELECT customer_id AS ids FROM CTE
WHERE customer_id NOT IN (SELECT customer_id FROM Customers)
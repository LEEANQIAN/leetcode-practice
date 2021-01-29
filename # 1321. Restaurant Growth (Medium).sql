# 1321. Restaurant Growth (Medium)

WITH CTE AS (
    SELECT visited_on, amount, SUM(amount) AS total
    FROM Customer
    GROUP BY visited_on
)

SELECT C1.visited_on, SUM(C2.total) AS amount, 
ROUND(AVG(C2.total),2) AS average_amount
FROM
CTE AS C1 LEFT JOIN CTE AS C2 ON 
DATEDIFF(C1.visited_on, C2.visited_on) >= 0
AND DATEDIFF(C1.visited_on, C2.visited_on) <= 6
GROUP BY C1.visited_on
HAVING COUNT(C1.visited_on) = 7
ORDER BY C1.visited_on
# 1204. Last Person To Fit in the Elevator (Medium)
WITH T_weight AS (
    SELECT *, SUM(weight) OVER (ORDER BY turn) AS cum_weight
    FROM Queue
)

SELECT person_name FROM T_weight
WHERE cum_weight <= 1000
ORDER BY cum_weight DESC
LIMIT 1
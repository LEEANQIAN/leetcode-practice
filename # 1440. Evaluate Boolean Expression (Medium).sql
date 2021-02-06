# 1440. Evaluate Boolean Expression (Medium)
WITH CTE AS (
    SELECT left_operand, operator, right_operand, V1.value AS left_v, 
    V2.value AS right_v
    FROM Expressions AS E 
    LEFT JOIN Variables AS V1 ON E.left_operand = V1.name
    LEFT JOIN Variables AS V2 ON E.right_operand = V2.name
)


SELECT left_operand, operator, right_operand,
    CASE WHEN operator = '>' and left_v > right_v THEN 'true'
    WHEN operator = '<' and left_v < right_v THEN 'true'
    WHEN operator = '=' and left_v = right_v THEN 'true'
    ELSE 'false' END AS value
FROM CTE
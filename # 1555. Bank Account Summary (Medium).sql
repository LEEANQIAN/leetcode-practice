# 1555. Bank Account Summary (Medium)
WITH CTE1 AS (
    SELECT user_id, user_name,
    (credit - SUM(IFNULL(T1.amount,0))) AS new_balance
    FROM Users LEFT JOIN Transactions AS T1
    ON Users.user_id = T1.paid_by 
    #LEFT JOIN Transactions AS T2 ON Users.user_id = T2.paid_to
    GROUP BY user_id
), CTE2 AS (
    SELECT user_id, user_name,
    SUM(IFNULL(T2.amount,0)) AS received
    FROM Users LEFT JOIN Transactions AS T2
    ON Users.user_id = T2.paid_to 
    GROUP BY user_id
)


SELECT CTE1.user_id, CTE1.user_name, (new_balance + received) AS credit,
CASE WHEN (new_balance + received)< 0 THEN 'Yes' 
ELSE 'No' END AS credit_limit_breached
FROM CTE1 LEFT JOIN CTE2 ON CTE1.user_id = CTE2.user_id
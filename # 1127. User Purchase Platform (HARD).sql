# 1127. User Purchase Platform (HARD)
WITH CTE1 AS (
    SELECT user_id, spend_date, GROUP_CONCAT(platform) AS platform,
    SUM(amount) AS amount FROM Spending
    GROUP BY user_id, spend_date
), 
CTE2 AS (SELECT spend_date, CASE 
            WHEN platform <> 'mobile' AND platform <> 'desktop' THEN 'both' 
            ELSE platform END AS platform, 
            SUM(amount) AS total_amount, 
            COUNT(DISTINCT user_id) AS total_users FROM CTE1
            GROUP BY spend_date, platform
),
CTE3 AS (SELECT DISTINCT spend_date, 'mobile' AS platform FROM Spending
        UNION ALL 
        SELECT DISTINCT spend_date, 'desktop' AS platform FROM Spending
        UNION ALL 
        SELECT DISTINCT spend_date, 'both' AS platform FROM Spending
)

SELECT CTE3.spend_date, CTE3.platform, 
IFNULL(total_amount,0) AS total_amount, IFNULL(total_users,0) AS total_users
FROM
CTE3 LEFT JOIN CTE2 
ON CTE3.spend_date = CTE2.spend_date AND CTE3.platform = CTE2.platform
ORDER BY CTE3.spend_date
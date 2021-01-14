# 1107. New Users Daily Count (Medium)
WITH CTE AS (
    SELECT user_id, MIN(activity_date) AS first_login
    FROM Traffic WHERE activity = 'login' GROUP BY user_id)

SELECT first_login AS login_date, COUNT(DISTINCT user_id) AS user_count 
FROM CTE
WHERE DATEDIFF('2019-06-30', first_login) <= 90 
GROUP BY first_login
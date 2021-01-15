# 1142. User Activity for the Past 30 Days II (EASY)
SELECT IFNULL(ROUND(AVG(num),2),0) AS average_sessions_per_user FROM
(SELECT user_id, COUNT(DISTINCT session_id) AS num
FROM Activity
WHERE DATEDIFF('2019-07-27', activity_date) < 30
GROUP BY user_id) AS T
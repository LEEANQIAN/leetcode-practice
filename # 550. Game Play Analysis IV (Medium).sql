# 550. Game Play Analysis IV (Medium)
SELECT ROUND(SUM(T.diff) / COUNT(DISTINCT player_id),2) AS fraction
FROM
(SELECT *, MIN(event_date) OVER (PARTITION BY player_id ORDER BY event_date) AS first_login, 
(event_date - MIN(event_date) OVER (PARTITION BY player_id ORDER BY event_date)) AS diff FROM Activity) AS T
WHERE T.diff <= 1
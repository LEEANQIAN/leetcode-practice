# 1097. Game Play Analysis V (HARD)

# Method 1: using LEAD() and DATEDIFF()
SELECT event_date AS install_dt, COUNT(DISTINCT player_id) AS installs,
ROUND(COUNT(CASE WHEN day_diff = 1 THEN player_id END)/
     COUNT(DISTINCT player_id),2) AS Day1_retention
FROM 
(SELECT player_id, event_date, 
 DATEDIFF(LEAD(event_date,1) OVER (PARTITION BY player_id ORDER BY event_date), event_date) AS day_diff,
ROW_NUMBER() OVER (PARTITION BY player_id ORDER BY event_date) AS rank_d
FROM Activity) AS T
WHERE rank_d = 1
GROUP BY event_date

# Method 2: using CTE
WITH CTE AS (
SELECT player_id, MIN(event_date) AS install_dt
FROM Activity GROUP BY player_id)

SELECT install_dt, installs, ROUND(Day1/installs,2) AS Day1_retention
FROM
(SELECT install_dt, COUNT(DISTINCT CTE.player_id) AS installs,
IFNULL(SUM(CASE WHEN event_date IS NOT NULL THEN 1 ELSE 0 END),0) AS Day1
FROM CTE LEFT JOIN Activity ON CTE.player_id = Activity.player_id
AND DATEDIFF(Activity.event_date, CTE.install_dt) = 1
GROUP BY install_dt) AS T


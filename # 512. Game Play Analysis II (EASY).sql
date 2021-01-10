# 512. Game Play Analysis II (EASY)
SELECT player_id, device_id 
FROM Activity
WHERE (player_id, event_date) IN (SELECT player_id, MIN(event_date) AS first
FROM Activity GROUP BY player_id) 
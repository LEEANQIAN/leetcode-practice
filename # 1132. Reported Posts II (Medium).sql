# 1132. Reported Posts II (Medium)
SELECT ROUND(AVG(rate),2) AS average_daily_percent FROM
(SELECT DISTINCT action_date, 
    COUNT(DISTINCT Removals.post_id) /
    COUNT(DISTINCT Actions.post_id)*100 AS rate
FROM Actions LEFT JOIN Removals ON Actions.post_id = Removals.post_id
WHERE extra = 'spam'
GROUP BY action_date) AS T
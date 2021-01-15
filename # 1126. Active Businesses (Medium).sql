# 1126. Active Businesses (Medium)
SELECT business_id
FROM
(SELECT *, AVG(occurences) OVER (PARTITION BY event_type) AS average
FROM Events) AS T
WHERE occurences > average
GROUP BY business_id
HAVING COUNT(*) > 1
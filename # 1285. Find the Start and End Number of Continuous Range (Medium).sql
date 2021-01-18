# 1285. Find the Start and End Number of Continuous Ranges (Medium)
SELECT MIN(log_id) AS start_id, MAX(log_id) AS end_id
FROM
(SELECT *, ROW_NUMBER() OVER (ORDER BY log_id) AS num
FROM Logs) AS T
GROUP BY log_id - num
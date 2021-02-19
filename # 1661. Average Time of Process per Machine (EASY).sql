# 1661. Average Time of Process per Machine (EASY)
SELECT machine_id, ROUND(SUM(process) / COUNT(DISTINCT process_id),3) AS processing_time FROM
(SELECT A1.machine_id, A1.process_id, (A2.timestamp - A1.timestamp) AS process
FROM Activity AS A1 INNER JOIN Activity AS A2
ON A1.machine_id = A2.machine_id AND A1.process_id = A2.process_id
AND A1.activity_type <> A2.activity_type
WHERE (A2.timestamp - A1.timestamp) > 0) AS T
GROUP BY machine_id
# 1369. Get the Second Most Recent Activity (HARD)
SELECT username, activity, startDate, endDate FROM
(SELECT *, 
 ROW_NUMBER() OVER (PARTITION BY username ORDER BY rk DESC) AS rn 
 FROM (SELECT *, 
       DENSE_RANK() OVER (PARTITION BY username ORDER BY startDate DESC) AS rk 
       FROM UserActivity) AS T 
 WHERE rk <= 2) AS T2
WHERE rn = 1
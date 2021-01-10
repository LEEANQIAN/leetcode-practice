# 262. Trips and Users (HARD)
SELECT T.Request_at AS day, 
ROUND(COUNT(DISTINCT CASE WHEN T.Status <> 'completed' THEN T.Id END) / 
      COUNT(DISTINCT T.Id), 2) AS 'Cancellation Rate' 
FROM trips AS T
WHERE T.Client_Id NOT IN (SELECT Users_Id FROM Users WHERE Banned = "Yes")
AND T.Driver_Id NOT IN (SELECT Users_Id FROM Users WHERE Banned = "Yes")
AND T.Request_at BETWEEN '2013-10-01' AND '2013-10-03'
GROUP BY T.Request_at

# another solution with a different CASE WHEN usage
SELECT T.Request_at AS day, 
ROUND(SUM(CASE WHEN T.Status IN ('cancelled_by_driver', 'cancelled_by_client') THEN 1 ELSE 0 END) / 
      COUNT(1), 2) AS 'Cancellation Rate' 
FROM trips AS T
WHERE T.Client_Id NOT IN (SELECT Users_Id FROM Users WHERE Banned = "Yes")
AND T.Driver_Id NOT IN (SELECT Users_Id FROM Users WHERE Banned = "Yes")
AND T.Request_at BETWEEN '2013-10-01' AND '2013-10-03'
GROUP BY T.Request_at
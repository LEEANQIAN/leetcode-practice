# 614. Second Degree Follower (Medium)
SELECT T.follower, T.num FROM
(SELECT F1.follower, COUNT(DISTINCT F2.follower) AS num 
FROM follow AS F1 LEFT JOIN follow AS F2
ON F1.follower = F2.followee
GROUP BY F1.follower) AS T
WHERE T.num <> 0


# another solution without self join
SELECT followee AS follower, COUNT(DISTINCT follower) AS num 
FROM follow
GROUP BY followee
HAVING followee IN (SELECT DISTINCT follower FROM follow)
ORDER BY followee
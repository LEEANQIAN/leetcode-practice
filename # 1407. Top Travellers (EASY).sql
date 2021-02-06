# 1407. Top Travellers (EASY)
SELECT name, IFNULL(SUM(distance),0) AS travelled_distance
FROM Users LEFT JOIN Rides ON Rides.user_id = Users.id
GROUP BY Users.id
ORDER BY travelled_distance DESC, name
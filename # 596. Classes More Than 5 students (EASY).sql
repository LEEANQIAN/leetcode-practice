# 596. Classes More Than 5 students (EASY)
SELECT class FROM 
(SELECT class, COUNT(DISTINCT student) AS num FROM courses GROUP BY class) AS T
WHERE T.num >= 5
# 196. Delete Duplicate Emails (EASY)
DELETE FROM Person
WHERE Id NOT IN (SELECT * FROM
(SELECT MIN(Id) FROM Person GROUP BY Email) AS T)
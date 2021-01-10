# 182. Duplicate Emails (Easy)
SELECT T.Email FROM
(SELECT Email, COUNT(Email) FROM Person
GROUP BY Email
HAVING COUNT(Email) > 1) AS T
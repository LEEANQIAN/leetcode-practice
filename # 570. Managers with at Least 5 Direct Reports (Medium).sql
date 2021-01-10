# 570. Managers with at Least 5 Direct Reports (Medium)
SELECT DISTINCT T.Name FROM
(SELECT E1.Id, E1.Name, COUNT(E1.Id) OVER (PARTITION BY E1.Id) AS reports
 FROM Employee AS E1 LEFT JOIN Employee AS E2
ON E1.Id = E2.ManagerId) AS T
WHERE T.reports >= 5
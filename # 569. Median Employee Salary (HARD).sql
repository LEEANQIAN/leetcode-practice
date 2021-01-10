# 569. Median Employee Salary (HARD)
SELECT Id, Company, Salary FROM
(SELECT *, ROW_NUMBER() OVER (PARTITION BY Company ORDER BY Salary) AS rnk,
 COUNT(Salary) OVER (PARTITION BY Company) AS cnt
FROM Employee) AS T
WHERE T.rnk in (cnt/2, cnt/2+1, cnt/2+0.5)
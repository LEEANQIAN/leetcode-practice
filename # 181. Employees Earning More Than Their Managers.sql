# 181. Employees Earning More Than Their Managers (easy)
SELECT E1.Name AS Employee FROM Employee AS E1
INNER JOIN Employee AS E2 ON E1.ManagerID = E2.ID 
WHERE E1.Salary > E2.Salary
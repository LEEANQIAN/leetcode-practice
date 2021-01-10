# 184. Department Highest Salary (Medium)
SELECT T.Department, T.Employee, T.Salary FROM
(SELECT DepartmentId, Employee.Name AS Employee, Department.Name AS Department, Salary, MAX(Salary) OVER (PARTITION BY DepartmentId) AS high
FROM Employee INNER JOIN Department ON Employee.DepartmentId = Department.Id) AS T
WHERE T.Salary = T.high
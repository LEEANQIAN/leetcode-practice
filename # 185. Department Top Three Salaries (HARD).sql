# 185. Department Top Three Salaries (HARD)
SELECT T.Department, T.Employee, T.Salary
FROM
(SELECT Department.Name AS Department, Employee.Name AS Employee, Salary, DENSE_RANK() OVER (PARTITION BY DepartmentId ORDER BY Salary DESC) AS rnk 
FROM Employee INNER JOIN Department ON Employee.DepartmentId = Department.Id) AS T
WHERE T.rnk <= 3
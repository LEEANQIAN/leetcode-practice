# 177. Nth Highest Salary (Medium)
# MSSQL
CREATE FUNCTION getNthHighestSalary(@N INT) RETURNS INT AS
BEGIN
    RETURN (
        /* Write your T-SQL query statement below. */
        SELECT TOP 1 Salary FROM 
      (SELECT Salary, DENSE_RANK() OVER (ORDER BY Salary DESC) AS rnk 
       FROM Employee) AS T
      WHERE rnk = @N
    );
END

# MYSQL
CREATE FUNCTION getNthHighestSalary(N INT) RETURNS INT
BEGIN
  RETURN (
      # Write your MySQL query statement below.
      SELECT MAX(T.Salary) FROM 
      (SELECT Salary, DENSE_RANK() OVER (ORDER BY Salary DESC) AS rnk 
       FROM Employee) AS T
      WHERE T.rnk = N
      
  );
END
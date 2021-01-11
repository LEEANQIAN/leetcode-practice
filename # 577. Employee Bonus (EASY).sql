# 577. Employee Bonus (EASY)
SELECT Employee.name, bonus 
FROM Employee LEFT JOIN Bonus ON Employee.empId = Bonus.empId
WHERE bonus < 1000 OR bonus IS NULL
# 1378. Replace Employee ID with the Unique Identifier (EASY)
SELECT unique_id, name FROM
Employees LEFT JOIN EmployeeUNI ON Employees.id = EmployeeUNI.id

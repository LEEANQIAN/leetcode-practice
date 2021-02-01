# 1350. Students With Invalid Departments (EASY)
SELECT id, name FROM Students
WHERE department_id NOT IN (SELECT id FROM Departments)
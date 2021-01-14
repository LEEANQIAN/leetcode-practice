# 1077. Project Employees III (Medium)
SELECT project_id, employee_id FROM
(SELECT project_id, Project.employee_id, experience_years,
MAX(experience_years) OVER (PARTITION BY project_id) AS most
FROM Project LEFT JOIN Employee ON Project.employee_id = Employee.employee_id) AS T
WHERE experience_years = most
# 1270. All People Report to the Given Manager (Medium)
WITH first_level AS (
    SELECT employee_id FROM Employees 
    WHERE manager_id = 1
), sec_level AS (
    SELECT employee_id FROM Employees
    WHERE manager_id IN (SELECT * FROM first_level)
)

SELECT employee_id FROM Employees
WHERE manager_id IN (SELECT * FROM sec_level)
AND employee_id <> 1
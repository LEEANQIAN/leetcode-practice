# 1303. Find the Team Size (EASY)
SELECT employee_id, COUNT(*) OVER (PARTITION BY team_id) AS team_size
FROM Employee
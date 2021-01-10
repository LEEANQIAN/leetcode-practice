# 180. Consecutive Numbers (Medium)
SELECT T.ConsecutiveNums FROM
(SELECT NUM AS ConsecutiveNums, COUNT(NUM) AS consecutive FROM Logs
GROUP BY ConsecutiveNums) AS T
WHERE T.consecutive > 3
# 180. Consecutive Numbers (Medium)

SELECT DISTINCT Num AS ConsecutiveNums FROM
(SELECT Num, LAG(Num) OVER (ORDER BY Id) AS lag_num, 
 LEAD(Num) OVER (ORDER BY Id) AS lead_num FROM Logs) AS T 
WHERE Num = lag_num AND Num = lead_num
# 571. Find Median Given Frequency of Numbers (HARD)
SELECT AVG(Number) AS median 
FROM
(SELECT *,SUM(Frequency) OVER (ORDER BY Number) AS asc_sum,
 SUM(Frequency) OVER (ORDER BY Number DESC) AS des_sum FROM Numbers
ORDER BY Number) AS T
WHERE T.asc_sum >= (SELECT SUM(Frequency)/2 FROM Numbers)
AND T.des_sum >= (SELECT SUM(Frequency)/2 FROM Numbers)

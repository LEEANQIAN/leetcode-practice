# 585. Investments in 2016 (Medium)
SELECT SUM(TIV_2016) AS TIV_2016 FROM 
(SELECT *, COUNT(TIV_2015) OVER (PARTITION BY TIV_2015) AS occurence
FROM insurance) AS T
WHERE T.occurence > 1
AND (LAT,LON) IN (SELECT LAT, LON FROM 
                 (SELECT LAT, LON, COUNT(*) AS uniq FROM insurance
                    GROUP BY LAT, LON) AS T2 WHERE T2.uniq = 1)
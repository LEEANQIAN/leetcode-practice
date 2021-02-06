# 1421. NPV Queries (Medium)
SELECT Queries.id, Queries.year, IFNULL(npv,0) AS npv
FROM Queries LEFT JOIN NPV ON Queries.id = NPV.id and Queries.year = NPV.year
ORDER BY Queries.id
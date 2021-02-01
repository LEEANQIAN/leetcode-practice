# 1355. Activity Participants (Medium)
WITH CTE AS (
    SELECT Activities.id, Activities.name, 
    COUNT(DISTINCT Friends.id) AS num FROM
    Activities LEFT JOIN Friends ON Activities.name = Friends.activity
    GROUP BY Activities.name
)

SELECT name AS activity FROM CTE
WHERE num <> (SELECT num FROM CTE ORDER BY num LIMIT 1) AND 
num <> (SELECT num FROM CTE ORDER BY num DESC LIMIT 1) 
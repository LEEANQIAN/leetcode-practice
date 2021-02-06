# 1435. Create a session Bar Chart (EASY)
WITH CTE AS (
    SELECT '[0-5>' AS bin
    UNION SELECT '[5-10>'
    UNION SELECT '[10-15>'
    UNION SELECT '15 or more'
)

SELECT CTE.bin, IFNULL(COUNT(DISTINCT session_id),0) AS total 
FROM CTE LEFT JOIN 
    (SELECT *, CASE WHEN duration < 5*60 THEN '[0-5>'
        WHEN duration < 10*60 THEN '[5-10>'
        WHEN duration < 15*60 THEN '[10-15>'
        ELSE '15 or more' END AS bin FROM Sessions) AS T
    ON CTE.bin = T.bin
GROUP BY CTE.bin

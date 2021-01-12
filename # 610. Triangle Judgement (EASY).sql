# 610. Triangle Judgement (EASY)
SELECT *, CASE
        WHEN x+y > z AND ABS(x-y) < z THEN 'Yes'
        ELSE 'No'
        END AS 'triangle'
FROM triangle
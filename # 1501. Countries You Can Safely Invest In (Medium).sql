# 1501. Countries You Can Safely Invest In (Medium)
WITH CTE AS (
    SELECT id, T.name AS person_name, Country.name AS country_name FROM 
    (SELECT *, LEFT(phone_number, 3) AS code
    FROM Person) AS T LEFT JOIN Country ON
    T.code = Country.country_code
)

SELECT country_name AS country FROM CTE LEFT JOIN Calls 
ON CTE.id = Calls.caller_id OR CTE.id = callee_id
GROUP BY country_name
HAVING AVG(duration) > 
(SELECT AVG(duration) AS global_ave FROM CTE LEFT JOIN Calls 
ON CTE.id = Calls.caller_id OR CTE.id = callee_id)

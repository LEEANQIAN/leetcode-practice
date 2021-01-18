# 1294. Weather Type in Each Country (EASY)
SELECT country_name, CASE WHEN mean_state <= 15 THEN 'Cold'
                            WHEN mean_state >= 25 THEN 'Hot'
                            ELSE 'Warm' END AS weather_type
FROM
(SELECT W.country_id, country_name, AVG(weather_state) AS mean_state, day
FROM Weather AS W LEFT JOIN Countries AS C 
ON W.country_id = C.country_id
WHERE DATE_FORMAT(day, '%Y-%m') = '2019-11'
GROUP BY W.country_id) AS T
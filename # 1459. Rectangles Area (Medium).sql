# 1459. Rectangles Area (Medium)
SELECT * FROM
(SELECT P1.id AS p1, P2.id AS p2, abs(P1.x_value  - P2.x_value)*abs(P1.y_value  - P2.y_value) AS area
FROM Points AS P1 LEFT JOIN Points AS P2
ON P1.id < P2.id) AS T
WHERE area <> 0
ORDER BY area DESC, p1, p2

# 612. Shortest Distance in a Plane (Medium)
SELECT ROUND(SQRT((POW(P1.x-P2.x,2)+POW(P1.y-P2.y,2))),2) AS shortest
FROM point_2d AS P1 JOIN point_2d AS P2 ON P1.x <> P2.x OR P1.y <> P2.y
ORDER BY shortest
LIMIT 1
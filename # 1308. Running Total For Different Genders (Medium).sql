# 1308. Running Total For Different Genders (Medium)

SELECT gender, day,
SUM(SCORE_points) OVER (PARTITION BY gender ORDER BY day) AS total
FROM Scores
ORDER BY gender, total

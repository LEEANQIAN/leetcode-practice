# 1280. Students and Examinations (EASY)
WITH CTE AS (
    SELECT * FROM Students JOIN Subjects
)

SELECT student_id, student_name, subject_name, 
SUM(CASE WHEN state IS NULL THEN 0 ELSE 1 END) AS attended_exams
FROM
(SELECT CTE.student_id, student_name, CTE.subject_name, E.student_id AS state
FROM CTE LEFT JOIN Examinations AS E ON CTE.student_id = E.student_id
AND CTE.subject_name = E.subject_name) AS T
GROUP BY student_id, subject_name
ORDER BY student_id, subject_name
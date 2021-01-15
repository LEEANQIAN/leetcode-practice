# 1112. Highest Grade For Each Student (Medium)
SELECT student_id, course_id, high AS grade
FROM
(SELECT student_id, course_id, grade, 
MAX(grade) OVER (PARTITION BY student_id) AS high 
FROM Enrollments ORDER BY course_id) AS T
WHERE grade = high
GROUP BY student_id
ORDER BY student_id
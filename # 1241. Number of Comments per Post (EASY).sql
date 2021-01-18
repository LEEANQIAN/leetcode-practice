# 1241. Number of Comments per Post (EASY)
WITH unique_sub AS (
    SELECT DISTINCT sub_id, parent_id FROM Submissions
)

SELECT T.sub_id AS post_id, 
IFNULL(COUNT(DISTINCT unique_sub.sub_id),0) AS number_of_comments
FROM
(SELECT DISTINCT sub_id FROM Submissions 
WHERE parent_id IS NULL) AS T LEFT JOIN unique_sub 
ON T.sub_id = unique_sub.parent_id
GROUP BY T.sub_id
ORDER BY T.sub_id
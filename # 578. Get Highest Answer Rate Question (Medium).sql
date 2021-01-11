# 578. Get Highest Answer Rate Question (Medium)
SELECT question_id AS survey_log FROM
(SELECT question_id, 
 IFNULL(SUM(CASE WHEN action = 'answer' THEN 1 ELSE 0 END) / SUM(CASE WHEN action = 'show' THEN 1 ELSE 0 END),0) AS ans
FROM survey_log GROUP BY question_id ORDER BY ans DESC) AS T
LIMIT 1
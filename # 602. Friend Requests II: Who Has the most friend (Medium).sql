# 602. Friend Requests II: Who Has the most friends (Medium)
SELECT id, COUNT(DISTINCT accepter_id) AS num FROM
(SELECT requester_id AS id, accepter_id
FROM request_accepted UNION ALL
(SELECT accepter_id, requester_id FROM request_accepted)) AS T
GROUP BY id
ORDER BY num DESC
LIMIT 1
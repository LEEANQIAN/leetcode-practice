# 1212. Team Scores in Football Tournament (Medium)

WITH host AS (
    SELECT host_team AS team_id,
    SUM(CASE WHEN host_goals > guest_goals THEN 3
       WHEN host_goals < guest_goals THEN 0
       ELSE 1 END) AS scores
    FROM Matches GROUP BY host_team
), guest AS (
    SELECT guest_team AS team_id,
    SUM(CASE WHEN host_goals < guest_goals THEN 3
       WHEN host_goals > guest_goals THEN 0
       ELSE 1 END) AS scores
    FROM Matches GROUP BY guest_team
)

SELECT Teams.team_id, Teams.team_name, 
IFNULL(SUM(scores),0) AS num_points
FROM Teams LEFT JOIN (SELECT * FROM host UNION ALL SELECT * FROM guest) AS T
ON Teams.team_id = T.team_id
GROUP BY team_id
ORDER BY num_points DESC, team_id
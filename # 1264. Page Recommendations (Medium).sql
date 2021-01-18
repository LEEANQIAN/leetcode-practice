# 1264. Page Recommendations (Medium)
WITH friend_T AS (
    SELECT * FROM
    (SELECT user2_id AS friends FROM Friendship WHERE user1_id = 1) AS T UNION
    (SELECT user1_id AS friends FROM Friendship WHERE user2_id = 1)
), likes_T AS (
    SELECT page_id FROM Likes WHERE user_id = 1
)

SELECT DISTINCT page_id AS recommended_page 
FROM Likes
WHERE page_id NOT IN (SELECT page_id FROM likes_T)
AND user_id IN (SELECT friends FROM friend_T)
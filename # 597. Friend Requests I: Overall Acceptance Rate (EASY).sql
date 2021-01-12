# 597. Friend Requests I: Overall Acceptance Rate (EASY)
SELECT ROUND(IFNULL(COUNT(DISTINCT requester_id, accepter_id) / 
             COUNT(DISTINCT sender_id, send_to_id),0),2) AS accept_rate
FROM RequestAccepted, FriendRequest
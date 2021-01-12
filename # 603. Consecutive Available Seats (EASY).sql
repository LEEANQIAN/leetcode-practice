# 603. Consecutive Available Seats (EASY)
SELECT DISTINCT seat_id FROM cinema
WHERE free = 1
AND (seat_id-1 IN (SELECT seat_id FROM cinema WHERE free = 1)
     OR seat_id + 1 IN (SELECT seat_id FROM cinema WHERE free = 1))

# another solution using join
SELECT DISTINCT T1.seat_id FROM cinema AS T1 JOIN cinema AS T2
ON T1.seat_id = T2.seat_id + 1
OR T1.seat_id = T2.seat_id - 1
WHERE T1.free = 1 AND T2.free = 1
ORDER BY T1.seat_id

##  the resulted table of the above join table w/o WHERE condition is
## {"headers": ["seat_id", "free", "seat_id", "free"], "values": 
##				[[2, 0, 1, 1], 
##				 [1, 1, 2, 0], 
##				 [3, 1, 2, 0], 
##				 [2, 0, 3, 1], 
##				 [4, 1, 3, 1], 
##				 [3, 1, 4, 1], 
##				 [5, 1, 4, 1], 
##				 [4, 1, 5, 1]]}

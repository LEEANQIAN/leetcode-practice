# 626. Exchange Seats (Medium)
SELECT CASE
        WHEN MOD(total,2) <> 0 AND id = total THEN id
        WHEN MOD(id,2) = 0 THEN id - 1
        ELSE id + 1 END AS id, 
        student
FROM seat, (SELECT COUNT(*) AS total FROM seat) AS T
ORDER BY id
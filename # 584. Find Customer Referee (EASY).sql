# 584. Find Customer Referee (EASY)
SELECT name FROM customer
WHERE referee_id <> 2 OR referee_id IS NULL
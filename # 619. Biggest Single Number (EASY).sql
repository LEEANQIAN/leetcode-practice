# 619. Biggest Single Number (EASY)
SELECT MAX(num) AS num FROM
(SELECT num, COUNT(*) AS appear FROM my_numbers
GROUP BY num
HAVING appear <= 1) AS T
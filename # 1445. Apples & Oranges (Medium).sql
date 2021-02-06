# 1445. Apples & Oranges (Medium)
WITH apple AS( SELECT * FROM Sales WHERE fruit = 'apples'), 
orange AS (SELECT * FROM Sales WHERE fruit = 'oranges' )

SELECT apple.sale_date, (apple.sold_num - orange.sold_num) AS diff
FROM apple JOIN orange ON apple.sale_date = orange.sale_date
ORDER BY apple.sale_date
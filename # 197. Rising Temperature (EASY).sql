# 197. Rising Temperature (EASY) (usage of DATEDIFF)
SELECT W1.id FROM Weather AS W1
LEFT JOIN Weather AS W2 ON DATEDIFF(W1.recordDate,W2.recordDate) = 1 
WHERE (W1.Temperature - W2.Temperature) > 0
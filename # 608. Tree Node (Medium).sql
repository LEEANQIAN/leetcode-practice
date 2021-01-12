# 608. Tree Node (Medium)
SELECT id, CASE
    WHEN tree.id IN (SELECT id FROM tree WHERE p_id IS NULL) THEN 'Root'
    WHEN tree.id IN (SELECT p_id FROM tree) THEN 'Inner'
    ELSE 'Leaf'
    END AS 'Type'
FROM tree
ORDER BY id
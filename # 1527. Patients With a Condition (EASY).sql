# 1527. Patients With a Condition (EASY)
SELECT * FROM Patients
WHERE conditions LIKE 'DIAB1%' OR conditions LIKE '% DIAB1%'
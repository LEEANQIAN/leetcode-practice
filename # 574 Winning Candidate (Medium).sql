# 574 Winning Candidate (Medium)
SELECT Name FROM
(SELECT Candidate.id, Name, COUNT(Vote.id) OVER (PARTITION BY Candidate.id) AS votes FROM Candidate LEFT JOIN Vote ON Candidate.id = Vote.CandidateId) AS T
ORDER BY T.votes DESC
LIMIT 1
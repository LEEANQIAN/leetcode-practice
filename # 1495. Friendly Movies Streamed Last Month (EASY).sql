# 1495. Friendly Movies Streamed Last Month (EASY)
SELECT DISTINCT title FROM 
Content LEFT JOIN TVProgram ON Content.content_id = TVProgram.content_id
WHERE Kids_content = 'Y' AND content_type = 'Movies' 
AND program_date BETWEEN '2020-06-01' AND '2020-06-30'
# 1341. Movie Rating (Medium)
WITH review AS(
    SELECT name AS results FROM 
    Users LEFT JOIN Movie_Rating ON Users.user_id = Movie_Rating.user_id
    GROUP BY Users.user_id
    ORDER BY COUNT(*) DESC, name
    LIMIT 1
)

SELECT * FROM review UNION (SELECT title AS results FROM 
    Movies LEFT JOIN Movie_Rating ON Movies.movie_id = Movie_Rating.movie_id
    WHERE created_at BETWEEN '2020-02-01' AND '2020-02-29'
    GROUP BY Movies.movie_id
    ORDER BY IFNULL(AVG(rating),0) DESC, title
    LIMIT 1)
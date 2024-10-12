
--- 1. MySQL Query with Multiple Table Joins:**
--- **Query 1:** Get all movies with their directors, genres, and actors.


SELECT 
    m.title AS movie_title,
    CONCAT(d.first_name, ' ', d.last_name) AS director_name,
    g.genre_name,
    CONCAT(a.first_name, ' ', a.last_name) AS actor_name
FROM 
    Movies m
JOIN Directors d ON m.director_id = d.director_id
JOIN Genres g ON m.genre_id = g.genre_id
JOIN MovieActors ma ON m.movie_id = ma.movie_id
JOIN Actors a ON ma.actor_id = a.actor_id;


--- **Query 2:** Get user preferences for actors, writers, and genres.


SELECT 
    u.username,
    CONCAT(a.first_name, ' ', a.last_name) AS actor_name,
    CONCAT(w.first_name, ' ', w.last_name) AS writter_name,
    g.genre_name
FROM 
    Users u
LEFT JOIN UserPreferenceActors upa ON u.user_id = upa.user_id
LEFT JOIN Actors a ON upa.actor_id = a.actor_id
LEFT JOIN UserPreferenceWritters upw ON u.user_id = upw.user_id
LEFT JOIN Writter w ON upw.writter_id = w.writter_id
LEFT JOIN UserPreferenceGenre upg ON u.user_id = upg.user_id
LEFT JOIN Genres g ON upg.genre_id = g.genre_id;



--- 2. **MySQL Queries Using SQL Aggregate Functions:**
--- **Query 1:** Get the total number of movies and the average rating by each genre.


SELECT 
    g.genre_name,
    COUNT(m.movie_id) AS total_movies,
    AVG(m.rating) AS average_rating
FROM 
    Movies m
JOIN Genres g ON m.genre_id = g.genre_id
GROUP BY g.genre_name;


--- **Query 2:** Get the total number of movies directed by each director and their average rating.


SELECT 
    CONCAT(d.first_name, ' ', d.last_name) AS director_name,
    COUNT(m.movie_id) AS total_movies,
    AVG(m.rating) AS average_rating
FROM 
    Movies m
JOIN Directors d ON m.director_id = d.director_id
GROUP BY director_name;


--- 3. **MySQL Query Using Subquery:**
--- **Query:** Get movies with a rating higher than the average rating of all movies.


SELECT 
    m.title, 
    m.rating
FROM 
    Movies m
WHERE 
    m.rating > (SELECT AVG(rating) FROM Movies);


--- 4. **MySQL Query Using NULL Search Condition:**
--- **Query:** Get all actors who do not have a website listed.


SELECT 
    a.first_name, 
    a.last_name
FROM 
    Actors a
WHERE 
    a.website IS NULL;


--- 5. **MySQL Query Implementing GROUP BY and HAVING Clause:**
--- **Query:** Get genres that have more than 5 movies, along with the total number of movies in each genre.

SELECT 
    g.genre_name, 
    COUNT(m.movie_id) AS total_movies
FROM 
    Movies m
JOIN Genres g ON m.genre_id = g.genre_id
GROUP BY 
    g.genre_name
HAVING 
    COUNT(m.movie_id) > 5;

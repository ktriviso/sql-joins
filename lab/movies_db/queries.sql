-- Test query!!

SELECT * FROM users;

SELECT movies.title, directors.name
FROM movies
JOIN directors
ON (movies.director_id = directors.director_id)

SELECT movies.title, users.name
FROM  users_movies
JOIN users
ON (users.user_id = users_movies.user_id)
JOIN movies
ON (movies.movie_id = users_movies.movie_id)

SELECT movies.title, COUNT(users.user_id)
FROM  users_movies
JOIN users
ON (users.user_id = users_movies.user_id)
JOIN movies
ON (movies.movie_id = users_movies.movie_id)
GROUP BY movies.movie_id

SELECT movies.title, COUNT(users.user_id) AS count
FROM  users_movies
JOIN movies
ON (movies.movie_id = users_movies.movie_id)
JOIN directors
ON (directors.director_id = movies.director_id)
JOIN users
ON (users.user_id = users_movies.user_id)
GROUP BY movies.title
ORDER BY count DESC

SELECT users.name, COUNT(users_movies.movie_id) AS count, directors.name
FROM  users_movies
JOIN movies
ON (movies.movie_id = users_movies.movie_id)
JOIN directors
ON (directors.director_id = movies.director_id)
JOIN users
ON (users.user_id = users_movies.user_id)
GROUP BY users.name, directors.name
ORDER BY users.name

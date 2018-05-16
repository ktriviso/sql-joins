DROP DATABASE IF EXISTS movies_lab_db;
CREATE DATABASE movies_lab_db;
\connect movies_lab_db;
\i directors.sql;
\i movies.sql;
\i users.sql;
\i users_movies.sql;
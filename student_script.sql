/*
 * Statement of work
 * Names of Group Members: 
 * List resources used:
 * 
 * 
 * */

 /*1. Use a SQLite Query to create “movies” and “ratings” tables to hold the 
  * data in the Data_Challenge.db*/

CREATE TABLE ratings (
	userId int DEFAUT '0',
	movieId int DEFAULT '0',
	rating DECIMAL(10, 5) DEFAULT '0.0',
	DATETIME timestamp DEFAULT NULL
);

CREATE TABLE movies (
	movieId int DEFAULT '0',
	title varchar(50) DEFAULT NULL,
	genres varchar(50) DEFAULT NULL
);
 
ATTACH DATABASE 'Data_Challenge.db' as Data_Challenge;

/* 2. IMPORT .csv files via GUI*/

/* 3. Your next table must be called ‘s3_users_count’, in your single query you must 
 * create the table, and fill it with relevant data from the ‘ratings’ table. We want to 
 * see how many times each userId left a review. */ 

CREATE TABLE s3_users_count (
	userID int DEFAULT '0',
	num_of_reviews int DEFAULT '0'
);

INSERT INTO s3_users_count (userId, num_of_reviews)
SELECT userId, COUNT(*) as num_of_reviews FROM ratings GROUP BY userId;

/* 4. Your next table must be called ‘s4_popular_movies’, in your single query you must
create the table and fill it with relevant data from both the ‘movies’ table and the 
‘ratings’ table. The goal of this table is to match each movie title with the number 
of times it was reviewed. The resulting table will have 3 columns: ‘movieId’, ‘title’ 
and ‘num_of_reviews’*/

CREATE TABLE s4_popular_movies (
	movieId int DEFAULT '0',
	title varchar(50) DEFAULT NULL,
	num_of_reviews int DEFAULT '0'
);

INSERT INTO s4_popular_movies (movieId, title, num_of_reviews)
SELECT m.movieId, m.title, count(r.movieId) as num_of_reviews
FROM movies m, ratings r
WHERE r.movieId = m.movieId
GROUP BY m.movieId, m.title; 

/* 5.  Your next table must be called ‘s5_highest_stars’. After seeing the most reviewed
movies, we want to see the highest rating movies to compare. In your single query you 
must create the table and fill it with data on each movie's id, title and their average 
star rating. The resulting table will have 3 columns: ‘movieId’, ‘title’, ‘average_rating’*/

CREATE TABLE s5_highest_stars (
	movieId int DEFAULT '0',
	title varchar(50) DEFAULT NULL,
	average_rating DECIMAL(10, 5)
);

INSERT INTO s5_highest_stars (movieId, title, average_rating)
SELECT m.movieId, m.title, avg(r.rating) as average_rating
FROM movies m, ratings r
WHERE r.movieId = m.movieId
GROUP BY m.movieId, m.title; 

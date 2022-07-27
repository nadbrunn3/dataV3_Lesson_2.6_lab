USE sakila;_————————————————————————————————————————————————————————————————————————————————————————p3+6o0 589/

-- 1. In the table actor, which are the actors whose last names are not repeated?

SELECT last_name
FROM sakila.actor
GROUP BY last_name
HAVING COUNT(*) = 1;


-- 2. Which last names appear more than once? 

SELECT last_name
FROM sakila.actor
GROUP BY last_name
HAVING COUNT(*) > 1;

-- 3. Using the rental table, find out how many rentals were processed by each employee.

SELECT staff_id, COUNT(rental_id)
FROM sakila.rental
GROUP BY staff_id
HAVING COUNT(*);

-- 4. Using the film table, find out how many films were released each year.

SELECT COUNT(film_id) AS num_of_films, release_year 
FROM sakila.film
GROUP BY release_year
HAVING COUNT(*);

-- 5. Using the film table, find out for each rating how many films were there.

SELECT COUNT(film_id), rating
FROM sakila.film
GROUP BY rating
HAVING COUNT(film_id);

-- 6. What is the mean length of the film for each rating type. Round off the average lengths to two decimal places 

SELECT ROUND(AVG(length)), rating
FROM sakila.film
GROUP BY rating
HAVING AVG(length);

-- 7. Which kind of movies (rating) have a mean duration of more than two hours?

SELECT ROUND(AVG(length)), rating
FROM sakila.film
GROUP BY rating
HAVING AVG(length) > 120;

-- 8. Rank films by length (filter out the rows that have nulls or 0s in length column). 


SELECT title, length, RANK()
OVER (ORDER BY length DESC) AS ranking
FROM sakila.film
WHERE length > 0 OR length IS NOT NULL;

SELECT title, length, DENSE_RANK()
OVER (ORDER BY length DESC) AS ranking
FROM sakila.film
WHERE length > 0 OR length IS NOT NULL;
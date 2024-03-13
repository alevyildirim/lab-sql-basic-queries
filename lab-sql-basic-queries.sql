USE sakila;
-- 1. Display all available tables in the Sakila database.
SHOW TABLES;

-- 2.Retrieve all the data from the tables actor, film and customer.

SELECT * FROM actor;
SELECT * FROM film;
SELECT * FROM customer;

-- 3. Retrieve the following columns from their respective tables:
-- Titles of all films from the film table

SELECT title FROM film;

--  List of languages used in films, with the column aliased as language from the language table

SELECT name AS language FROM language;

-- List of first names of all employees from the staff table

SELECT first_name FROM staff;

-- 4.Retrieve unique release years.

SELECT DISTINCT release_year FROM film;

-- Counting records for database insights:
-- Determine the number of stores that the company has.
SELECT COUNT(DISTINCT store_id) AS number_of_stores
FROM store;

-- Determine the number of employees that the company has.
SELECT COUNT(DISTINCT staff_id) AS number_of_employes
FROM staff;

-- Determine how many films are available for rent and how many have been rented.
-- Count the number of films available for rent
SELECT COUNT(*) AS num_films_available
FROM inventory
WHERE NOT EXISTS (
    SELECT 1
    FROM rental
    WHERE inventory.inventory_id = rental.inventory_id
    AND rental.return_date IS NULL
);

SELECT COUNT(*) AS num_films_rented
FROM rental
WHERE return_date IS NULL;

-- Determine the number of distinct last names of the actors in the database.
SELECT COUNT(DISTINCT last_name) AS number_of_actors
FROM actor;

-- 6.Retrieve the 10 longest films.
SELECT title, length from film 
ORDER BY length DESC
LIMIT 10;

-- 7. Use filtering techniques in order to:
-- 7.1 Retrieve all actors with the first name "SCARLETT".
SELECT * FROM actor 
WHERE first_name = "SCARLET";

-- BONUS
-- Retrieve all movies that have ARMAGEDDON in their title and have a duration longer than 100 minutes.

SELECT * FROM film 
WHERE title LIKE "%ARMAGEDDON%"
AND length > 100;

-- Determine the number of films that include Behind the Scenes content

SELECT COUNT(*) AS number_of_films_with_behind_the_scenes 
from film
WHERE special_features LIKE "%Behind_the_Scenes%";
 








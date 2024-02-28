-- Analyzing the Distribution of Films based on Rental Duration and Categories

/*
   This query investigates the distribution of films within specified categories based on their rental duration.
   It selects relevant attributes such as film title, category name, rental duration, and assigns a standard quartile based on rental duration.
   The NTILE(4) function is utilized to divide films into four quartiles, providing insights into the distribution of rental durations within each category.
*/

SELECT
  f.title AS film_title,
  c.name AS category_name,
  f.rental_duration AS rental_duration,
  NTILE(4) OVER (ORDER BY f.rental_duration) AS standard_quartile
FROM 
  film AS f
JOIN 
  film_category AS fc
  ON f.film_id = fc.film_id
JOIN 
  category AS c
  ON c.category_id = fc.category_id
WHERE 
  c.name IN ('Animation', 'Children', 'Classics', 'Comedy', 'Family', 'Music')
GROUP BY 
  1, 2, 3
ORDER BY 
  3;

--What does the distribution of films reveal according to each category's rental duration?

SELECT
  f.title film_title,
  c.name category_name,
  f.rental_duration AS rental_duration,
  NTILE(4) OVER (ORDER BY f.rental_duration) AS standard_quartile
FROM film f
JOIN film_category fc
  ON f.film_id = fc.film_id
JOIN category c
  ON c.category_id = fc.category_id
WHERE c.name IN ('Animation', 'Children', 'Classics', 'Comedy', 'Family', 'Music')
GROUP BY 1,
         2,
         3
ORDER BY 3
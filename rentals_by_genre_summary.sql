-- Count of Rentals for Each Movie Categorized by Film Genre

/*
   This query retrieves the count of rentals for each movie, categorized by film genre.
   It joins multiple tables including film_category, category, film, inventory, and rental to gather relevant information.
   The WHERE clause filters results based on specified film genres.
   The COUNT function is used to calculate the number of rentals for each movie within the selected genres.
   Results are grouped by film title and category name, providing a summary of rental counts for each movie in each genre.
   The ORDER BY clause sorts the results first by category name and then by film title.
*/

SELECT 
    f.title AS film_title, 
    c.name AS category_name, 
    COUNT(r.rental_id) AS rental_count
FROM 
    film_category fc
JOIN 
    category c ON c.category_id = fc.category_id
JOIN 
    film f ON f.film_id = fc.film_id
JOIN 
    inventory i ON i.film_id = f.film_id
JOIN 
    rental r ON r.inventory_id = i.inventory_id
WHERE 
    c.name IN ('Animation', 'Children', 'Classics', 'Comedy', 'Family', 'Music')
GROUP BY 
    film_title, category_name
ORDER BY 
    category_name, film_title;

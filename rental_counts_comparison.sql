-- Comparing Monthly Rental Order Counts Between Two Stores

/*
   This query compares the monthly rental order counts between two stores.
   It selects attributes such as the rental month, rental year, store ID, and the count of rentals.
   The query joins the rental, payment, staff, and store tables to obtain relevant information.
   Grouping is done based on rental month, rental year, and store ID to facilitate the comparison.
   The result provides insights into the rental activity for each store over different months.
*/

SELECT
  DATE_PART('MONTH', rental_date) AS Rental_month,
  DATE_PART('YEAR', rental_date) AS Rental_year,
  store.store_id AS Store_ID,
  COUNT(*) AS Count_rentals
FROM 
  rental
JOIN 
  payment
  ON payment.rental_id = rental.rental_id
JOIN 
  staff
  ON staff.staff_id = payment.staff_id
JOIN 
  store
  ON store.store_id = staff.store_id
GROUP BY 
  1, 2, 3
ORDER BY 
  4 DESC;

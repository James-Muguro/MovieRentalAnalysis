--How do monthly rental order counts compare between the two stores?

SELECT
  DATE_PART('MONTH', rental_date) Rental_month,
  DATE_PART('YEAR', rental_date) Rental_year,
  store.store_id Store_ID,
  COUNT(*) AS Count_rentals
FROM rental
JOIN payment
  ON payment.rental_id = rental.rental_id
JOIN staff
  ON staff.staff_id = payment.staff_id
JOIN store
  ON store.store_id = staff.store_id
GROUP BY 1,
         2,
         3
ORDER BY 4 DESC
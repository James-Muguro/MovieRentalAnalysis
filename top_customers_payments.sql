-- Monthly payments of the top 10 paying customers in 2007

/*
   This query retrieves the monthly payments of the top 10 paying customers in 2007.
   It joins the 'customer' and 'payment' tables to get information about customers and their payments.
   The inner subquery identifies the top 10 paying customers based on the total payment amount.
   The main query then filters payments for these customers between January 1, 2007, and January 1, 2008.
   It calculates the count and total amount of payments for each customer in each month.
   The result provides insights into the payment patterns of the top customers during 2007.
*/
SELECT
  DATE_TRUNC('month', p.payment_date) AS pay_month,
  c.first_name || ' ' || c.last_name AS full_name, 
  COUNT(p.amount) AS pay_count_per_mon,
  SUM(p.amount) AS pay_amount
FROM
  customer c
JOIN
  payment p ON p.customer_id = c.customer_id
WHERE
  c.first_name || ' ' || c.last_name IN
  (
    SELECT
      t1.full_name
    FROM
      (
        SELECT
          c.first_name || ' ' || c.last_name AS full_name,
          SUM(p.amount) AS amount_total
        FROM
          customer c
        JOIN
          payment p ON p.customer_id = c.customer_id
        GROUP BY
          1
        ORDER BY
          2 DESC
        LIMIT 10
      ) t1
  )
  AND (p.payment_date BETWEEN '2007-01-01' AND '2008-01-01')
GROUP BY
  2,1
ORDER BY
  2,1,3;

1. -- Select the payment date and the sum of the payment amounts for each date
SELECT payment_date, SUM(amount) AS total_amount
FROM payments
-- Group the results by payment date
GROUP BY payment_date
-- Order the results by payment date in descending order (latest date first)
ORDER BY payment_date DESC
-- Limit the results to the top 5 latest payment dates
LIMIT 5;



2. -- Select customer name, country, and the average credit limit for each customer
SELECT customer_name, country, AVG(credit_limit) AS average_credit_limit
FROM customers
-- Group the results by customer name and country to calculate the average per group
GROUP BY customer_name, country;



3. -- Select the product code, quantity ordered, and the total price (quantity * price) for each product
SELECT product_code, quantity_ordered, SUM(quantity_ordered * price_each) AS total_price
FROM orderdetails
-- Group the results by product code and quantity ordered
GROUP BY product_code, quantity_ordered;


4. -- Select the check number and the maximum payment amount for each check number
SELECT check_number, MAX(amount) AS highest_amount
FROM payments
-- Group the results by check number to find the highest payment for each
GROUP BY check_number;

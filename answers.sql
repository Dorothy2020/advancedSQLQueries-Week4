CREATE TABLE payments (
    payment_id INT AUTO_INCREMENT PRIMARY KEY,
    customer_id INT,
    check_number VARCHAR(50),
    payment_date DATE,
    amount DECIMAL(10,2)
);


-- Dummy data
INSERT INTO payments (customer_id, check_number, payment_date, amount) VALUES
(1, 'CHK001', '2023-12-01', 500.00),
(2, 'CHK002', '2023-12-01', 300.00),
(3, 'CHK003', '2023-12-03', 700.00),
(1, 'CHK004', '2023-12-05', 450.00),
(2, 'CHK005', '2023-12-06', 600.00);






CREATE TABLE customers (
    customer_id INT AUTO_INCREMENT PRIMARY KEY,
    customer_name VARCHAR(100),
    country VARCHAR(50),
    credit_limit DECIMAL(10,2)
);

-- Dummy data
INSERT INTO customers (customer_name, country, credit_limit) VALUES
('Alice Corp', 'USA', 10000.00),
('Beta Ltd', 'UK', 8000.00),
('Gamma LLC', 'USA', 9500.00),
('Alice Corp', 'USA', 12000.00);




CREATE TABLE orderdetails (
    order_id INT AUTO_INCREMENT PRIMARY KEY,
    product_code VARCHAR(50),
    quantity_ordered INT,
    price_each DECIMAL(10,2)
);

-- Dummy  data
INSERT INTO orderdetails (product_code, quantity_ordered, price_each) VALUES
('S10_1678', 30, 95.70),
('S10_1949', 50, 55.09),
('S12_1108', 22, 45.23),
('S18_3232', 60, 75.99);


-- 1. Total payment amount for each date
SELECT payment_date, SUM(amount) AS total_amount
FROM payments
GROUP BY payment_date
ORDER BY payment_date DESC
LIMIT 5;
;


-- 2. Average credit limit by customer
SELECT customer_name, country, AVG(credit_limit) AS average_credit_limit
FROM customers
GROUP BY customer_name, country;



-- 3. Total price of products ordered
SELECT product_code, quantity_ordered, SUM(quantity_ordered * price_each) AS total_price
FROM orderdetails
GROUP BY product_code, quantity_ordered;




-- 4. Highest payment per check number
SELECT check_number, MAX(amount) AS highest_amount
FROM payments
GROUP BY check_number;

 
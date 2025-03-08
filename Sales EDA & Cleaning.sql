
# Sales EDA & Cleaning

# total number of transactions
SELECT COUNT(*)
FROM transactions;

# total number of customers
SELECT COUNT(*)
FROM customers;

# number of transactions made in Chennai
SELECT COUNT(t.market_code)
FROM markets m
INNER JOIN transactions t
ON m.markets_code = t.market_code
WHERE m.markets_name = 'Chennai';

# transactions with currency other than INR
SELECT *
FROM transactions
WHERE currency <> 'INR';

# number of transactions made by year
SELECT d.`year`, COUNT(*)
FROM transactions t
INNER JOIN `date` d
ON t.order_date = d.`date`
GROUP BY d.`year`;

# total revenue by year
SELECT d.`year`, SUM(t.sales_amount) AS revenue
FROM transactions t
INNER JOIN `date` d
ON t.order_date = d.`date`
GROUP BY d.`year`;

# distinct products in Chennai
SELECT DISTINCT t.product_code
FROM transactions t
INNER JOIN markets m
ON m.markets_code = t.market_code
WHERE m.markets_name = 'Chennai';

# number of customers in each type
SELECT customer_type, COUNT(customer_type)
FROM customers
GROUP BY customer_type;


# removing rows with Paris or New York in the market name
DELETE
FROM markets
WHERE markets_name IN ('Paris', 'New York');

# converting the USD sales amounts to INRs
UPDATE transactions
SET sales_amount = sales_amount * 87.5, currency = 'INR'
WHERE currency = 'USD';
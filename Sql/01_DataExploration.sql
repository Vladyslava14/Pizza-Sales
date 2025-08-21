use PizzaDB

SELECT * FROM pizza_cleaned

--Total Revenue
SELECT SUM(total_price) AS Total_Revenue from pizza_cleaned

-- Unique sizes
SELECT DISTINCT pizza_size FROM pizza_cleaned

--Average Order Value
SELECT (SUM(total_price) / COUNT(DISTINCT order_id)) AS AvgOrderValues
FROM pizza_cleaned

-- Date range
SELECT MIN(order_date) AS FirstOrderDate, MAX(order_date) AS LastOrderDate FROM pizza_cleaned;

--Total Pizzas Sold
SELECT SUM(quantity) AS TotalPizzSold FROM pizza_cleaned

-- Unique categories
SELECT DISTINCT pizza_category FROM pizza_cleaned;

--Total Orders
SELECT COUNT(DISTINCT order_id) AS TotalOrders FROM pizza_cleaned

--Average Pizzas per Order
SELECT CAST(CAST(SUM(quantity) as decimal(10,2)) /
CAST(COUNT(DISTINCT order_id) AS decimal(10,2))  AS decimal(10,2)) AS AvgPizzPerOrder FROM pizza_cleaned
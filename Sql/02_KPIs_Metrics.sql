use PizzaDB

SELECT * FROM pizza_cleaned

--Total Revenue
SELECT SUM(total_price) AS Total_Revenue from pizza_cleaned

-- The most profitable day
SELECT TOP 1 
  order_date, 
  SUM(total_price) AS Total_Revenue
FROM pizza_cleaned
GROUP BY order_date
ORDER BY Total_Revenue DESC

--Average Order Value
SELECT (SUM(total_price) / COUNT(DISTINCT order_id)) AS AvgOrderValues
FROM pizza_cleaned

-- The most productive hour
SELECT TOP 1 
  DATEPART(HOUR, order_time) AS Order_Hour,
  COUNT(DISTINCT order_id) AS Total_Orders
FROM pizza_cleaned
GROUP BY DATEPART(HOUR, order_time)
ORDER BY Total_Orders DESC

--Total Pizzas Sold
SELECT SUM(quantity) AS TotalPizzSold FROM pizza_cleaned

--Total Orders
SELECT COUNT(DISTINCT order_id) AS TotalOrders FROM pizza_cleaned

-- The most expensive pizzas (by average price per unit)
SELECT TOP 5 
  pizza_name, 
  AVG(unit_price) AS Avg_Unit_Price
FROM pizza_cleaned
GROUP BY pizza_name
ORDER BY Avg_Unit_Price DESC

-- The cheapest pizzas (by average price per unit)
SELECT TOP 5 
  pizza_name, 
  AVG(unit_price) AS Avg_Unit_Price
FROM pizza_cleaned
GROUP BY pizza_name
ORDER BY Avg_Unit_Price ASC

--Average Pizzas per Order
SELECT CAST(CAST(SUM(quantity) as decimal(10,2)) /
CAST(COUNT(DISTINCT order_id) AS decimal(10,2))  AS decimal(10,2)) AS AvgPizzPerOrder FROM pizza_cleaned
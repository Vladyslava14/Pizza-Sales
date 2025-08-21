use PizzaDB

SELECT * FROM pizza_cleaned

--Daily Trend for Total Orders:
SELECT DATENAME(DW, order_date) as order_day, COUNT(DISTINCT order_id) as Total_orders
from pizza_cleaned
GROUP BY DATENAME(DW, order_date)

-- Revenue by Pizza Category
SELECT 
  pizza_category,
  SUM(total_price) AS total_revenue
FROM pizza_cleaned
GROUP BY pizza_category
ORDER BY total_revenue DESC

--Hourly Trend for Total Orders:
SELECT DATEPART(HOUR, order_time) AS order_hours, COUNT(DISTINCT order_id) AS Total_orders
FROM pizza_cleaned
GROUP BY DATEPART(HOUR, order_time)
ORDER BY DATEPART(HOUR, order_time)

-- Orders per Day
SELECT 
  order_date,
  COUNT(DISTINCT order_id) AS total_orders
FROM pizza_cleaned
GROUP BY order_date

--Percentage of Sales by Pizza Category
SELECT pizza_category, SUM(total_price) as Total_Sales, 
SUM(total_price) * 100 / (SELECT SUM(total_price) from pizza_cleaned WHERE MONTH (order_id) = 1) AS PCT
from pizza_cleaned 
WHERE MONTH(order_date) = 1 -- Januar
GROUP BY pizza_category

--Percentage of Sales by Pizza Size
SELECT pizza_size, SUM(total_price) as Total_Sales,
SUM(total_price) * 100 / (SELECT SUM(total_price) from pizza_cleaned WHERE DATEPART(QUARTER, order_date) = 1) AS PCT
from pizza_cleaned
WHERE DATEPART (QUARTER, order_date) = 1
GROUP BY pizza_size
ORDER BY PCT DESC

--Total Pizzas Sold by Pizza Category
SELECT pizza_category, SUM(quantity) as TotalPizzasSold
from pizza_cleaned
Group by pizza_category

--Top 5 Best Sellers by Total Pizzas Sold
SELECT TOP 5 pizza_name, SUM(quantity) as TotalPizzasSold
from pizza_cleaned
Group by pizza_name
Order by SUM(quantity) DESC

--Top 5 Worst Sellers by Total Pizzas Sold
SELECT TOP 5 pizza_name, SUM(quantity) as TotalPizzasSold
from pizza_cleaned
where MONTH(order_date) = 8 -- August
Group by pizza_name
Order by SUM(quantity) ASC
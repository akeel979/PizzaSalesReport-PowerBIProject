SELECT * FROM pizza_sales



SELECT DATENAME(DW, order_date) as order_day, COUNT(DISTINCT order_id) as Total_Orders
from pizza_sales
GROUP BY DATENAME(DW, order_date)

 select SUM(total_price) AS Total_Revenue from pizza_sales

 SELECT SUM(total_price) / COUNT(DISTINCT order_id) as Avg_Order_Value
from pizza_sales

SELECT SUM(quantity) as Total_Pizza_Sold
from pizza_sales

SELECT COUNT(DISTINCT order_id)  as Total_Orders
from pizza_sales
SELECT CAST(CAST(SUM(quantity) AS DECIMAL(10,2)) / CAST(COUNT(DISTINCT order_id) AS DECIMAL(10,2)) AS DECIMAL(10,2))
AS Average_Pizza_Per_Order
from pizza_sales


SELECT pizza_category,SUM(total_price) as Total_Sales, sum(total_price) * 100 / (SELECT SUM(total_price) from pizza_sales WHERE MONTH(order_date) = 1) as PCT
from pizza_sales
WHERE MONTH(order_date) = 1
GROUP BY pizza_category


SELECT pizza_size,CAST(SUM(total_price) AS DECIMAL(10,2)) as Total_Sales, CAST(sum(total_price) * 100 /
(SELECT SUM(total_price) from pizza_sales ) AS DECIMAL(10,2)) as PCT
from pizza_sales
GROUP BY pizza_size
ORDER BY PCT DESC


SELECT TOP 5 pizza_name, count(distinct order_id) AS total_orders  FROM pizza_sales
GROUP BY pizza_name
ORDER BY total_orders desc
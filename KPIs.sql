CREATE DATABASE Pizza_DB;

USE Pizza_DB;

SELECT * FROM [Pizza Sales];

-- Total Revenue
SELECT ROUND(SUM(total_price), 2) As [Total Revenue] FROM [Pizza Sales]; 

-- Average Order Value
SELECT ROUND(SUM(total_price) / Count(DISTINCT order_id), 2) AS [Average order value] FROM [Pizza Sales];

-- Total Pizza Sold
SELECT SUM(quantity) AS [Total Pizza Sold] FROM [Pizza Sales];

-- Total Orders
SELECT COUNT(DISTINCT order_id) AS [Total Orders] FROM [Pizza Sales];

-- Average Pizza Per order
SELECT 
	CAST(CAST(SUM(quantity) AS DECIMAL(10,2))/CAST(COUNT(DISTINCT order_id) AS DECIMAL(10,2)) AS DECIMAL(10,2)) AS [AVG Pizza per Order] 
FROM 
	[Pizza Sales];

-- Trend for total orders (Daily Trend)
SELECT 
	DATENAME(W, order_date) AS Order_Day, 
	COUNT(DISTINCT order_id) AS [Total Orders] 
FROM
	[Pizza Sales]
GROUP BY
	DATENAME(W, order_date)
ORDER BY
	DATENAME(W, order_date);


-- Hourly Trend for Total Orders
SELECT
	DATEPART(HH, order_time) AS [Order Time],
	COUNT(DISTINCT order_id) AS [Total Orders]
FROM
	[Pizza Sales]
GROUP BY
	DATEPART(HH, order_time)
ORDER BY
	DATEPART(HH, order_time);


-- Percentage of Sales by Pizza Category
SELECT
	pizza_category,
	ROUND(SUM(total_price)*100/(SELECT SUM(total_price) FROM [Pizza Sales]), 2) AS [Percentage of Sales] 
FROM
	[Pizza Sales]
GROUP BY
	pizza_category;


-- Percentage of Sales by Pizza Size
SELECT
	pizza_size,
	ROUND(SUM(total_price)*100/(SELECT SUM(total_price) FROM [Pizza Sales]), 2) AS [Percentage of Sales]
FROM 
	[Pizza Sales]
GROUP BY
	pizza_size
ORDER BY
	pizza_size;


-- Total Pizza Sold by Pizza Category
SELECT
	pizza_category,
	SUM(quantity) AS [Total Pizza]
FROM
	[Pizza Sales]
GROUP BY
	pizza_category;


-- Top 5 Pizza Sold
SELECT
	TOP 5 pizza_name,
	SUM(quantity) AS [Total Pizza Sold]
FROM 
	[Pizza Sales]
GROUP BY
	pizza_name
ORDER BY
	SUM(quantity) DESC;

-- Worst 5 Pizza 
SELECT
	TOP 5 pizza_name,
	SUM(quantity) AS [Total Pizza Sold]
FROM 
	[Pizza Sales]
GROUP BY
	pizza_name
ORDER BY
	SUM(quantity) ASC;



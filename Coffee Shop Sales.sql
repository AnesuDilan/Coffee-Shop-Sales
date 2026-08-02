CREATE DATABASE coffee_shop_sales;
USE coffee_shop_sales;

--Data Cleaning
	--Checking the number of records:
	SELECT COUNT (*) AS TotalRecords
	FROM Coffee_Shop_Sales;

	--Check for Null values:
	SELECT
    SUM(CASE WHEN transaction_id IS NULL THEN 1 ELSE 0 END) AS transaction_id,
    SUM(CASE WHEN transaction_date IS NULL THEN 1 ELSE 0 END) AS transaction_date,
    SUM(CASE WHEN transaction_time IS NULL THEN 1 ELSE 0 END) AS transaction_time,
    SUM(CASE WHEN transaction_qty IS NULL THEN 1 ELSE 0 END) AS transaction_qty,
    SUM(CASE WHEN store_location IS NULL THEN 1 ELSE 0 END) AS store_location,
    SUM(CASE WHEN unit_price IS NULL THEN 1 ELSE 0 END) AS unit_price,
    SUM(CASE WHEN product_category IS NULL THEN 1 ELSE 0 END) AS product_category,
    SUM(CASE WHEN product_type IS NULL THEN 1 ELSE 0 END) AS product_type,
    SUM(CASE WHEN product_detail IS NULL THEN 1 ELSE 0 END) AS product_detail
    FROM Coffee_Shop_Sales;

    --Check for duplicate transaction:
    SELECT
    transaction_id,
    COUNT(*) AS DuplicateCount
    FROM Coffee_Shop_Sales
    GROUP BY transaction_id
    HAVING COUNT(*) > 1;

-- Data Exploration
    --Total Transactions
    SELECT COUNT(*) AS TotalTransactions
    FROM Coffee_Shop_Sales;

    --Number of Stores 
    SELECT COUNT(DISTINCT store_location) AS stores
    FROM Coffee_Shop_Sales;

    --Date range
    SELECT
    MIN(transaction_date) AS StartDate,
    MAX(transaction_date) AS EndDate
    FROM Coffee_Shop_Sales;

    --Price Statistics 
    SELECT
    MIN(unit_price) AS Cheapest,
    MAX(unit_price) AS MostExpensive,
    AVG(unit_price) AS AveragePrice
    FROM Coffee_Shop_Sales;

    --Product Categories
    SELECT DISTINCT product_category
    FROM Coffee_Shop_Sales;

     --===== Add column ====
    --Time Period
    ALTER TABLE Coffee_Shop_Sales
        ADD Time_Period AS
        CASE
            WHEN DATEPART(HOUR, transaction_time) < 12 THEN 'Morning'
            WHEN DATEPART(HOUR, transaction_time) < 17 THEN 'Afternoon'
            ELSE 'Evening'
        END;

    -- Month
    ALTER TABLE Coffee_Shop_Sales
    ADD Month_Name AS DATENAME(MONTH, transaction_date);

    -- Day Name 
    ALTER TABLE Coffee_Shop_Sales
    ADD Day_Name AS DATENAME(WEEKDAY, transaction_date);

    --Revenue
    ALTER TABLE Coffee_Shop_Sales
    ADD Revenue AS transaction_qty * unit_price;

    /*=== SALES OVERVIEW ===*/

-- 1.What is the total revenue generate:
SELECT SUM(Revenue) TotalRevenue
FROM Coffee_Shop_Sales;

-- 2.How many transactions were made?
SELECT COUNT(transaction_id) TotalTransactions
FROM Coffee_Shop_Sales;

-- 3.How many products were sold?
SELECT COUNT(transaction_qty) AS Total_Products
FROM Coffee_Shop_Sales;

-- 4.What is the average transaction value:
SELECT ROUND(AVG(Revenue), 2) Avg_Transaction_Value
FROM Coffee_Shop_Sales;

--Changing the data type of transaction_qty
ALTER TABLE Coffee_Shop_Sales
ALTER COLUMN transaction_qty INT;

-- 5.What is the average quantity per transaction:
SELECT AVG(transaction_qty) AS Avg_Transaction_Quantity
FROM Coffee_Shop_Sales;

-- 6.What is the highest single transaction amount?
SELECT MAX(unit_price) AS Highest_Unit_Price
FROM Coffee_Shop_Sales;

-- 7.What is the lowest single transaction amount?
SELECT MIN(unit_price) AS Lowest_Unit_Price
FROM Coffee_Shop_Sales;

        -- Monthly & Daily Performance --

-- 8.Which month generated the highest revenue?
SELECT TOP (1) Month_Name, ROUND(SUM(Revenue), 2) AS Total_Revenue
FROM Coffee_Shop_Sales
GROUP BY Month_Name
ORDER BY Total_Revenue DESC;

-- 9.What are the monthly sales trends?
SELECT Month_Name, ROUND(SUM(Revenue), 2) AS Monthly_Sales
FROM Coffee_Shop_Sales
GROUP BY Month_Name
ORDER BY Monthly_Sales DESC;

-- 10.Which day recorded the highest sales?
SELECT TOP(1) Day_Name, SUM(transaction_qty) AS Highest_Sales
FROM Coffee_Shop_Sales
GROUP BY Day_Name
ORDER BY Highest_Sales DESC;

-- 11.Which weekday generates the most revenue?
SELECT TOP(1) Day_Name, ROUND(SUM(Revenue), 2) AS Highest_Revenue
FROM Coffee_Shop_Sales
GROUP BY Day_Name
ORDER BY Highest_Revenue DESC

-- 12.Which weekday has the most transactions?
SELECT TOP(1) Day_Name, COUNT(transaction_qty) AS Total_Transactions
FROM Coffee_Shop_Sales
GROUP BY Day_Name
ORDER BY Total_Transactions DESC;

-- 13.What is the average daily revenue?                                                                                                                                                                                                                                               

--CTE
WITH DailyRevenue AS
(
    SELECT
        transaction_date,
        Day_Name,
        SUM(Revenue) AS Daily_Revenue
    FROM Coffee_Shop_Sales
    GROUP BY transaction_date, Day_Name
)

SELECT
    Day_Name,
    ROUND(AVG(Daily_Revenue),2) AS Average_Daily_Revenue
FROM DailyRevenue
GROUP BY Day_Name;


SELECT TOP (10) *
FROM Coffee_Shop_Sales;

--Adding Hour Column
ALTER TABLE Coffee_Shop_Sales
ADD Hour_of_Day AS DATEPART(HOUR, transaction_time);

            -- PEAK TIME ANALYSIS --

-- 14.Which hour of the day has the most sales?
SELECT TOP (1) Hour_of_Day, ROUND(SUM(transaction_qty), 2) AS Highest_Sales
FROM Coffee_Shop_Sales
GROUP BY Hour_of_Day
ORDER BY Highest_Sales DESC;

-- 15.Which hour has the most transactions?
SELECT TOP (1) Hour_of_Day, COUNT(transaction_id) AS Total_Transactions
FROM Coffee_Shop_Sales
GROUP BY Hour_of_Day
ORDER BY Total_Transactions;

-- 16.What is the busiest hour in each store?
WITH HourlyTransactions AS
(
    SELECT
        store_location,
        Hour_of_Day,
        COUNT(transaction_id) AS Total_Transactions
    FROM Coffee_Shop_Sales
    GROUP BY store_location, Hour_of_Day
),

RankedHours AS
(
    SELECT *,
           ROW_NUMBER() OVER
           (
               PARTITION BY store_location
               ORDER BY Total_Transactions DESC
           ) AS Rank_No
    FROM HourlyTransactions
)

SELECT
    store_location,
    Hour_of_Day,
    Total_Transactions
FROM RankedHours
WHERE Rank_No = 1;

-- 17.During which hours should additional staff be scheduled?
WITH HourlyTransactions AS
(
    SELECT
        Hour_of_Day,
        COUNT(transaction_id) AS Total_Transactions
    FROM Coffee_Shop_Sales
    GROUP BY Hour_of_Day
)

SELECT
    Hour_of_Day,
    Total_Transactions
FROM HourlyTransactions
WHERE Total_Transactions >
(
    SELECT AVG(Total_Transactions * 1.0)
    FROM HourlyTransactions
)
ORDER BY Hour_of_Day;


-- 18.Which time period performs best?
SELECT TOP (1) Time_Period, ROUND(SUM(Revenue), 2) AS Total_Revenue
FROM Coffee_Shop_Sales
GROUP BY Time_Period
ORDER BY Total_Revenue DESC;

/*=========================================
        SECTION 4: STORE PERFORMANCE
=========================================*/

-- 20. Which store generates the highest revenue?
SELECT TOP (1)
    store_location,
    ROUND(SUM(Revenue), 2) AS Total_Revenue
FROM Coffee_Shop_Sales
GROUP BY store_location
ORDER BY Total_Revenue DESC;


-- 21. Which store has the highest number of transactions?
SELECT TOP (1)
    store_location,
    COUNT(transaction_id) AS Total_Transactions
FROM Coffee_Shop_Sales
GROUP BY store_location
ORDER BY Total_Transactions DESC;


-- 22. Which store sells the most products?
SELECT TOP (1)
    store_location,
    SUM(transaction_qty) AS Total_Products_Sold
FROM Coffee_Shop_Sales
GROUP BY store_location
ORDER BY Total_Products_Sold DESC;


-- 23. What is the average transaction value by store?
SELECT
    store_location,
    ROUND(AVG(Revenue), 2) AS Average_Transaction_Value
FROM Coffee_Shop_Sales
GROUP BY store_location
ORDER BY Average_Transaction_Value DESC;



 /*=========================================
        SECTION 5: PRODUCT ANALYSIS
=========================================*/

-- 25. Which product category generates the highest revenue?
SELECT TOP (1)
    product_category,
    ROUND(SUM(Revenue),2) AS Total_Revenue
FROM Coffee_Shop_Sales
GROUP BY product_category
ORDER BY Total_Revenue DESC;


-- 26. Which product category sells the most units?
SELECT TOP (1)
    product_category,
    SUM(transaction_qty) AS Products_Sold
FROM Coffee_Shop_Sales
GROUP BY product_category
ORDER BY Products_Sold DESC;


-- 27. Which product type generates the highest revenue?
SELECT TOP (1)
    product_type,
    ROUND(SUM(Revenue),2) AS Total_Revenue
FROM Coffee_Shop_Sales
GROUP BY product_type
ORDER BY Total_Revenue DESC;


-- 28. What are the Top 10 best-selling products?
SELECT TOP (10)
    product_detail,
    SUM(transaction_qty) AS Products_Sold
FROM Coffee_Shop_Sales
GROUP BY product_detail
ORDER BY Products_Sold DESC;


-- 29. What are the Bottom 10 selling products?
SELECT TOP (10)
    product_detail,
    SUM(transaction_qty) AS Products_Sold
FROM Coffee_Shop_Sales
GROUP BY product_detail
ORDER BY Products_Sold ASC;


-- 30. Which products generate the most revenue?
SELECT
    product_detail,
    ROUND(SUM(Revenue),2) AS Total_Revenue
FROM Coffee_Shop_Sales
GROUP BY product_detail
ORDER BY Total_Revenue DESC;


 /*=========================================
      SECTION 6: STORE VS PRODUCT ANALYSIS
=========================================*/

-- 31. Which product category sells best in each store?
WITH CategorySales AS
(
    SELECT
        store_location,
        product_category,
        SUM(transaction_qty) AS Products_Sold
    FROM Coffee_Shop_Sales
    GROUP BY
        store_location,
        product_category
),

RankedCategories AS
(
    SELECT *,
           ROW_NUMBER() OVER
           (
               PARTITION BY store_location
               ORDER BY Products_Sold DESC
           ) AS Rank_No
    FROM CategorySales
)

SELECT
    store_location,
    product_category,
    Products_Sold
FROM RankedCategories
WHERE Rank_No = 1;


-- 32. Which store sells the most coffee?
SELECT TOP (1)
    store_location,
    SUM(transaction_qty) AS Coffee_Sold
FROM Coffee_Shop_Sales
WHERE product_category = 'Coffee'
GROUP BY store_location
ORDER BY Coffee_Sold DESC;


-- 33. Which store sells the most bakery items?
SELECT TOP (1)
    store_location,
    SUM(transaction_qty) AS Bakery_Items_Sold
FROM Coffee_Shop_Sales
WHERE product_category = 'Bakery'
GROUP BY store_location
ORDER BY Bakery_Items_Sold DESC;


-- 34. Which store has the widest product mix?
SELECT
    store_location,
    COUNT(DISTINCT product_detail) AS Unique_Products
FROM Coffee_Shop_Sales
GROUP BY store_location
ORDER BY Unique_Products DESC;


-- 35. Which products perform poorly in certain stores?
WITH ProductSales AS
(
    SELECT
        store_location,
        product_detail,
        SUM(transaction_qty) AS Products_Sold
    FROM Coffee_Shop_Sales
    GROUP BY
        store_location,
        product_detail
),

RankedProducts AS
(
    SELECT *,
           ROW_NUMBER() OVER
           (
               PARTITION BY store_location
               ORDER BY Products_Sold ASC
           ) AS Rank_No
    FROM ProductSales
)

SELECT
    store_location,
    product_detail,
    Products_Sold
FROM RankedProducts
WHERE Rank_No <= 5
ORDER BY store_location, Products_Sold;
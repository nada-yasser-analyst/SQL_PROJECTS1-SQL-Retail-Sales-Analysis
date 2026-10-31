
-- =============================================
-- SQL Retail Sales Analysis - Part 1
-- =============================================

-- 1. CREATE DATABASE

CREATE DATABASE projects_1;
GO

USE projects_1;
GO

-- =============================================
-- 2. CREATE TABLE
-- =============================================

DROP TABLE IF EXISTS retail_sales;
GO

CREATE TABLE retail_sales (
    transactions_id INT PRIMARY KEY,
    sale_date DATE,
    sale_time TIME,
    customer_id INT,
    gender VARCHAR(15),
    age INT,
    category VARCHAR(50),
    quantiy INT,
    price_per_unit DECIMAL(10,2),
    cogs DECIMAL(10,2),
    total_sale DECIMAL(10,2)
);
GO

-- =============================================
-- 3. VIEW DATA
-- =============================================

SELECT *
FROM retail_sales;

-- Count Total Records

SELECT COUNT(*) AS total_records
FROM retail_sales;

-- =============================================
-- 4. DATA CLEANING
-- =============================================

-- 4.1 Check Missing Values

SELECT *
FROM retail_sales
WHERE transactions_id IS NULL
   OR sale_date IS NULL
   OR sale_time IS NULL
   OR customer_id IS NULL
   OR gender IS NULL
   OR age IS NULL
   OR category IS NULL
   OR quantiy IS NULL
   OR price_per_unit IS NULL
   OR cogs IS NULL
   OR total_sale IS NULL;

-- 4.2 Delete Records with Missing Values

DELETE FROM retail_sales
WHERE sale_date IS NULL
   OR sale_time IS NULL
   OR customer_id IS NULL
   OR gender IS NULL
   OR age IS NULL
   OR category IS NULL
   OR quantiy IS NULL
   OR price_per_unit IS NULL
   OR cogs IS NULL
   OR total_sale IS NULL;

-- 4.3 Check Data After Cleaning

SELECT *
FROM retail_sales;

-- 4.4 Count Records After Cleaning

SELECT COUNT(*) AS total_records_after_cleaning
FROM retail_sales;

-- =============================================
-- 5. DATA EXPLORATION
-- =============================================

-- 5.1 How many sales do we have?

SELECT COUNT(*) AS total_sales
FROM retail_sales;

-- 5.2 How many unique customers do we have?

SELECT COUNT(DISTINCT customer_id) AS total_customers
FROM retail_sales;

-- 5.3 What are the unique categories?

SELECT DISTINCT category AS unique_category
FROM retail_sales;

-- =====================================================
-- 6. DATA ANALYSIS & BUSINESS KEY PROBLEMS & ANSWERS
-- =====================================================

-- My Analysis & Findings

-- Q.1 Retrieve all columns for sales made on '2022-11-05'

-- Q.2 Retrieve all transactions where the category is 'Clothing'
-- and the quantity sold is more than 10 in Nov-2022.

-- Q.3 Calculate the total sales for each category.

-- Q.4 Find the average age of customers who purchased items
-- from the 'Beauty' category.

-- Q.5 Find all transactions where total_sale is greater than 1000.

-- Q.6 Find the total number of transactions made by each gender
-- in each category.

-- Q.7 Calculate the average sale for each month.
-- Find out the best selling month in each year.

-- Q.8 Find the top 5 customers based on the highest total sales.

-- Q.9 Find the number of unique customers who purchased items
-- from each category.

-- Q.10 Create each shift and calculate the number of orders.
-- Morning <= 12, Afternoon between 12 and 17, Evening > 17.


-- =============================================
-- Q.1
-- =============================================

SELECT *
FROM retail_sales
WHERE sale_date = '2022-11-05';
GO

-- =============================================
-- Q.2
-- =============================================

SELECT *
FROM retail_sales
WHERE category = 'Clothing'
  AND quantiy > 1
  AND sale_date >= '2022-11-01'
  AND sale_date < '2022-12-01';
GO

-- =============================================
-- Q.3
-- =============================================

SELECT
    category,
    SUM(TRY_CAST(total_sale AS DECIMAL(10,1))) AS total_sales
FROM retail_sales
GROUP BY category;
GO

-- =============================================
-- Q.4
-- =============================================

SELECT
    AVG(TRY_CAST(age AS DECIMAL(10,2))) AS average_age
FROM retail_sales
WHERE category = 'Beauty';
GO

-- =============================================
-- Q.5
-- =============================================

SELECT *
FROM retail_sales
WHERE TRY_CAST(total_sale AS DECIMAL(10,2)) > 1000;
GO

-- =============================================
-- Q.6
-- =============================================

SELECT
    COUNT(*) AS total_transactions,
    gender,
    category
FROM retail_sales
GROUP BY gender, category;
GO

-- =============================================
-- Q.7
-- =============================================

SELECT
    YEAR(sale_date) AS sale_year,
    MONTH(sale_date) AS sale_month,
    AVG(TRY_CAST(total_sale AS DECIMAL(10,2))) AS avg_sales
FROM retail_sales
GROUP BY
    YEAR(sale_date),
    MONTH(sale_date)
ORDER BY
    sale_year,
    sale_month;
GO

-- =============================================
-- Q.8
-- =============================================

SELECT TOP 5
    customer_id,
    SUM(TRY_CAST(total_sale AS DECIMAL(10,2))) AS total_sales
FROM retail_sales
GROUP BY customer_id
ORDER BY total_sales DESC;
GO

-- =============================================
-- Q.9
-- =============================================

SELECT
    COUNT(DISTINCT customer_id) AS unique_customers,
    category
FROM retail_sales
GROUP BY category;
GO

-- =============================================
-- Q.10
-- =============================================

WITH SalesShifts AS (
    SELECT
        CASE
            WHEN DATEPART(HOUR, sale_time) <= 12 THEN 'Morning'
            WHEN DATEPART(HOUR, sale_time) <= 17 THEN 'Afternoon'
            ELSE 'Evening'
        END AS shift
    FROM retail_sales
)
SELECT
    shift,
    COUNT(*) AS total_orders
FROM SalesShifts
GROUP BY shift;
GO

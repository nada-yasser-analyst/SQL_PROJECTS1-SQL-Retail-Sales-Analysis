# SQL Retail Sales Analysis

## 📌 Project Overview

This project focuses on analyzing retail sales data using **Microsoft SQL Server** to extract meaningful business insights and understand sales performance, customer behavior, and product category trends.

The project demonstrates practical SQL skills, including data querying, aggregation, filtering, grouping, and data analysis.

## 🎯 Project Objectives

- Explore and analyze retail sales transactions.
- Identify sales trends across different months and years.
- Analyze customer purchasing behavior.
- Understand sales performance across product categories.
- Identify top customers based on total sales.
- Analyze sales distribution across different time shifts.

## 🛠️ Tools & Technologies

- **Microsoft SQL Server**
- **SQL Server Management Studio (SSMS)**
- **SQL**

## 📂 Dataset Description

The dataset contains retail transaction records with the following columns:

| Column | Description |
|---|---|
| transactions_id | Unique transaction identifier |
| sale_date | Date of the transaction |
| sale_time | Time of the transaction |
| customer_id | Customer identifier |
| gender | Customer gender |
| age | Customer age |
| category | Product category |
| quantiy | Quantity purchased |
| price_per_unit | Price per unit |
| cogs | Cost of goods sold |
| total_sale | Total transaction amount |

## 🔍 Analysis & Business Questions

The project explores the following business questions:

1. Retrieve all sales made on a specific date.
2. Identify clothing transactions with a quantity greater than 1 during November 2022.
3. Calculate total sales for each product category.
4. Calculate the average customer age for customers purchasing Beauty products.
5. Identify transactions with total sales greater than 1,000.
6. Count the number of transactions by gender and product category.
7. Calculate average monthly sales and identify the best-selling month in each year.
8. Identify the top 5 customers based on total sales.
9. Calculate the number of unique customers in each product category.
10. Categorize sales transactions into Morning, Afternoon, and Evening shifts.

## 🧠 SQL Concepts Applied

- SELECT, WHERE, ORDER BY
- Aggregate Functions: SUM(), AVG(), COUNT()
- GROUP BY and HAVING
- DISTINCT
- CASE WHEN
- Common Table Expressions (CTEs)
- DATEPART(), YEAR(), MONTH()
- TRY_CAST()
- TOP
- Data filtering and aggregation

## 📊 Key Skills Demonstrated

- Writing SQL queries to answer business questions.
- Working with date and time data.
- Using aggregate functions to summarize sales data.
- Analyzing customer and product category performance.
- Applying CTEs to organize complex queries.
- Handling data type conversion using TRY_CAST().

## 📁 Project Structure

```text
SQL-Retail-Sales-Analysis/
│
├── SQL_Retail_Sales_Analysis.sql
├── retail_sales.csv
└── README.md
```

## 🚀 Project Goal

The goal of this project is to strengthen practical SQL skills and develop the ability to transform raw retail transaction data into useful business insights that support data-driven decision-making.

---

**Author:** Nada Yasser  
**Role:** Aspiring Data Analyst

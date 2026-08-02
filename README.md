# ☕ Coffee Shop Sales Performance Analysis | SQL Server & Power BI

## 📌 Project Overview

This project is an end-to-end sales performance analysis of a coffee shop chain using **Microsoft SQL Server** and **Power BI**. The objective was to transform raw transactional sales data into actionable business insights that support data-driven decision-making.

The project follows the complete analytics lifecycle, from data cleaning and exploration in SQL to interactive dashboard development in Power BI, demonstrating both technical SQL skills and business analysis capabilities.

---

# 🎯 Business Problem

The coffee shop chain processes thousands of sales transactions; however, management lacked a centralized view of business performance across stores, products, and time periods.

Without meaningful reporting, the business faced several operational challenges:

- Long customer queues caused by difficulty identifying peak trading hours for staff scheduling.
- Inefficient inventory distribution due to limited visibility into product demand across different store locations.
- No clear understanding of which stores generated the highest revenue or transaction volume.
- Limited insight into product performance, making it difficult to identify best-selling and underperforming items.
- Lack of visibility into monthly sales trends, reducing the ability to monitor business growth and seasonality.

As a result, many operational decisions were based on assumptions rather than data.

---

# 🎯 Project Objective

The goal of this project was to analyze transactional sales data and provide actionable insights that could help management improve operational efficiency and business performance.

The analysis focuses on answering questions such as:

- Which stores generate the highest revenue?
- Which products contribute the most to sales?
- When are the busiest trading hours?
- How do sales change over time?
- Which product categories perform best at different store locations?

---

# 🛠️ Solution

A structured data analysis workflow was followed to convert raw sales transactions into meaningful business insights.

## 1. Data Preparation

The dataset was cleaned and validated using SQL Server by:

- Checking for missing (NULL) values
- Identifying duplicate records
- Validating transaction quantities and prices
- Creating a calculated Revenue column
- Creating additional time-based columns including:
  - Month Name
  - Month Number
  - Day Name
  - Hour of Day
  - Time Period (Morning, Afternoon, Evening)

These transformations prepared the dataset for efficient business analysis.

---

## 2. Exploratory Data Analysis (EDA)

Before answering business questions, the dataset was explored to understand its overall structure and quality.

The exploration included:

- Total number of transactions
- Date range covered
- Revenue statistics
- Quantity statistics
- Store locations
- Product categories
- Product types
- Product distribution

This ensured that the data was reliable before performing deeper analysis.

---

## 3. Business Analysis

SQL was used to answer key business questions related to:

### 📈 Sales Performance

- Total Revenue
- Total Transactions
- Total Products Sold
- Average Transaction Value
- Monthly Sales Trends

### ⏰ Time Analysis

- Peak Trading Hours
- Busiest Days of the Week
- Revenue by Time Period
- Customer Purchasing Patterns

### 🏪 Store Performance

- Highest Performing Store
- Store Revenue Comparison
- Transaction Volume by Store
- Monthly Store Performance

### ☕ Product Analysis

- Best Selling Products
- Lowest Performing Products
- Revenue by Product Category
- Revenue by Product Type

### 📊 Store vs Product Analysis

- Best Selling Categories per Store
- Product Demand by Store
- Product Mix Analysis

Advanced SQL concepts including **Common Table Expressions (CTEs)** and **Window Functions** were used to solve more complex analytical problems such as ranking store performance and identifying top-performing product categories.

---

# 💻 Technologies Used

- Microsoft SQL Server
- SQL Server Management Studio (SSMS)
- Power BI

---

# 🧠 SQL Skills Demonstrated

- SELECT Statements
- WHERE Clause
- ORDER BY
- GROUP BY
- Aggregate Functions
- CASE Statements
- Common Table Expressions (CTEs)
- Window Functions
- ROW_NUMBER()
- PARTITION BY
- COUNT(DISTINCT)
- Data Cleaning
- Exploratory Data Analysis
- Business Analysis

---

# 📈 Power BI Dashboard

The SQL analysis serves as the foundation for an interactive Power BI dashboard that enables stakeholders to monitor business performance in real time.

The dashboard includes:

- Executive Sales Overview
- Sales Trends
- Store Performance
- Product Performance
- Peak Trading Hours
- Interactive Filters and Slicers

> Dashboard screenshots will be added after completing the Power BI development phase.

---

# 💡 Business Impact

The insights generated from this analysis can help management make more informed operational decisions by:

- Optimizing staff scheduling during peak trading hours to reduce customer waiting times.
- Improving inventory allocation based on product demand at each store.
- Identifying high-performing stores and benchmarking best practices.
- Monitoring monthly sales trends to support forecasting and business planning.
- Identifying underperforming products for promotional campaigns or product rationalization.
- Supporting strategic decision-making through data rather than assumptions.

---


# 🚀 Future Improvements

Future enhancements to this project include:

- Sales forecasting using Power BI
- Customer segmentation analysis
- Inventory optimization recommendations
- Profitability analysis by product category
- Interactive KPI monitoring dashboard

---

# 👨‍💻 Author

**Dilan Mtume**

Information Systems Student | Aspiring Data Analyst

Passionate about transforming raw data into actionable business insights through SQL, Power BI, and data visualization.


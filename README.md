# ☕ Coffee Shop Sales Performance Analysis | SQL Server & Power BI

## 📌 Project Overview

This project is an end-to-end business intelligence solution that analyzes transactional sales data from a coffee shop chain using **Microsoft SQL Server** and **Power BI**.

The objective was to transform raw sales data into meaningful business insights that support operational and strategic decision-making. The project demonstrates the complete analytics workflow, including data cleaning, exploratory data analysis, business analysis, and interactive dashboard development.

---

# 🎯 Business Problem

The coffee shop chain processed thousands of sales transactions across multiple store locations but lacked a centralized reporting solution to monitor business performance.

Without clear visibility into sales trends and customer purchasing behaviour, management faced several operational challenges:

- Difficulty identifying peak trading hours, resulting in inefficient staff scheduling and longer customer queues.
- Ineffective inventory allocation due to limited insight into product demand at different store locations.
- Limited visibility into product performance, making it difficult to identify best-selling and underperforming items.
- No centralized reporting to monitor monthly sales performance and support business planning.

As a result, many operational decisions relied on assumptions rather than data.

---

# 🎯 Project Objective

The objective of this project was to analyze transactional sales data and provide actionable insights that help management make informed business decisions.

The analysis focuses on answering key business questions, including:

- Which stores generate the highest revenue?
- Which products contribute most to overall sales?
- When are the busiest trading hours?
- How do sales change over time?
- Which product categories perform best across different store locations?

---

# 🛠️ Project Solution

A structured analytics workflow was followed to convert raw transaction data into business insights.

## 1. Data Preparation (SQL Server)

The dataset was cleaned and prepared by:

- Checking for missing (NULL) values
- Identifying duplicate records
- Validating transaction quantities and unit prices
- Creating a calculated **Revenue** column
- Creating additional date and time attributes including:
  - Month Name
  - Month Number
  - Day Name
  - Hour of Day
  - Time Period (Morning, Afternoon, Evening)

These transformations prepared the data for efficient reporting and analysis.

---

## 2. Exploratory Data Analysis (EDA)

The dataset was explored to better understand its structure before conducting business analysis.

The exploration included:

- Total transactions
- Revenue statistics
- Product categories and product types
- Store locations
- Quantity statistics
- Sales date range

This ensured the data was accurate and suitable for further analysis.

---

## 3. Business Analysis

SQL was used to answer business-critical questions related to:

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

### ☕ Product Performance

- Top-Selling Products
- Lowest-Performing Products
- Revenue by Product Category
- Revenue by Product Type
- Product Performance by Store

Advanced SQL concepts including **Common Table Expressions (CTEs)** and **Window Functions** were used to perform ranking, aggregation, and comparative analysis.

---

# 📊 Power BI Dashboard

The SQL analysis was used to develop an interactive Power BI dashboard consisting of three report pages.

### 📌 Executive Overview

Provides a high-level summary of business performance through:

- Key Performance Indicators (KPIs)
- Monthly Sales Trend
- Revenue by Store
- Revenue by Product Category
- Interactive slicers

---

### ☕ Product Performance

Analyzes product demand and inventory performance through:

- Top 10 Products
- Bottom 10 Products
- Revenue by Product Type
- Revenue by Product Category
- Store vs Product Category Heatmap

---

### ⏰ Time Analysis

Identifies customer purchasing behaviour and peak trading periods through:

- Revenue by Hour
- Transactions by Hour
- Revenue by Day of Week
- Revenue by Time Period
- Hourly Revenue Heatmap

---

## 📸 Dashboard Preview

> Dashboard screenshots will be added after completing the final dashboard design.

---

# 💻 Technologies Used

- Microsoft SQL Server
- SQL Server Management Studio (SSMS)
- Power BI

---

# 🧠 Technical Skills Demonstrated

### SQL

- Data Cleaning
- Exploratory Data Analysis
- Business Analysis
- Aggregate Functions
- CASE Statements
- GROUP BY
- ORDER BY
- Common Table Expressions (CTEs)
- Window Functions
- ROW_NUMBER()
- COUNT(DISTINCT)

### Power BI

- Data Modeling
- DAX Measures
- Interactive Dashboards
- KPI Reporting
- Slicers & Filters
- Matrix Heatmaps
- Data Visualization

---

# 💡 Key Business Insights

The analysis revealed several valuable insights that can support operational decision-making:

- Identified peak trading periods to improve staff scheduling and reduce customer waiting times.
- Highlighted high-performing products and categories to support inventory planning.
- Compared store performance to identify opportunities for operational improvement.
- Revealed monthly sales trends to assist with forecasting and business planning.
- Provided an interactive reporting solution that enables management to monitor business performance in real time.

---

# 📈 Business Impact

The dashboard enables management to make more informed decisions by:

- Optimizing staff allocation during busy trading periods.
- Improving inventory distribution based on product demand.
- Monitoring sales performance across stores.
- Identifying opportunities to promote underperforming products.
- Supporting data-driven business planning through interactive reporting.

---



# 🚀 Future Enhancements

Potential improvements include:

- Sales forecasting
- Customer segmentation
- Inventory optimization
- Profitability analysis by product category
- Time-series trend forecasting
- Executive KPI scorecards

---

# 📊 Power BI Dashboard

The SQL analysis was used to develop an interactive Power BI dashboard consisting of three report pages. Each dashboard was designed to answer a specific business problem and support operational decision-making.

---

# 📌 Executive Overview

The Executive Overview provides management with a high-level summary of overall business performance through key performance indicators and sales trends.

### Dashboard Features

- Total Revenue
- Total Transactions
- Total Products Sold
- Average Transaction Value
- Revenue by Store
- Monthly Revenue Trend
- Revenue by Product Category
- Interactive Slicers

### Business Insights & Value

#### 💰 Total Revenue
**Insight:** Displays the total revenue generated during the reporting period.

**Business Value:** Helps management monitor overall business performance, evaluate whether revenue targets are being achieved, and compare performance across different reporting periods.

---

#### 🧾 Total Transactions
**Insight:** Shows the total number of customer purchases.

**Business Value:** Indicates overall customer traffic and helps determine whether changes in revenue are driven by increased customer visits or higher customer spending.

---

#### 📦 Total Products Sold
**Insight:** Measures the total quantity of products sold.

**Business Value:** Supports inventory planning by helping management estimate product demand and schedule stock replenishment.

---

#### 💵 Average Transaction Value
**Insight:** Shows the average amount spent per customer transaction.

**Business Value:** Helps evaluate customer purchasing behaviour and assess opportunities for upselling, pricing strategies, and promotional campaigns.

---

#### 📈 Monthly Revenue Trend
**Insight:** Tracks revenue performance over time.

**Business Value:** Identifies seasonal patterns, growth trends, and periods of declining sales to support forecasting and business planning.

---

#### 🏪 Revenue by Store
**Insight:** Compares revenue generated by each store location.

**Business Value:** Identifies high-performing and underperforming stores, enabling management to benchmark performance and allocate resources more effectively.

---

#### ☕ Revenue by Product Category
**Insight:** Shows which product categories contribute the most to overall revenue.

**Business Value:** Helps prioritize inventory investment and marketing efforts toward the highest-performing product categories.

---

# ☕ Product Performance

The Product Performance dashboard focuses on product demand and sales performance to support inventory management and merchandising decisions.

### Dashboard Features

- Top 10 Best-Selling Products
- Bottom 10 Products
- Revenue by Product Type
- Revenue by Product Category
- Store vs Product Category Heatmap

### Business Insights & Value

#### 🏆 Top 10 Products
**Insight:** Identifies the products generating the highest sales.

**Business Value:** Ensures popular products remain well stocked while supporting promotional strategies around high-demand items.

---

#### 📉 Bottom 10 Products
**Insight:** Highlights products with consistently low sales.

**Business Value:** Helps management identify products that may require promotional campaigns, menu revisions, or discontinuation to reduce unnecessary inventory costs.

---

#### 🌳 Revenue by Product Type
**Insight:** Compares revenue across different product types.

**Business Value:** Helps management identify the most profitable product lines and make informed decisions regarding product expansion or menu optimization.

---

#### 🍩 Revenue by Product Category
**Insight:** Shows revenue contribution by each product category.

**Business Value:** Supports category management by identifying which categories deserve greater marketing focus and inventory investment.

---

#### 🏪 Store vs Product Category Heatmap
**Insight:** Compares product category performance across different store locations.

**Business Value:** Enables store-specific inventory allocation by ensuring high-demand products are stocked where customers purchase them most frequently, reducing overstocking and stock shortages.

---

# ⏰ Time Analysis

The Time Analysis dashboard examines customer purchasing behaviour throughout the day and week to identify peak trading periods.

### Dashboard Features

- Revenue by Hour
- Transactions by Hour
- Revenue by Day of Week
- Revenue by Time Period
- Revenue Heatmap (Hour × Day)

### Business Insights & Value

#### 🕒 Revenue by Hour
**Insight:** Identifies the hours generating the highest revenue.

**Business Value:** Enables managers to schedule additional staff during peak trading hours, reducing customer waiting times and improving service quality.

---

#### 📈 Transactions by Hour
**Insight:** Shows customer activity throughout the day.

**Business Value:** Helps determine staffing requirements based on customer traffic rather than assumptions.

---

#### 📅 Revenue by Day of Week
**Insight:** Compares sales performance across weekdays.

**Business Value:** Supports workforce planning and helps management schedule promotions during slower trading days.

---

#### 🌄 Revenue by Time Period
**Insight:** Compares sales during Morning, Afternoon, and Evening periods.

**Business Value:** Helps identify the most profitable trading periods and supports operational planning and promotional scheduling.

---

#### 🔥 Revenue Heatmap (Hour × Day)
**Insight:** Highlights the busiest combinations of weekdays and trading hours.

**Business Value:** Enables managers to quickly identify peak demand periods, optimize employee scheduling, and prepare stores for high customer volumes.

---

## 📸 Dashboard Preview

> Dashboard screenshots will be added after completing the final dashboard design.

# 📌 Key Business Recommendations

Based on the analysis, the following recommendations could help improve operational efficiency:

- Increase staffing during peak trading hours to reduce customer waiting times and improve service levels.
- Allocate inventory based on store-specific product demand to minimize stock shortages and excess inventory.
- Prioritize high-performing product categories in marketing campaigns and promotional activities.
- Review low-performing products to determine whether they require promotions, pricing adjustments, or removal from the product portfolio.
- Continuously monitor monthly sales trends to support demand forecasting and strategic planning.
- Use the interactive Power BI dashboard as a centralized reporting solution to support data-driven decision-making across store operations.

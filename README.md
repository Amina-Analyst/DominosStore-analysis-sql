<img width="1393" height="520" alt="Screenshot 2025-11-30 014516" src="https://github.com/user-attachments/assets/ec65df01-c100-4149-aa20-755206034ffa" />
🍕 Domino’s Pizza Store Analysis – SQL Project

🎯 Objectives

• Database Setup: Create and populate Domino’s order, pizza, and customer tables.
• Data Cleaning: Identify and remove null, missing, or inconsistent records.
• Exploratory Data Analysis (EDA): Explore customer behavior, order trends, revenue  
   distribution, and menu insights.
• Business Insights: Answer stakeholder questions using SQL analytics to derive actionable 
   conclusions.

 🗄️ Database Structure Tables

• orders – order-level info (order_id, custId, order_date, order_time)
• order_details – line-level details (order_detail_id, order_id, pizza_id, quantity)
• pizzas – pizza details (pizza_id, pizza_type_id, size, price)
• pizza_types – pizza type info (pizza_type_id, name, category)
• customers – customer details (custId, first_name, last_name)

🧹 Data Cleaning & Exploration

• Verify row counts for accuracy
• Identify missing/null values
• Remove or fix inconsistent records
• Validate foreign key relationships
• Explore basic trends before analysis

🧠 Analysis & SQL Queries

1.Order Volume Analysis

• Total unique orders
• Monthly order trends
• Day-of-week patterns
• Repeat customers
• Avg. orders per customer
• Cumulative order trend over time

2. Revenue Analysis

• Total revenue
• Highest-priced pizza
• Top revenue-generating pizzas
• Revenue contribution by category
• Monthly cumulative revenue

3.Menu Performance

• Most common pizza size
• Top 5 pizza types by quantity sold
• Category-wise quantity & share
• Top 3 pizzas per category (revenue)

4. Customer Insights

• Top 10 customers by total spend
• High-value vs. regular customer segmentation
• Repeat customer rate

5. Operational Insights

• Orders by hour of the day
• Orders by weekday
• Average number of pizzas per order
• Seasonal (monthly/holiday) trends

🔍 Key Findings

• Customer Behavior: Clear identification of high-value and repeat customers.
• Order Trends: Peak ordering hours, weekday patterns, and seasonal trends.
• Menu Insights: Top-selling pizzas, most profitable items, and size preferences.
• Revenue Performance: Strong understanding of category-wise and size-wise revenue.
• Operational Efficiency: Insights to optimize staffing and inventory based on demand.



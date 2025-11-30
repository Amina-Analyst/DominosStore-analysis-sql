<img width="1393" height="520" alt="Screenshot 2025-11-30 014516" src="https://github.com/user-attachments/assets/ec65df01-c100-4149-aa20-755206034ffa" />

## 🍕Domino’s Pizza Store Analysis SQL Project
## Project Overview

This project demonstrates SQL techniques used by analysts to explore, clean, and analyze pizza sales and customer data. It focuses on uncovering insights about order patterns, revenue, customer behavior, and menu performance to support data‑driven decision‑making.

---

## Objectives

* **Set up the Domino’s pizza database:** Create and populate tables including orders, pizzas, and customers.
* **Data Cleaning:** Identify and remove null or inconsistent records.
* **Exploratory Data Analysis (EDA):** Understand customer behavior, order trends, and menu performance.
* **Business Analysis:** Answer stakeholder‑driven questions to derive actionable insights.

---

## Database Structure

### Tables

* **orders:** order_id, custId, order_date, order_time
* **order_details:** order_detail_id, order_id, pizza_id, quantity
* **pizzas:** pizza_id, pizza_type_id, size, price
* **pizza_types:** pizza_type_id, name, category
* **customers:** custId, first_name, last_name

---

## Data Cleaning & Exploration

* Verified total records in each table.
* Checked for null or missing values in critical fields.
* Removed incomplete or inconsistent records.
* Explored distributions, trends, and outliers.

---

## Analysis & Key SQL Queries

### 1. Orders Volume Analysis

* Total unique orders
* Monthly order breakdown
* Day‑of‑week analysis
* Repeat customers
* Average orders per customer
* Cumulative order trends

### 2. Total Revenue from Pizza Sales

Compute total revenue across all pizza transactions.

### 3. Highest‑Priced Pizza

Identify the most expensive pizza on the menu.

### 4. Most Common Pizza Size Ordered

Determine the size customers order most frequently.

### 5. Top 5 Most Ordered Pizza Types

Identify pizza types with the highest overall sales.

### 6. Total Quantity by Pizza Category

Count pizzas sold across categories.

### 7. Orders by Hour of the Day

Find peak ordering hours to improve staffing.

### 8. Category‑Wise Pizza Distribution

Measure category shares and distribution.

### 9. Average Pizzas Ordered per Day

Gauge daily demand stability.

### 10. Top 3 Pizzas by Revenue

Identify pizzas contributing the most revenue.

### 11. Revenue Contribution per Pizza

Calculate category and item contribution percentages.

### 12. Cumulative Revenue Over Time

Track revenue growth month‑by‑month.

### 13. Top 3 Pizzas by Category

Revenue‑ranked pizzas within each category.

### 14. Top 10 Customers by Spending

Identify and profile highest‑spending customers.

### 15. Orders by Weekday

Find the busiest days of the week.

### 16. Average Order Size

Calculate average pizzas per order.

### 17. Seasonal Trends

Determine monthly and holiday‑based sales patterns.

### 18. Revenue by Pizza Size

Revenue distribution across sizes (S, M, L, XL, XXL).

### 19. Customer Segmentation

Classify customers as High Value or Regular based on spending.

### 20. Repeat Customer Rate

Percentage of customers placing more than one order.

---

## Key Findings

### Customer Behavior

* Identified high‑value and repeat customers.
* Customer segmentation reveals strong loyalty segments.

### Order Trends

* Peak ordering hours and high‑traffic days discovered.
* Seasonal patterns highlight specific demand cycles.

### Menu Insights

* Identified top‑selling pizzas and sizes.
* Analyzed revenue contribution by category and item.

### Revenue Analysis

* Monthly and cumulative revenue trends show steady growth.
* Size‑wise and category‑wise contributions highlight profitable segments.

### Operational Insights

* Daily pizza volume and average order size inform staffing decisions.
* Repeat customer insights support loyalty program planning.

---

## Conclusion

This project provides a complete exploration of Domino’s pizza sales data using SQL. The findings help stakeholders understand customer behavior, optimize operations, refine menu offerings, and support strategic growth decisions.

---

## Future Enhancements

* Add visual dashboards (Power BI, Tableau).



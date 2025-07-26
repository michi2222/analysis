# Sales Data Analysis (PostgreSQL + Tableau)

##  About the Project

This project showcases sales data analysis of a fictional e-commerce business using **PostgreSQL** and **Tableau**. The goal was to extract key insights on revenue trends, customer segmentation, product performance, and regional sales patterns.

- Data was imported from `.csv` files
- Cleaned and analyzed in **PostgreSQL** (PgAdmin)
- Visualized in **Tableau Public**

---

## Tools Used

- **Microsoft Excel** (initial data review)
- **PostgreSQL** (SQL data analysis)
- **Tableau Public** (visualizations)

---

## Data Cleaning Steps

- Checked for duplicates in `order_id`, `customer_id`, and `order_item_id`
- Checked for missing/null values across tables
- Ensured data integrity:
  - Proper date formats
  - No zero or negative quantities
  - Valid foreign key relationships

---

## Key Business Questions Answered

1. What is the **total revenue**?
2. What are the **top 5 best-selling products**?
3. What is the **average order value**?
4. What is the **distribution of sales by region**?
5. What is the **product portfolio breakdown**?
6. Who are the **top customers by spending**?
7. What is the **customer segmentation**?
8. Which **month had the highest sales**?
9. What is the **average number of items per order**?

---

## Visualizations (Tableau)

All final dashboards and charts were created in Tableau and saved as images:

[`visualizations/`](./visualizations)

Examples:
- Revenue by Month
- Sales by Region
- Top Customers by Spending
- Product Category Breakdown

---

## SQL Code

SQL scripts are organized in the [`sql/`](./sql) folder:

- `create_tables.sql` – Creating tables for raw data
- `data_check.sql` – Checking for nulls and duplicates
- `analysis_queries.sql` – All analysis queries used to answer business questions

---

## Business Insight Highlights
Total revenue: 2,275,932.66

* Top customer: Stephanie Herman

* Best month: June

* Best-selling product: Laptop Model 616

* Top region: East – 557,315.80 in sales

* Average order value: 3,104.96
* Average items per order: 2.4



## How to Reproduce
* Clone the repo

* Load the .csv files into PostgreSQL (via PgAdmin or COPY)

* Run sql/tables.sql and sql/analysis_queries.sql

* View visualizations in the visualizations folder or recreate in Tableau

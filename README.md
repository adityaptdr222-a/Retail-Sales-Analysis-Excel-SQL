# Retail Sales Analysis (Excel + SQL)

## Objective
Analyze retail sales transaction data to understand product-wise and region-wise performance, identify top and weak performers, and provide data-driven business recommendations using Excel and SQL.

## Dataset
- 300 retail transaction records
- Columns: Order ID, Order Date, Region, Store, Product, Category, Quantity, Unit Price, Revenue, Cost, Profit
- 6 products across 2 categories (Electronics, Accessories), 4 regions (North, South, East, West), 4 stores

## Tools Used
- **Excel:** Data cleaning, Pivot Tables, conditional formatting, trend charts
- **SQL:** GROUP BY, HAVING, subqueries, window functions (RANK, ROW_NUMBER, running totals), JOIN with a region-targets reference table

## Analysis Performed
- Product-wise revenue and profit margin analysis
- Region-wise revenue and profit comparison
- Store-wise performance comparison
- Category-wise revenue contribution
- Region performance vs. target revenue (via SQL JOIN)
- Top 2 products per region (via window function)
- Month-wise running revenue trend

## Key Insights
- **iPhone is the highest revenue-generating product** (₹1.94 Cr), more than 3x the next product (Laptop, ₹1.38 Cr)
- **Electronics dominates revenue** — 93.3% of total revenue comes from Electronics vs. 6.7% from Accessories
- **West and South are the top-performing regions** by revenue (₹1.05 Cr and ₹1.04 Cr respectively)
- **North is the weakest-performing region** by both revenue (₹74.2 lakh) and profit
- **Power Bank is the weakest-performing product** by revenue (₹5.18 lakh) — lower than Headphones
- **Store_C generates the highest revenue** (₹1.11 Cr) among the 4 stores; Store_D is the lowest (₹75.1 lakh)
- iPhone and Laptop together carry the best profit margins; Power Bank and Bluetooth Speaker have the thinnest margins

## Business Recommendations
- Prioritize inventory and marketing spend on iPhone and Laptop — they drive the majority of revenue and profit
- Investigate why North region underperforms — could be store count, local demand, or pricing — and pilot a targeted promotion there
- Power Bank's low revenue and margin suggest re-evaluating pricing or considering phasing it out in favor of higher-margin accessories
- Replicate Store_C's high performance — review staffing, footfall, or local marketing practices that could be applied to Store_D

## How to Run
1. Import `Project1_Retail_Sales_Industry_Data.xlsx` into a SQL database (or use Excel Power Query)
2. Run `retail_sales_analysis.sql` to recreate the `sales` table and execute all analysis queries
3. Pivot Table and charts available in the Excel workbook on the `Retail_Sales_Data` sheet

## Author
Aditya Patidar
Aspiring Data Analyst

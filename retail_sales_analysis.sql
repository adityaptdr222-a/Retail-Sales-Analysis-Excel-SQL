-- Create table
CREATE TABLE sales (
  product VARCHAR(50),
  region VARCHAR(50),
  revenue INT,
  profit INT
);

-- Sample data
INSERT INTO sales VALUES
('iPhone', 'North', 800000, 200000),
('iPhone', 'South', 750000, 180000),
('Laptop', 'East', 500000, 120000),
('Headphones', 'West', 200000, 40000);

-- Product-wise revenue
SELECT product, SUM(revenue) AS total_revenue
FROM sales
GROUP BY product
ORDER BY total_revenue DESC;

-- Region-wise profit
SELECT region, SUM(profit) AS total_profit
FROM sales
GROUP BY region
ORDER BY total_profit ASC;

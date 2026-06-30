-- ============================================
-- Retail Sales Analysis - SQL Script
-- Dataset: Project1_Retail_Sales_Industry_Data.xlsx
-- 300 transaction records | 6 products | 4 regions | 2 categories
-- ============================================

-- 1. CREATE TABLE: main transactional fact table
CREATE TABLE sales (
    order_id     INT PRIMARY KEY,
    order_date   DATE,
    region       VARCHAR(50),
    store        VARCHAR(50),
    product      VARCHAR(50),
    category     VARCHAR(50),
    quantity     INT,
    unit_price   INT,
    revenue      INT,
    cost         INT,
    profit       INT
);

-- 2. INSERT real transaction data (300 rows, imported from Excel)
INSERT INTO sales (order_id, order_date, region, store, product, category, quantity, unit_price, revenue, cost, profit) VALUES
(1, '2024-02-07', 'West', 'Store_D', 'Bluetooth Speaker', 'Accessories', 10, 4500, 45000, 30000, 15000),
(2, '2024-04-15', 'North', 'Store_A', 'Smart Watch', 'Electronics', 1, 12000, 12000, 8500, 3500),
(3, '2024-04-17', 'South', 'Store_D', 'Bluetooth Speaker', 'Accessories', 5, 4500, 22500, 15000, 7500),
(4, '2024-04-11', 'North', 'Store_A', 'Bluetooth Speaker', 'Accessories', 8, 4500, 36000, 24000, 12000),
(5, '2024-04-10', 'East', 'Store_C', 'Headphones', 'Accessories', 6, 3000, 18000, 10800, 7200),
(6, '2024-02-09', 'West', 'Store_A', 'Smart Watch', 'Electronics', 3, 12000, 36000, 25500, 10500),
(7, '2024-06-27', 'West', 'Store_B', 'Smart Watch', 'Electronics', 7, 12000, 84000, 59500, 24500),
(8, '2024-06-21', 'East', 'Store_D', 'Headphones', 'Accessories', 2, 3000, 6000, 3600, 2400),
(9, '2024-01-14', 'South', 'Store_A', 'Smart Watch', 'Electronics', 9, 12000, 108000, 76500, 31500),
(10, '2024-05-08', 'East', 'Store_B', 'iPhone', 'Electronics', 7, 60000, 420000, 364000, 56000),
(11, '2024-04-06', 'North', 'Store_C', 'Laptop', 'Electronics', 9, 55000, 495000, 423000, 72000),
(12, '2024-02-25', 'South', 'Store_B', 'iPhone', 'Electronics', 2, 60000, 120000, 104000, 16000),
(13, '2024-02-05', 'West', 'Store_B', 'Bluetooth Speaker', 'Accessories', 5, 4500, 22500, 15000, 7500),
(14, '2024-02-18', 'East', 'Store_B', 'Power Bank', 'Accessories', 6, 2000, 12000, 7200, 4800),
(15, '2024-04-09', 'South', 'Store_A', 'Headphones', 'Accessories', 10, 3000, 30000, 18000, 12000),
(16, '2024-03-01', 'East', 'Store_C', 'Power Bank', 'Accessories', 8, 2000, 16000, 9600, 6400),
(17, '2024-01-14', 'West', 'Store_C', 'Smart Watch', 'Electronics', 5, 12000, 60000, 42500, 17500),
(18, '2024-06-01', 'North', 'Store_A', 'iPhone', 'Electronics', 9, 60000, 540000, 468000, 72000),
(19, '2024-02-13', 'East', 'Store_B', 'Laptop', 'Electronics', 8, 55000, 440000, 376000, 64000),
(20, '2024-03-08', 'East', 'Store_A', 'Headphones', 'Accessories', 5, 3000, 15000, 9000, 6000),
(21, '2024-03-15', 'West', 'Store_A', 'Bluetooth Speaker', 'Accessories', 2, 4500, 9000, 6000, 3000),
(22, '2024-06-11', 'East', 'Store_B', 'iPhone', 'Electronics', 3, 60000, 180000, 156000, 24000),
(23, '2024-04-04', 'East', 'Store_B', 'Laptop', 'Electronics', 9, 55000, 495000, 423000, 72000),
(24, '2024-01-10', 'East', 'Store_C', 'Power Bank', 'Accessories', 3, 2000, 6000, 3600, 2400),
(25, '2024-03-12', 'South', 'Store_A', 'iPhone', 'Electronics', 10, 60000, 600000, 520000, 80000),
(26, '2024-05-05', 'South', 'Store_A', 'Headphones', 'Accessories', 9, 3000, 27000, 16200, 10800),
(27, '2024-06-07', 'East', 'Store_B', 'Laptop', 'Electronics', 5, 55000, 275000, 235000, 40000),
(28, '2024-02-24', 'South', 'Store_A', 'Smart Watch', 'Electronics', 2, 12000, 24000, 17000, 7000),
(29, '2024-01-23', 'East', 'Store_B', 'Power Bank', 'Accessories', 9, 2000, 18000, 10800, 7200),
(30, '2024-02-02', 'West', 'Store_B', 'Headphones', 'Accessories', 9, 3000, 27000, 16200, 10800),
(31, '2024-06-16', 'East', 'Store_D', 'Bluetooth Speaker', 'Accessories', 10, 4500, 45000, 30000, 15000),
(32, '2024-02-29', 'South', 'Store_C', 'Headphones', 'Accessories', 6, 3000, 18000, 10800, 7200),
(33, '2024-03-13', 'North', 'Store_D', 'Power Bank', 'Accessories', 2, 2000, 4000, 2400, 1600),
(34, '2024-05-24', 'West', 'Store_C', 'Smart Watch', 'Electronics', 2, 12000, 24000, 17000, 7000),
(35, '2024-05-01', 'West', 'Store_D', 'Headphones', 'Accessories', 7, 3000, 21000, 12600, 8400),
(36, '2024-02-13', 'North', 'Store_D', 'Laptop', 'Electronics', 8, 55000, 440000, 376000, 64000),
(37, '2024-02-01', 'East', 'Store_C', 'Laptop', 'Electronics', 3, 55000, 165000, 141000, 24000),
(38, '2024-04-30', 'East', 'Store_A', 'Headphones', 'Accessories', 7, 3000, 21000, 12600, 8400),
(39, '2024-06-22', 'North', 'Store_B', 'iPhone', 'Electronics', 9, 60000, 540000, 468000, 72000),
(40, '2024-03-13', 'East', 'Store_D', 'Smart Watch', 'Electronics', 2, 12000, 24000, 17000, 7000),
(41, '2024-05-07', 'North', 'Store_B', 'Power Bank', 'Accessories', 2, 2000, 4000, 2400, 1600),
(42, '2024-06-06', 'West', 'Store_C', 'iPhone', 'Electronics', 10, 60000, 600000, 520000, 80000),
(43, '2024-05-18', 'North', 'Store_D', 'Headphones', 'Accessories', 6, 3000, 18000, 10800, 7200),
(44, '2024-03-04', 'South', 'Store_A', 'Bluetooth Speaker', 'Accessories', 4, 4500, 18000, 12000, 6000),
(45, '2024-03-28', 'West', 'Store_B', 'iPhone', 'Electronics', 6, 60000, 360000, 312000, 48000),
(46, '2024-02-28', 'South', 'Store_A', 'iPhone', 'Electronics', 9, 60000, 540000, 468000, 72000),
(47, '2024-01-12', 'East', 'Store_A', 'Headphones', 'Accessories', 8, 3000, 24000, 14400, 9600),
(48, '2024-06-28', 'East', 'Store_C', 'Headphones', 'Accessories', 1, 3000, 3000, 1800, 1200),
(49, '2024-04-10', 'East', 'Store_C', 'Laptop', 'Electronics', 3, 55000, 165000, 141000, 24000),
(50, '2024-02-28', 'East', 'Store_B', 'Power Bank', 'Accessories', 4, 2000, 8000, 4800, 3200),
(51, '2024-04-20', 'North', 'Store_B', 'Power Bank', 'Accessories', 9, 2000, 18000, 10800, 7200),
(52, '2024-05-05', 'West', 'Store_A', 'iPhone', 'Electronics', 2, 60000, 120000, 104000, 16000),
(53, '2024-06-06', 'West', 'Store_B', 'Power Bank', 'Accessories', 2, 2000, 4000, 2400, 1600),
(54, '2024-05-08', 'North', 'Store_C', 'Headphones', 'Accessories', 2, 3000, 6000, 3600, 2400),
(55, '2024-05-23', 'East', 'Store_C', 'iPhone', 'Electronics', 4, 60000, 240000, 208000, 32000),
(56, '2024-04-07', 'East', 'Store_C', 'Headphones', 'Accessories', 2, 3000, 6000, 3600, 2400),
(57, '2024-01-22', 'North', 'Store_C', 'Headphones', 'Accessories', 8, 3000, 24000, 14400, 9600),
(58, '2024-02-16', 'East', 'Store_B', 'Bluetooth Speaker', 'Accessories', 6, 4500, 27000, 18000, 9000),
(59, '2024-04-24', 'North', 'Store_D', 'iPhone', 'Electronics', 3, 60000, 180000, 156000, 24000),
(60, '2024-06-19', 'East', 'Store_C', 'Power Bank', 'Accessories', 10, 2000, 20000, 12000, 8000),
(61, '2024-01-23', 'North', 'Store_D', 'Laptop', 'Electronics', 1, 55000, 55000, 47000, 8000),
(62, '2024-06-21', 'North', 'Store_C', 'Headphones', 'Accessories', 1, 3000, 3000, 1800, 1200),
(63, '2024-06-12', 'North', 'Store_C', 'Power Bank', 'Accessories', 4, 2000, 8000, 4800, 3200),
(64, '2024-04-15', 'South', 'Store_B', 'Smart Watch', 'Electronics', 8, 12000, 96000, 68000, 28000),
(65, '2024-06-18', 'East', 'Store_D', 'Laptop', 'Electronics', 1, 55000, 55000, 47000, 8000),
(66, '2024-04-30', 'North', 'Store_A', 'Laptop', 'Electronics', 9, 55000, 495000, 423000, 72000),
(67, '2024-04-13', 'South', 'Store_D', 'Bluetooth Speaker', 'Accessories', 10, 4500, 45000, 30000, 15000),
(68, '2024-06-22', 'North', 'Store_A', 'iPhone', 'Electronics', 4, 60000, 240000, 208000, 32000),
(69, '2024-02-18', 'South', 'Store_C', 'Bluetooth Speaker', 'Accessories', 9, 4500, 40500, 27000, 13500),
(70, '2024-02-21', 'North', 'Store_B', 'Headphones', 'Accessories', 9, 3000, 27000, 16200, 10800),
(71, '2024-04-14', 'North', 'Store_C', 'Headphones', 'Accessories', 7, 3000, 21000, 12600, 8400),
(72, '2024-06-20', 'West', 'Store_C', 'iPhone', 'Electronics', 9, 60000, 540000, 468000, 72000),
(73, '2024-04-20', 'West', 'Store_B', 'Headphones', 'Accessories', 2, 3000, 6000, 3600, 2400),
(74, '2024-04-10', 'South', 'Store_A', 'Power Bank', 'Accessories', 4, 2000, 8000, 4800, 3200),
(75, '2024-04-19', 'East', 'Store_D', 'Smart Watch', 'Electronics', 3, 12000, 36000, 25500, 10500),
(76, '2024-05-27', 'East', 'Store_D', 'iPhone', 'Electronics', 2, 60000, 120000, 104000, 16000),
(77, '2024-05-21', 'West', 'Store_C', 'Laptop', 'Electronics', 1, 55000, 55000, 47000, 8000),
(78, '2024-02-24', 'West', 'Store_B', 'Smart Watch', 'Electronics', 8, 12000, 96000, 68000, 28000),
(79, '2024-05-19', 'North', 'Store_B', 'Bluetooth Speaker', 'Accessories', 9, 4500, 40500, 27000, 13500),
(80, '2024-02-05', 'West', 'Store_C', 'Smart Watch', 'Electronics', 5, 12000, 60000, 42500, 17500),
(81, '2024-04-05', 'West', 'Store_A', 'iPhone', 'Electronics', 5, 60000, 300000, 260000, 40000),
(82, '2024-06-09', 'East', 'Store_A', 'Smart Watch', 'Electronics', 1, 12000, 12000, 8500, 3500),
(83, '2024-06-06', 'North', 'Store_D', 'iPhone', 'Electronics', 1, 60000, 60000, 52000, 8000),
(84, '2024-02-07', 'West', 'Store_B', 'iPhone', 'Electronics', 6, 60000, 360000, 312000, 48000),
(85, '2024-06-29', 'North', 'Store_D', 'Bluetooth Speaker', 'Accessories', 9, 4500, 40500, 27000, 13500),
(86, '2024-01-14', 'West', 'Store_D', 'Laptop', 'Electronics', 7, 55000, 385000, 329000, 56000),
(87, '2024-03-19', 'East', 'Store_D', 'iPhone', 'Electronics', 6, 60000, 360000, 312000, 48000),
(88, '2024-05-22', 'West', 'Store_C', 'Bluetooth Speaker', 'Accessories', 3, 4500, 13500, 9000, 4500),
(89, '2024-06-14', 'North', 'Store_D', 'Power Bank', 'Accessories', 9, 2000, 18000, 10800, 7200),
(90, '2024-05-17', 'North', 'Store_C', 'Headphones', 'Accessories', 8, 3000, 24000, 14400, 9600),
(91, '2024-01-28', 'North', 'Store_B', 'Power Bank', 'Accessories', 3, 2000, 6000, 3600, 2400),
(92, '2024-01-20', 'South', 'Store_C', 'Smart Watch', 'Electronics', 9, 12000, 108000, 76500, 31500),
(93, '2024-06-12', 'West', 'Store_B', 'iPhone', 'Electronics', 2, 60000, 120000, 104000, 16000),
(94, '2024-05-06', 'West', 'Store_C', 'iPhone', 'Electronics', 4, 60000, 240000, 208000, 32000),
(95, '2024-02-18', 'South', 'Store_C', 'Headphones', 'Accessories', 7, 3000, 21000, 12600, 8400),
(96, '2024-04-10', 'South', 'Store_A', 'Laptop', 'Electronics', 5, 55000, 275000, 235000, 40000),
(97, '2024-01-08', 'West', 'Store_B', 'Laptop', 'Electronics', 9, 55000, 495000, 423000, 72000),
(98, '2024-04-01', 'South', 'Store_A', 'Laptop', 'Electronics', 1, 55000, 55000, 47000, 8000),
(99, '2024-05-10', 'East', 'Store_D', 'Headphones', 'Accessories', 6, 3000, 18000, 10800, 7200),
(100, '2024-04-17', 'North', 'Store_B', 'Bluetooth Speaker', 'Accessories', 4, 4500, 18000, 12000, 6000),
(101, '2024-03-28', 'East', 'Store_C', 'iPhone', 'Electronics', 7, 60000, 420000, 364000, 56000),
(102, '2024-04-14', 'South', 'Store_A', 'Bluetooth Speaker', 'Accessories', 5, 4500, 22500, 15000, 7500),
(103, '2024-03-12', 'East', 'Store_C', 'Laptop', 'Electronics', 10, 55000, 550000, 470000, 80000),
(104, '2024-01-15', 'West', 'Store_D', 'iPhone', 'Electronics', 6, 60000, 360000, 312000, 48000),
(105, '2024-06-16', 'West', 'Store_C', 'iPhone', 'Electronics', 10, 60000, 600000, 520000, 80000),
(106, '2024-03-20', 'West', 'Store_B', 'Smart Watch', 'Electronics', 2, 12000, 24000, 17000, 7000),
(107, '2024-02-14', 'East', 'Store_B', 'Laptop', 'Electronics', 8, 55000, 440000, 376000, 64000),
(108, '2024-02-14', 'North', 'Store_D', 'Power Bank', 'Accessories', 6, 2000, 12000, 7200, 4800),
(109, '2024-05-29', 'South', 'Store_A', 'Smart Watch', 'Electronics', 1, 12000, 12000, 8500, 3500),
(110, '2024-05-24', 'South', 'Store_D', 'Headphones', 'Accessories', 9, 3000, 27000, 16200, 10800),
(111, '2024-02-17', 'South', 'Store_C', 'Headphones', 'Accessories', 10, 3000, 30000, 18000, 12000),
(112, '2024-03-16', 'West', 'Store_C', 'Headphones', 'Accessories', 10, 3000, 30000, 18000, 12000),
(113, '2024-01-31', 'North', 'Store_B', 'iPhone', 'Electronics', 7, 60000, 420000, 364000, 56000),
(114, '2024-05-08', 'North', 'Store_C', 'Laptop', 'Electronics', 2, 55000, 110000, 94000, 16000),
(115, '2024-04-30', 'East', 'Store_C', 'Headphones', 'Accessories', 4, 3000, 12000, 7200, 4800),
(116, '2024-03-15', 'South', 'Store_A', 'Power Bank', 'Accessories', 4, 2000, 8000, 4800, 3200),
(117, '2024-02-15', 'South', 'Store_C', 'Headphones', 'Accessories', 2, 3000, 6000, 3600, 2400),
(118, '2024-05-06', 'North', 'Store_B', 'Power Bank', 'Accessories', 8, 2000, 16000, 9600, 6400),
(119, '2024-06-11', 'West', 'Store_A', 'Laptop', 'Electronics', 9, 55000, 495000, 423000, 72000),
(120, '2024-02-24', 'West', 'Store_D', 'Smart Watch', 'Electronics', 3, 12000, 36000, 25500, 10500),
(121, '2024-02-28', 'West', 'Store_C', 'Power Bank', 'Accessories', 10, 2000, 20000, 12000, 8000),
(122, '2024-02-24', 'West', 'Store_C', 'Smart Watch', 'Electronics', 1, 12000, 12000, 8500, 3500),
(123, '2024-01-22', 'South', 'Store_C', 'iPhone', 'Electronics', 2, 60000, 120000, 104000, 16000),
(124, '2024-02-15', 'East', 'Store_C', 'iPhone', 'Electronics', 4, 60000, 240000, 208000, 32000),
(125, '2024-01-05', 'East', 'Store_D', 'iPhone', 'Electronics', 5, 60000, 300000, 260000, 40000),
(126, '2024-01-10', 'South', 'Store_D', 'Smart Watch', 'Electronics', 10, 12000, 120000, 85000, 35000),
(127, '2024-01-03', 'East', 'Store_B', 'Smart Watch', 'Electronics', 1, 12000, 12000, 8500, 3500),
(128, '2024-04-21', 'West', 'Store_D', 'Power Bank', 'Accessories', 1, 2000, 2000, 1200, 800),
(129, '2024-06-14', 'West', 'Store_C', 'Laptop', 'Electronics', 9, 55000, 495000, 423000, 72000),
(130, '2024-03-12', 'West', 'Store_A', 'iPhone', 'Electronics', 3, 60000, 180000, 156000, 24000),
(131, '2024-03-12', 'West', 'Store_A', 'Headphones', 'Accessories', 5, 3000, 15000, 9000, 6000),
(132, '2024-05-31', 'West', 'Store_C', 'Power Bank', 'Accessories', 2, 2000, 4000, 2400, 1600),
(133, '2024-04-16', 'North', 'Store_A', 'iPhone', 'Electronics', 5, 60000, 300000, 260000, 40000),
(134, '2024-06-17', 'East', 'Store_B', 'Laptop', 'Electronics', 7, 55000, 385000, 329000, 56000),
(135, '2024-04-25', 'South', 'Store_B', 'Headphones', 'Accessories', 9, 3000, 27000, 16200, 10800),
(136, '2024-01-15', 'North', 'Store_A', 'iPhone', 'Electronics', 6, 60000, 360000, 312000, 48000),
(137, '2024-05-05', 'West', 'Store_A', 'Laptop', 'Electronics', 8, 55000, 440000, 376000, 64000),
(138, '2024-06-15', 'South', 'Store_A', 'Headphones', 'Accessories', 1, 3000, 3000, 1800, 1200),
(139, '2024-02-21', 'West', 'Store_A', 'iPhone', 'Electronics', 1, 60000, 60000, 52000, 8000),
(140, '2024-03-01', 'South', 'Store_C', 'Bluetooth Speaker', 'Accessories', 5, 4500, 22500, 15000, 7500),
(141, '2024-02-20', 'North', 'Store_D', 'Bluetooth Speaker', 'Accessories', 6, 4500, 27000, 18000, 9000),
(142, '2024-01-10', 'South', 'Store_D', 'Headphones', 'Accessories', 4, 3000, 12000, 7200, 4800),
(143, '2024-06-15', 'South', 'Store_C', 'Laptop', 'Electronics', 9, 55000, 495000, 423000, 72000),
(144, '2024-04-17', 'South', 'Store_A', 'Power Bank', 'Accessories', 7, 2000, 14000, 8400, 5600),
(145, '2024-06-10', 'West', 'Store_D', 'iPhone', 'Electronics', 9, 60000, 540000, 468000, 72000),
(146, '2024-01-08', 'West', 'Store_C', 'Smart Watch', 'Electronics', 3, 12000, 36000, 25500, 10500),
(147, '2024-05-06', 'North', 'Store_C', 'Headphones', 'Accessories', 4, 3000, 12000, 7200, 4800),
(148, '2024-02-26', 'South', 'Store_C', 'Headphones', 'Accessories', 8, 3000, 24000, 14400, 9600),
(149, '2024-04-14', 'West', 'Store_A', 'iPhone', 'Electronics', 2, 60000, 120000, 104000, 16000),
(150, '2024-02-06', 'East', 'Store_D', 'Power Bank', 'Accessories', 3, 2000, 6000, 3600, 2400),
(151, '2024-06-10', 'South', 'Store_B', 'Headphones', 'Accessories', 5, 3000, 15000, 9000, 6000),
(152, '2024-01-11', 'West', 'Store_C', 'Smart Watch', 'Electronics', 5, 12000, 60000, 42500, 17500),
(153, '2024-03-12', 'North', 'Store_B', 'Headphones', 'Accessories', 9, 3000, 27000, 16200, 10800),
(154, '2024-03-04', 'South', 'Store_B', 'iPhone', 'Electronics', 2, 60000, 120000, 104000, 16000),
(155, '2024-06-20', 'South', 'Store_C', 'Power Bank', 'Accessories', 6, 2000, 12000, 7200, 4800),
(156, '2024-06-25', 'South', 'Store_A', 'Headphones', 'Accessories', 6, 3000, 18000, 10800, 7200),
(157, '2024-01-12', 'South', 'Store_A', 'Power Bank', 'Accessories', 6, 2000, 12000, 7200, 4800),
(158, '2024-02-28', 'West', 'Store_A', 'Headphones', 'Accessories', 6, 3000, 18000, 10800, 7200),
(159, '2024-01-24', 'East', 'Store_B', 'iPhone', 'Electronics', 4, 60000, 240000, 208000, 32000),
(160, '2024-05-21', 'North', 'Store_A', 'Power Bank', 'Accessories', 4, 2000, 8000, 4800, 3200),
(161, '2024-04-09', 'South', 'Store_A', 'Laptop', 'Electronics', 7, 55000, 385000, 329000, 56000),
(162, '2024-05-19', 'South', 'Store_C', 'iPhone', 'Electronics', 6, 60000, 360000, 312000, 48000),
(163, '2024-01-21', 'North', 'Store_D', 'Power Bank', 'Accessories', 7, 2000, 14000, 8400, 5600),
(164, '2024-01-03', 'North', 'Store_C', 'Smart Watch', 'Electronics', 8, 12000, 96000, 68000, 28000),
(165, '2024-03-01', 'North', 'Store_C', 'Bluetooth Speaker', 'Accessories', 9, 4500, 40500, 27000, 13500),
(166, '2024-03-07', 'South', 'Store_C', 'Bluetooth Speaker', 'Accessories', 6, 4500, 27000, 18000, 9000),
(167, '2024-03-15', 'South', 'Store_C', 'iPhone', 'Electronics', 9, 60000, 540000, 468000, 72000),
(168, '2024-04-04', 'South', 'Store_B', 'Headphones', 'Accessories', 7, 3000, 21000, 12600, 8400),
(169, '2024-03-02', 'West', 'Store_A', 'iPhone', 'Electronics', 9, 60000, 540000, 468000, 72000),
(170, '2024-06-20', 'South', 'Store_C', 'Laptop', 'Electronics', 9, 55000, 495000, 423000, 72000),
(171, '2024-01-28', 'East', 'Store_C', 'Smart Watch', 'Electronics', 4, 12000, 48000, 34000, 14000),
(172, '2024-01-22', 'North', 'Store_D', 'Headphones', 'Accessories', 2, 3000, 6000, 3600, 2400),
(173, '2024-06-15', 'South', 'Store_A', 'Laptop', 'Electronics', 6, 55000, 330000, 282000, 48000),
(174, '2024-03-10', 'South', 'Store_D', 'Smart Watch', 'Electronics', 5, 12000, 60000, 42500, 17500),
(175, '2024-06-10', 'South', 'Store_A', 'iPhone', 'Electronics', 7, 60000, 420000, 364000, 56000),
(176, '2024-03-19', 'West', 'Store_D', 'Smart Watch', 'Electronics', 4, 12000, 48000, 34000, 14000),
(177, '2024-05-14', 'West', 'Store_B', 'Power Bank', 'Accessories', 3, 2000, 6000, 3600, 2400),
(178, '2024-05-17', 'West', 'Store_C', 'Power Bank', 'Accessories', 1, 2000, 2000, 1200, 800),
(179, '2024-05-08', 'East', 'Store_B', 'Power Bank', 'Accessories', 8, 2000, 16000, 9600, 6400),
(180, '2024-06-22', 'East', 'Store_D', 'iPhone', 'Electronics', 8, 60000, 480000, 416000, 64000),
(181, '2024-04-06', 'South', 'Store_A', 'Headphones', 'Accessories', 3, 3000, 9000, 5400, 3600),
(182, '2024-04-09', 'North', 'Store_C', 'Headphones', 'Accessories', 2, 3000, 6000, 3600, 2400),
(183, '2024-06-21', 'West', 'Store_D', 'Headphones', 'Accessories', 3, 3000, 9000, 5400, 3600),
(184, '2024-03-02', 'South', 'Store_D', 'iPhone', 'Electronics', 2, 60000, 120000, 104000, 16000),
(185, '2024-05-13', 'South', 'Store_A', 'Power Bank', 'Accessories', 10, 2000, 20000, 12000, 8000),
(186, '2024-06-08', 'East', 'Store_D', 'iPhone', 'Electronics', 4, 60000, 240000, 208000, 32000),
(187, '2024-01-10', 'East', 'Store_D', 'Smart Watch', 'Electronics', 7, 12000, 84000, 59500, 24500),
(188, '2024-02-09', 'South', 'Store_A', 'Smart Watch', 'Electronics', 4, 12000, 48000, 34000, 14000),
(189, '2024-02-24', 'South', 'Store_A', 'Power Bank', 'Accessories', 7, 2000, 14000, 8400, 5600),
(190, '2024-06-01', 'South', 'Store_D', 'Bluetooth Speaker', 'Accessories', 10, 4500, 45000, 30000, 15000),
(191, '2024-01-25', 'East', 'Store_C', 'Smart Watch', 'Electronics', 1, 12000, 12000, 8500, 3500),
(192, '2024-03-19', 'West', 'Store_A', 'Power Bank', 'Accessories', 6, 2000, 12000, 7200, 4800),
(193, '2024-04-30', 'South', 'Store_A', 'Power Bank', 'Accessories', 7, 2000, 14000, 8400, 5600),
(194, '2024-01-02', 'West', 'Store_C', 'Smart Watch', 'Electronics', 3, 12000, 36000, 25500, 10500),
(195, '2024-03-18', 'East', 'Store_A', 'Laptop', 'Electronics', 3, 55000, 165000, 141000, 24000),
(196, '2024-03-31', 'North', 'Store_A', 'Laptop', 'Electronics', 4, 55000, 220000, 188000, 32000),
(197, '2024-03-29', 'East', 'Store_B', 'Smart Watch', 'Electronics', 2, 12000, 24000, 17000, 7000),
(198, '2024-06-01', 'South', 'Store_A', 'Laptop', 'Electronics', 6, 55000, 330000, 282000, 48000),
(199, '2024-05-14', 'West', 'Store_A', 'Laptop', 'Electronics', 5, 55000, 275000, 235000, 40000),
(200, '2024-02-09', 'West', 'Store_B', 'iPhone', 'Electronics', 2, 60000, 120000, 104000, 16000),
(201, '2024-02-28', 'South', 'Store_B', 'iPhone', 'Electronics', 9, 60000, 540000, 468000, 72000),
(202, '2024-01-26', 'South', 'Store_B', 'Smart Watch', 'Electronics', 4, 12000, 48000, 34000, 14000),
(203, '2024-05-04', 'South', 'Store_C', 'Bluetooth Speaker', 'Accessories', 7, 4500, 31500, 21000, 10500),
(204, '2024-03-20', 'West', 'Store_C', 'iPhone', 'Electronics', 1, 60000, 60000, 52000, 8000),
(205, '2024-06-19', 'East', 'Store_C', 'Headphones', 'Accessories', 1, 3000, 3000, 1800, 1200),
(206, '2024-04-26', 'South', 'Store_D', 'Bluetooth Speaker', 'Accessories', 2, 4500, 9000, 6000, 3000),
(207, '2024-01-13', 'East', 'Store_C', 'Smart Watch', 'Electronics', 4, 12000, 48000, 34000, 14000),
(208, '2024-04-23', 'East', 'Store_A', 'Bluetooth Speaker', 'Accessories', 7, 4500, 31500, 21000, 10500),
(209, '2024-04-12', 'West', 'Store_C', 'Headphones', 'Accessories', 5, 3000, 15000, 9000, 6000),
(210, '2024-06-19', 'North', 'Store_D', 'Smart Watch', 'Electronics', 6, 12000, 72000, 51000, 21000),
(211, '2024-02-08', 'East', 'Store_B', 'Bluetooth Speaker', 'Accessories', 4, 4500, 18000, 12000, 6000),
(212, '2024-06-26', 'East', 'Store_B', 'Laptop', 'Electronics', 3, 55000, 165000, 141000, 24000),
(213, '2024-05-04', 'West', 'Store_A', 'Bluetooth Speaker', 'Accessories', 2, 4500, 9000, 6000, 3000),
(214, '2024-06-13', 'West', 'Store_C', 'Bluetooth Speaker', 'Accessories', 7, 4500, 31500, 21000, 10500),
(215, '2024-06-13', 'North', 'Store_D', 'Bluetooth Speaker', 'Accessories', 9, 4500, 40500, 27000, 13500),
(216, '2024-06-12', 'West', 'Store_C', 'Headphones', 'Accessories', 9, 3000, 27000, 16200, 10800),
(217, '2024-02-10', 'North', 'Store_B', 'Power Bank', 'Accessories', 1, 2000, 2000, 1200, 800),
(218, '2024-01-20', 'South', 'Store_A', 'Power Bank', 'Accessories', 9, 2000, 18000, 10800, 7200),
(219, '2024-01-19', 'East', 'Store_D', 'iPhone', 'Electronics', 4, 60000, 240000, 208000, 32000),
(220, '2024-05-31', 'North', 'Store_A', 'Bluetooth Speaker', 'Accessories', 9, 4500, 40500, 27000, 13500),
(221, '2024-02-19', 'North', 'Store_A', 'Smart Watch', 'Electronics', 2, 12000, 24000, 17000, 7000),
(222, '2024-05-13', 'East', 'Store_D', 'Bluetooth Speaker', 'Accessories', 2, 4500, 9000, 6000, 3000),
(223, '2024-02-15', 'North', 'Store_A', 'Smart Watch', 'Electronics', 2, 12000, 24000, 17000, 7000),
(224, '2024-03-21', 'North', 'Store_B', 'Bluetooth Speaker', 'Accessories', 1, 4500, 4500, 3000, 1500),
(225, '2024-05-01', 'North', 'Store_C', 'Smart Watch', 'Electronics', 9, 12000, 108000, 76500, 31500),
(226, '2024-01-20', 'North', 'Store_D', 'Smart Watch', 'Electronics', 5, 12000, 60000, 42500, 17500),
(227, '2024-06-05', 'South', 'Store_D', 'iPhone', 'Electronics', 9, 60000, 540000, 468000, 72000),
(228, '2024-06-24', 'East', 'Store_C', 'Laptop', 'Electronics', 9, 55000, 495000, 423000, 72000),
(229, '2024-06-29', 'North', 'Store_D', 'Smart Watch', 'Electronics', 1, 12000, 12000, 8500, 3500),
(230, '2024-06-10', 'South', 'Store_C', 'iPhone', 'Electronics', 4, 60000, 240000, 208000, 32000),
(231, '2024-03-27', 'East', 'Store_A', 'Laptop', 'Electronics', 10, 55000, 550000, 470000, 80000),
(232, '2024-01-01', 'West', 'Store_B', 'iPhone', 'Electronics', 1, 60000, 60000, 52000, 8000),
(233, '2024-03-18', 'West', 'Store_C', 'Power Bank', 'Accessories', 7, 2000, 14000, 8400, 5600),
(234, '2024-06-29', 'East', 'Store_A', 'Bluetooth Speaker', 'Accessories', 4, 4500, 18000, 12000, 6000),
(235, '2024-02-11', 'West', 'Store_A', 'Power Bank', 'Accessories', 5, 2000, 10000, 6000, 4000),
(236, '2024-03-19', 'North', 'Store_C', 'Bluetooth Speaker', 'Accessories', 8, 4500, 36000, 24000, 12000),
(237, '2024-05-17', 'West', 'Store_B', 'Laptop', 'Electronics', 3, 55000, 165000, 141000, 24000),
(238, '2024-03-22', 'South', 'Store_D', 'Laptop', 'Electronics', 2, 55000, 110000, 94000, 16000),
(239, '2024-03-21', 'South', 'Store_C', 'Headphones', 'Accessories', 5, 3000, 15000, 9000, 6000),
(240, '2024-02-04', 'South', 'Store_D', 'Smart Watch', 'Electronics', 3, 12000, 36000, 25500, 10500),
(241, '2024-02-10', 'North', 'Store_B', 'Smart Watch', 'Electronics', 6, 12000, 72000, 51000, 21000),
(242, '2024-03-19', 'North', 'Store_C', 'Power Bank', 'Accessories', 4, 2000, 8000, 4800, 3200),
(243, '2024-05-06', 'West', 'Store_B', 'Bluetooth Speaker', 'Accessories', 6, 4500, 27000, 18000, 9000),
(244, '2024-01-06', 'West', 'Store_C', 'iPhone', 'Electronics', 4, 60000, 240000, 208000, 32000),
(245, '2024-01-10', 'South', 'Store_B', 'Laptop', 'Electronics', 10, 55000, 550000, 470000, 80000),
(246, '2024-05-19', 'North', 'Store_B', 'Smart Watch', 'Electronics', 10, 12000, 120000, 85000, 35000),
(247, '2024-05-19', 'South', 'Store_B', 'Headphones', 'Accessories', 3, 3000, 9000, 5400, 3600),
(248, '2024-04-17', 'North', 'Store_C', 'Headphones', 'Accessories', 3, 3000, 9000, 5400, 3600),
(249, '2024-04-24', 'North', 'Store_A', 'Smart Watch', 'Electronics', 4, 12000, 48000, 34000, 14000),
(250, '2024-04-05', 'South', 'Store_D', 'Smart Watch', 'Electronics', 3, 12000, 36000, 25500, 10500),
(251, '2024-02-16', 'South', 'Store_B', 'iPhone', 'Electronics', 10, 60000, 600000, 520000, 80000),
(252, '2024-03-04', 'North', 'Store_C', 'iPhone', 'Electronics', 9, 60000, 540000, 468000, 72000),
(253, '2024-04-09', 'East', 'Store_A', 'Bluetooth Speaker', 'Accessories', 4, 4500, 18000, 12000, 6000),
(254, '2024-06-05', 'West', 'Store_D', 'Bluetooth Speaker', 'Accessories', 2, 4500, 9000, 6000, 3000),
(255, '2024-05-14', 'North', 'Store_A', 'Laptop', 'Electronics', 3, 55000, 165000, 141000, 24000),
(256, '2024-03-20', 'South', 'Store_A', 'Headphones', 'Accessories', 8, 3000, 24000, 14400, 9600),
(257, '2024-02-15', 'East', 'Store_B', 'Power Bank', 'Accessories', 10, 2000, 20000, 12000, 8000),
(258, '2024-05-06', 'West', 'Store_A', 'Smart Watch', 'Electronics', 10, 12000, 120000, 85000, 35000),
(259, '2024-03-06', 'North', 'Store_D', 'Headphones', 'Accessories', 6, 3000, 18000, 10800, 7200),
(260, '2024-05-09', 'East', 'Store_D', 'Laptop', 'Electronics', 8, 55000, 440000, 376000, 64000),
(261, '2024-02-16', 'South', 'Store_D', 'iPhone', 'Electronics', 4, 60000, 240000, 208000, 32000),
(262, '2024-05-28', 'North', 'Store_A', 'Power Bank', 'Accessories', 5, 2000, 10000, 6000, 4000),
(263, '2024-03-22', 'South', 'Store_A', 'iPhone', 'Electronics', 7, 60000, 420000, 364000, 56000),
(264, '2024-04-04', 'West', 'Store_B', 'Bluetooth Speaker', 'Accessories', 2, 4500, 9000, 6000, 3000),
(265, '2024-01-11', 'North', 'Store_A', 'Laptop', 'Electronics', 6, 55000, 330000, 282000, 48000),
(266, '2024-01-04', 'West', 'Store_D', 'Laptop', 'Electronics', 1, 55000, 55000, 47000, 8000),
(267, '2024-05-07', 'South', 'Store_B', 'Bluetooth Speaker', 'Accessories', 5, 4500, 22500, 15000, 7500),
(268, '2024-03-27', 'South', 'Store_A', 'Laptop', 'Electronics', 6, 55000, 330000, 282000, 48000),
(269, '2024-05-31', 'North', 'Store_D', 'Power Bank', 'Accessories', 10, 2000, 20000, 12000, 8000),
(270, '2024-04-04', 'West', 'Store_C', 'Power Bank', 'Accessories', 8, 2000, 16000, 9600, 6400),
(271, '2024-06-10', 'North', 'Store_D', 'Headphones', 'Accessories', 7, 3000, 21000, 12600, 8400),
(272, '2024-01-01', 'East', 'Store_B', 'Headphones', 'Accessories', 10, 3000, 30000, 18000, 12000),
(273, '2024-03-18', 'North', 'Store_D', 'Power Bank', 'Accessories', 2, 2000, 4000, 2400, 1600),
(274, '2024-02-29', 'West', 'Store_C', 'iPhone', 'Electronics', 5, 60000, 300000, 260000, 40000),
(275, '2024-02-17', 'South', 'Store_C', 'Bluetooth Speaker', 'Accessories', 1, 4500, 4500, 3000, 1500),
(276, '2024-02-16', 'North', 'Store_C', 'iPhone', 'Electronics', 5, 60000, 300000, 260000, 40000),
(277, '2024-01-19', 'East', 'Store_C', 'Laptop', 'Electronics', 3, 55000, 165000, 141000, 24000),
(278, '2024-04-30', 'West', 'Store_C', 'Smart Watch', 'Electronics', 8, 12000, 96000, 68000, 28000),
(279, '2024-04-23', 'West', 'Store_D', 'iPhone', 'Electronics', 9, 60000, 540000, 468000, 72000),
(280, '2024-04-17', 'North', 'Store_A', 'Power Bank', 'Accessories', 9, 2000, 18000, 10800, 7200),
(281, '2024-04-14', 'North', 'Store_D', 'Headphones', 'Accessories', 4, 3000, 12000, 7200, 4800),
(282, '2024-06-19', 'East', 'Store_D', 'iPhone', 'Electronics', 5, 60000, 300000, 260000, 40000),
(283, '2024-01-18', 'West', 'Store_B', 'Smart Watch', 'Electronics', 2, 12000, 24000, 17000, 7000),
(284, '2024-06-07', 'South', 'Store_A', 'Headphones', 'Accessories', 3, 3000, 9000, 5400, 3600),
(285, '2024-06-10', 'North', 'Store_B', 'Bluetooth Speaker', 'Accessories', 8, 4500, 36000, 24000, 12000),
(286, '2024-01-24', 'East', 'Store_B', 'Headphones', 'Accessories', 10, 3000, 30000, 18000, 12000),
(287, '2024-02-19', 'North', 'Store_C', 'Smart Watch', 'Electronics', 1, 12000, 12000, 8500, 3500),
(288, '2024-04-15', 'East', 'Store_A', 'Power Bank', 'Accessories', 1, 2000, 2000, 1200, 800),
(289, '2024-04-26', 'North', 'Store_C', 'Bluetooth Speaker', 'Accessories', 2, 4500, 9000, 6000, 3000),
(290, '2024-05-28', 'West', 'Store_C', 'Bluetooth Speaker', 'Accessories', 2, 4500, 9000, 6000, 3000),
(291, '2024-06-19', 'South', 'Store_B', 'Power Bank', 'Accessories', 7, 2000, 14000, 8400, 5600),
(292, '2024-01-12', 'North', 'Store_A', 'Smart Watch', 'Electronics', 1, 12000, 12000, 8500, 3500),
(293, '2024-06-13', 'East', 'Store_B', 'Bluetooth Speaker', 'Accessories', 2, 4500, 9000, 6000, 3000),
(294, '2024-01-11', 'West', 'Store_A', 'Smart Watch', 'Electronics', 2, 12000, 24000, 17000, 7000),
(295, '2024-01-05', 'South', 'Store_B', 'Bluetooth Speaker', 'Accessories', 10, 4500, 45000, 30000, 15000),
(296, '2024-03-07', 'North', 'Store_B', 'iPhone', 'Electronics', 3, 60000, 180000, 156000, 24000),
(297, '2024-04-24', 'South', 'Store_D', 'Headphones', 'Accessories', 7, 3000, 21000, 12600, 8400),
(298, '2024-06-23', 'South', 'Store_B', 'Bluetooth Speaker', 'Accessories', 4, 4500, 18000, 12000, 6000),
(299, '2024-02-06', 'East', 'Store_C', 'Laptop', 'Electronics', 6, 55000, 330000, 282000, 48000),
(300, '2024-01-14', 'East', 'Store_D', 'iPhone', 'Electronics', 2, 60000, 120000, 104000, 16000);

-- 3. Small dimension table for JOIN demonstration (region revenue targets)
CREATE TABLE region_targets (
    region VARCHAR(50) PRIMARY KEY,
    target_revenue INT
);

INSERT INTO region_targets VALUES
('North', 9000000),
('South', 11000000),
('East', 10500000),
('West', 11000000);

-- ============================================
-- 4. ANALYSIS QUERIES (15+ queries covering GROUP BY, subqueries, window functions, and joins)
-- ============================================

-- Q1. Product-wise total revenue (highest to lowest)
SELECT product, SUM(revenue) AS total_revenue
FROM sales
GROUP BY product
ORDER BY total_revenue DESC;

-- Q2. Product-wise total profit
SELECT product, SUM(profit) AS total_profit
FROM sales
GROUP BY product
ORDER BY total_profit DESC;

-- Q3. Region-wise total revenue
SELECT region, SUM(revenue) AS total_revenue
FROM sales
GROUP BY region
ORDER BY total_revenue DESC;

-- Q4. Region-wise total profit
SELECT region, SUM(profit) AS total_profit
FROM sales
GROUP BY region
ORDER BY total_profit DESC;

-- Q5. Category-wise revenue contribution
SELECT category, SUM(revenue) AS total_revenue,
       ROUND(SUM(revenue) * 100.0 / (SELECT SUM(revenue) FROM sales), 2) AS pct_of_total
FROM sales
GROUP BY category;

-- Q6. Profit margin % by product (revenue, cost, profit based)
SELECT product,
       SUM(revenue) AS total_revenue,
       SUM(profit) AS total_profit,
       ROUND(SUM(profit) * 100.0 / SUM(revenue), 2) AS profit_margin_pct
FROM sales
GROUP BY product
ORDER BY profit_margin_pct ASC;

-- Q7. Products with profit margin below 20% (HAVING clause - flagged as high-risk)
SELECT product,
       ROUND(SUM(profit) * 100.0 / SUM(revenue), 2) AS profit_margin_pct
FROM sales
GROUP BY product
HAVING ROUND(SUM(profit) * 100.0 / SUM(revenue), 2) < 20;

-- Q8. SUBQUERY: Find the single highest revenue-generating product
SELECT product, total_revenue
FROM (
    SELECT product, SUM(revenue) AS total_revenue
    FROM sales
    GROUP BY product
) AS product_totals
WHERE total_revenue = (
    SELECT MAX(total_revenue)
    FROM (SELECT product, SUM(revenue) AS total_revenue FROM sales GROUP BY product) AS t
);

-- Q9. SUBQUERY: Find the weakest-performing region (lowest total revenue)
SELECT region, total_revenue
FROM (
    SELECT region, SUM(revenue) AS total_revenue
    FROM sales
    GROUP BY region
) AS region_totals
WHERE total_revenue = (
    SELECT MIN(total_revenue)
    FROM (SELECT region, SUM(revenue) AS total_revenue FROM sales GROUP BY region) AS t
);

-- Q10. WINDOW FUNCTION: Rank all products by total revenue
SELECT product,
       SUM(revenue) AS total_revenue,
       RANK() OVER (ORDER BY SUM(revenue) DESC) AS revenue_rank
FROM sales
GROUP BY product;

-- Q11. WINDOW FUNCTION: Rank regions by total profit
SELECT region,
       SUM(profit) AS total_profit,
       RANK() OVER (ORDER BY SUM(profit) DESC) AS profit_rank
FROM sales
GROUP BY region;

-- Q12. WINDOW FUNCTION: Top 2 best-selling products within each region (PARTITION BY)
SELECT region, product, total_revenue, rn
FROM (
    SELECT region, product,
           SUM(revenue) AS total_revenue,
           ROW_NUMBER() OVER (PARTITION BY region ORDER BY SUM(revenue) DESC) AS rn
    FROM sales
    GROUP BY region, product
) ranked
WHERE rn <= 2;

-- Q13. WINDOW FUNCTION: Running (cumulative) monthly revenue trend
SELECT order_month, monthly_revenue,
       SUM(monthly_revenue) OVER (ORDER BY order_month) AS running_total_revenue
FROM (
    SELECT DATE_FORMAT(order_date, '%Y-%m') AS order_month, SUM(revenue) AS monthly_revenue
    FROM sales
    GROUP BY DATE_FORMAT(order_date, '%Y-%m')
) monthly
ORDER BY order_month;

-- Q14. JOIN: Compare actual region revenue against target revenue (region_targets table)
SELECT s.region,
       SUM(s.revenue) AS actual_revenue,
       r.target_revenue,
       ROUND(SUM(s.revenue) * 100.0 / r.target_revenue, 1) AS pct_of_target_achieved
FROM sales s
JOIN region_targets r ON s.region = r.region
GROUP BY s.region, r.target_revenue
ORDER BY pct_of_target_achieved DESC;

-- Q15. Store-wise performance (which store sells the most)
SELECT store, SUM(revenue) AS total_revenue, SUM(quantity) AS units_sold
FROM sales
GROUP BY store
ORDER BY total_revenue DESC;

-- Q16. Average order value by region
SELECT region, ROUND(AVG(revenue), 2) AS avg_order_value
FROM sales
GROUP BY region
ORDER BY avg_order_value DESC;

-- Q17. Total quantity sold per product (volume vs revenue check)
SELECT product, SUM(quantity) AS units_sold, SUM(revenue) AS total_revenue
FROM sales
GROUP BY product
ORDER BY units_sold DESC;

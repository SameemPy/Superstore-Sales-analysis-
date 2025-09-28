-- Best Customer
SELECT 
    `Customer ID`, SUM(Sales)
FROM
    superstore
GROUP BY `Customer ID`
ORDER BY SUM(Sales) DESC;
-- Region wise total sales & Profits 
SELECT 
    Region,
    SUM(Sales) AS Total_sales,
    SUM(Profit) AS Total_Profit
FROM
    superstore
GROUP BY Region;
-- Category wise total sales
SELECT 
    Category, SUM(Sales) AS total_sales
FROM
    superstore
GROUP BY Category;
-- highest Sales City
SELECT 
    City, State, Sales
FROM
    superstore
WHERE
    Sales = (SELECT 
            MAX(Sales)
        FROM
            superstore);
-- less profit Product
SELECT 
    `Product Name`
FROM
    superstore
WHERE
    Profit = (SELECT 
            MIN(Profit)
        FROM
            superstore);
-- highest profit by region 
SELECT 
    Region, SUM(Profit)
FROM
    superstore
GROUP BY Region
LIMIT 1;
-- total orders ?
SELECT 
    COUNT(`Order ID`) AS Total_Order
FROM
    superstore;

SELECT 
    DATE_FORMAT(STR_TO_DATE(`Order Date`, '%m/%d/%Y'),
            '%Y-%M') AS month,
    SUM(Sales) AS Monthly_Sales,
    SUM(Profit) AS Monthly_profit
FROM
    superstore
WHERE
    `Order Date` IS NOT NULL
GROUP BY month
ORDER BY month;




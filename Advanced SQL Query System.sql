-- Subquery general syntax
SELECT column_name
FROM table_name
WHERE column_name OPERATOR
      (SELECT column_name
       FROM table_name
       WHERE condition);

-- 1. Subqueries and nested queries
SELECT Order_ID, Order_Date, Customer_ID
FROM Orders
WHERE Customer_ID IN (
    SELECT Customer_ID
    FROM Customer
    WHERE City = 'Chennai'
)
ORDER BY Order_Date DESC;

SELECT Order_ID, Customer_ID, Total_Amount
FROM Orders
WHERE Total_Amount >
      (SELECT AVG(Total_Amount)
       FROM Orders);

-- 2. Products above average price
SELECT Product_ID,
       Product_Name,
       Price
FROM Product
WHERE Price >
      (SELECT AVG(Price)
       FROM Product);

-- 2.1 Products below average price
SELECT Product_ID,
       Product_Name,
       Price
FROM Product
WHERE Price <
      (SELECT AVG(Price)
       FROM Product);

-- 3. Customers with maximum purchases
-- Step 1
SELECT Customer_ID,
       SUM(Total_Amount) AS Total_Purchase
FROM Orders
GROUP BY Customer_ID;

-- Step 2
SELECT MAX(Total_Purchase)
FROM
(
    SELECT Customer_ID,
           SUM(Total_Amount) AS Total_Purchase
    FROM Orders
    GROUP BY Customer_ID
);

-- 3.1 Customer details with maximum purchase
SELECT c.Customer_ID,
       c.Customer_Name,
       SUM(o.Total_Amount) AS Total_Purchase
FROM Customer c
JOIN Orders o
    ON c.Customer_ID = o.Customer_ID
GROUP BY
    c.Customer_ID,
    c.Customer_Name
HAVING SUM(o.Total_Amount) = (
    SELECT MAX(Total_Purchase)
    FROM (
        SELECT SUM(Total_Amount) AS Total_Purchase
        FROM Orders
        GROUP BY Customer_ID
    ));

-- 4.1 Customers who placed orders above average order value
SELECT c.Customer_ID,
       c.Customer_Name,
       o.Order_ID,
       o.Total_Amount
FROM Customer c
JOIN Orders o
    ON c.Customer_ID = o.Customer_ID
WHERE o.Total_Amount >
(
    SELECT AVG(Total_Amount)
    FROM Orders
)
ORDER BY o.Total_Amount DESC;

-- 5. Products whose sales are above average
SELECT
    p.Product_ID,
    p.Product_Name,
    SUM(od.Subtotal) AS Total_Sales
FROM Product p
JOIN Order_Details od
    ON p.Product_ID = od.Product_ID
GROUP BY
    p.Product_ID,
    p.Product_Name
HAVING SUM(od.Subtotal) > (
    SELECT AVG(Product_Sales)
    FROM (
        SELECT SUM(Subtotal) AS Product_Sales
        FROM Order_Details
        GROUP BY Product_ID
    ))
ORDER BY Total_Sales DESC;

-- 6. Customer purchase report
SELECT
    c.Customer_ID,
    c.Customer_Name,
    COUNT(o.Order_ID)   AS Total_Orders,
    SUM(o.Total_Amount) AS Total_Purchase,
    AVG(o.Total_Amount) AS Average_Order_Value
FROM Customer c
JOIN Orders o
    ON c.Customer_ID = o.Customer_ID
GROUP BY
    c.Customer_ID,
    c.Customer_Name
ORDER BY Total_Purchase DESC;

-- 7. Advanced product sales report
SELECT
    p.Product_ID,
    p.Product_Name,
    COUNT(od.Order_ID) AS Number_of_Orders,
    SUM(od.Quantity)   AS Total_Quantity_Sold,
    SUM(od.Subtotal)   AS Total_Sales,
    AVG(od.Unit_Price) AS Average_Price
FROM Product p
JOIN Order_Details od
    ON p.Product_ID = od.Product_ID
GROUP BY
    p.Product_ID,
    p.Product_Name
ORDER BY Total_Sales DESC;

-- 8. Category-wise advanced sales report
SELECT
    cat.Category_ID,
    cat.Category_Name,
    COUNT(DISTINCT od.Order_ID) AS Total_Orders,
    SUM(od.Quantity)            AS Total_Quantity_Sold,
    SUM(od.Subtotal)            AS Total_Sales,
    AVG(od.Unit_Price)          AS Average_Price
FROM Category cat
JOIN Product p
    ON cat.Category_ID = p.Category_ID
JOIN Order_Details od
    ON p.Product_ID = od.Product_ID
GROUP BY
    cat.Category_ID,
    cat.Category_Name
ORDER BY Total_Sales DESC;

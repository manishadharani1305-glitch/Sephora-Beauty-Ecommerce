
-- SEPHORA BEAUTY E-COMMERCE DATABASE

CREATE DATABASE IF NOT EXISTS Sephora_Beauty;
USE Sephora_Beauty;

-- 1. Create Tables

CREATE TABLE Category (
    Category_ID INT PRIMARY KEY,
    Category_Name VARCHAR(100) NOT NULL,
    Description VARCHAR(255)
);

CREATE TABLE Products (
    Product_ID INT PRIMARY KEY,
    Product_Name VARCHAR(120) NOT NULL,
    Brand VARCHAR(80) NOT NULL,
    Category_ID INT NOT NULL,
    Price DECIMAL(10,2) NOT NULL,
    Shade VARCHAR(40),
    Stock INT NOT NULL DEFAULT 0,
    FOREIGN KEY (Category_ID)
        REFERENCES Category(Category_ID)
);

CREATE TABLE Customers (
    Customer_ID INT PRIMARY KEY,
    Customer_Name VARCHAR(100) NOT NULL,
    Email VARCHAR(120),
    City VARCHAR(80)
);

CREATE TABLE Orders (
    Order_ID INT PRIMARY KEY,
    Customer_ID INT NOT NULL,
    Order_Date DATE NOT NULL,
    Total_Amount DECIMAL(10,2) NOT NULL,
    Order_Status VARCHAR(30) NOT NULL,
    FOREIGN KEY (Customer_ID)
        REFERENCES Customers(Customer_ID)
);

CREATE TABLE Order_Details (
    Order_Detail_ID INT PRIMARY KEY,
    Order_ID INT NOT NULL,
    Product_ID INT NOT NULL,
    Quantity INT NOT NULL,
    Price DECIMAL(10,2) NOT NULL,
    FOREIGN KEY (Order_ID)
        REFERENCES Orders(Order_ID),
    FOREIGN KEY (Product_ID)
        REFERENCES Products(Product_ID)
);

-- 2. Insert Category Data

INSERT INTO Category VALUES
(1, 'Skincare', 'Skin cleansing and care products'),
(2, 'Makeup', 'Face and eye makeup products'),
(3, 'Fragrance', 'Perfumes and fragrances'),
(4, 'Haircare', 'Hair cleaning and styling products'),
(5, 'Bodycare', 'Body lotions and body care products');

-- 3. Insert Product Data

INSERT INTO Products VALUES
(201, 'Hydrating Moisturizer', 'Sephora', 1, 2499.00, 'Clear', 25),
(202, 'Matte Foundation', 'Fenty Beauty', 2, 3499.00, 'Beige', 18),
(203, 'Rose Perfume', 'Dior', 3, 5999.00, 'Rose', 12),
(204, 'Repair Shampoo', 'Olaplex', 4, 1999.00, 'Clear', 30),
(205, 'Body Lotion', 'Sol de Janeiro', 5, 2999.00, 'Cream', 20),
(206, 'Face Serum', 'The Ordinary', 1, 1799.00, 'Clear', 35),
(207, 'Lipstick', 'Rare Beauty', 2, 2299.00, 'Red', 15),
(208, 'Floral Perfume', 'Gucci', 3, 4599.00, 'Floral', 10);

-- 4. Insert Customer Data

INSERT INTO Customers VALUES
(101, 'Customer One', 'customer1@example.com', 'Chennai'),
(102, 'Customer Two', 'customer2@example.com', 'Coimbatore'),
(103, 'Customer Three', 'customer3@example.com', 'Madurai'),
(104, 'Customer Four', 'customer4@example.com', 'Chennai'),
(105, 'Customer Five', 'customer5@example.com', 'Salem');

-- 5. Insert Order Data

INSERT INTO Orders VALUES
(301, 101, '2026-10-01', 2499.00, 'Delivered'),
(302, 102, '2026-10-03', 3499.00, 'Shipped'),
(303, 101, '2026-10-06', 5998.00, 'Confirmed'),
(304, 103, '2026-10-08', 1999.00, 'Delivered'),
(305, 104, '2026-10-10', 4599.00, 'Pending'),
(306, 105, '2026-10-12', 2999.00, 'Confirmed');

-- 6. Insert Order Details

INSERT INTO Order_Details VALUES
(1, 301, 201, 1, 2499.00),
(2, 302, 202, 1, 3499.00),
(3, 303, 205, 2, 2999.00),
(4, 304, 204, 1, 1999.00),
(5, 305, 208, 1, 4599.00),
(6, 306, 207, 1, 2999.00);

-- 7. Basic SQL Queries

-- 7.1 Display all products
SELECT * FROM Products;

-- 7.2 Display selected product details
SELECT Product_ID, Product_Name, Brand, Price, Stock
FROM Products;

-- 7.3 Filter products by category
SELECT Product_ID, Product_Name
FROM Products
WHERE Category_ID = 1;

-- 7.4 Sort products by price
SELECT Product_ID, Product_Name, Price
FROM Products
ORDER BY Price DESC;

-- 7.5 Display unique brands
SELECT DISTINCT Brand
FROM Products;

-- 7.6 Display unique shades
SELECT DISTINCT Shade
FROM Products;

-- 8. Search Products by Price

SELECT Product_ID, Product_Name, Price
FROM Products
WHERE Price BETWEEN 2000 AND 3500
ORDER BY Price;

-- 9. Retrieve Customer Information

SELECT * FROM Customers;

-- 10. Filtering with AND, OR, NOT

-- AND condition
SELECT Product_ID, Product_Name, Price, Stock
FROM Products
WHERE Price < 3500 AND Stock > 15;

-- OR condition
SELECT Product_ID, Product_Name, Category_ID
FROM Products
WHERE Category_ID = 1 OR Category_ID = 2;

-- NOT condition
SELECT Product_ID, Product_Name, Shade
FROM Products
WHERE NOT Shade = 'Clear';

-- 11. Product Price Report

SELECT Product_ID, Product_Name, Price
FROM Products
ORDER BY Price DESC;

-- 12. Customer Order Report

SELECT O.Order_ID, C.Customer_ID, C.Customer_Name,
       O.Order_Date, O.Total_Amount, O.Order_Status
FROM Orders O
JOIN Customers C
ON C.Customer_ID = O.Customer_ID
ORDER BY O.Order_Date;

-- 13. Product Sales Report

SELECT P.Product_ID, P.Product_Name,
       SUM(OD.Quantity) AS Total_Quantity_Ordered,
       SUM(OD.Quantity * OD.Price) AS Total_Sales
FROM Products P
JOIN Order_Details OD
ON OD.Product_ID = P.Product_ID
GROUP BY P.Product_ID, P.Product_Name
ORDER BY Total_Sales DESC;

-- 14. Customer-wise Total Orders

SELECT C.Customer_ID, C.Customer_Name,
       COUNT(O.Order_ID) AS Total_Orders
FROM Customers C
LEFT JOIN Orders O
ON O.Customer_ID = C.Customer_ID
GROUP BY C.Customer_ID, C.Customer_Name
ORDER BY Total_Orders DESC;

-- 15. Customer-wise Total Purchase Amount

SELECT C.Customer_ID, C.Customer_Name,
       COALESCE(SUM(O.Total_Amount), 0)
       AS Total_Purchase_Amount
FROM Customers C
LEFT JOIN Orders O
ON O.Customer_ID = C.Customer_ID
GROUP BY C.Customer_ID, C.Customer_Name
ORDER BY Total_Purchase_Amount DESC;

-- 16. Count Total Products

SELECT COUNT(*) AS Total_Products
FROM Products;

-- 17. Find Minimum and Maximum Price

SELECT MIN(Price) AS Minimum_Price,
       MAX(Price) AS Maximum_Price
FROM Products;

-- 18. Find Average Product Price

SELECT ROUND(AVG(Price), 2) AS Average_Price
FROM Products;

-- 19. Count Products in Each Category

SELECT C.Category_Name,
       COUNT(P.Product_ID) AS Total_Products
FROM Category C
LEFT JOIN Products P
ON P.Category_ID = C.Category_ID
GROUP BY C.Category_ID, C.Category_Name
ORDER BY C.Category_ID;

CREATE TABLE Product (
    Product_ID NUMBER PRIMARY KEY,
    Product_Name VARCHAR2(100) NOT NULL,
    Category VARCHAR2(50) NOT NULL,
    Price NUMBER(10,2) NOT NULL
);

SELECT * FROM Product;
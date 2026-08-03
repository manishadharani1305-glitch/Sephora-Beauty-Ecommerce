-- ==========================================
-- Sephora Beauty E-Commerce Website
-- Customer.sql
-- ==========================================

-- Create Customer Table
CREATE TABLE Customer (
    Customer_ID NUMBER PRIMARY KEY,
    First_Name VARCHAR2(50),
    Last_Name VARCHAR2(50),
    Gender VARCHAR2(10),
    Email VARCHAR2(100),
    Phone VARCHAR2(15),
    Password VARCHAR2(100),
    Address VARCHAR2(100),
    City VARCHAR2(50),
    State VARCHAR2(50),
    Pincode VARCHAR2(10),
    Registration_Date DATE
);

-- Insert Customer Records
INSERT INTO Customer VALUES
(101,'Ananya','Sharma','Female','ananya@gmail.com','9876543210',
'Ananya123','12 MG Road','Bangalore','Karnataka','560001',DATE '2026-08-01');

INSERT INTO Customer VALUES
(102,'Priya','Nair','Female','priya@gmail.com','9876543211',
'Priya123','22 Marine Drive','Kochi','Kerala','682001',DATE '2026-08-02');

INSERT INTO Customer VALUES
(103,'Rahul','Verma','Male','rahul@gmail.com','9876543212',
'Rahul123','45 Anna Nagar','Chennai','Tamil Nadu','600040',DATE '2026-08-03');

INSERT INTO Customer VALUES
(104,'Sneha','Reddy','Female','sneha@gmail.com','9876543213',
'Sneha123','15 Jubilee Hills','Hyderabad','Telangana','500033',DATE '2026-08-04');

INSERT INTO Customer VALUES
(105,'Arjun','Patel','Male','arjun@gmail.com','9876543214',
'Arjun123','78 CG Road','Ahmedabad','Gujarat','380009',DATE '2026-08-05');

-- Display All Customers
SELECT * FROM Customer;

-- Update Customer City
UPDATE Customer
SET City = 'Mumbai'
WHERE Customer_ID = 105;

SELECT * FROM Customer;

-- Update Customer Email
UPDATE Customer
SET Email = 'arjun.patel@gmail.com'
WHERE Customer_ID = 105;

SELECT * FROM Customer;

-- Delete Customer
DELETE FROM Customer
WHERE Customer_ID = 104;

SELECT * FROM Customer;

CREATE TABLE Customer (
    Customer_ID NUMBER PRIMARY KEY,
    First_Name VARCHAR2(50),
    Last_Name VARCHAR2(50),
    Gender VARCHAR2(10),
    Email VARCHAR2(100),
    Phone VARCHAR2(15),
    Password VARCHAR2(100),
    Address VARCHAR2(200),
    City VARCHAR2(50),
    State VARCHAR2(50),
    Pincode VARCHAR2(10),
    Registration_Date DATE
);

SELECT * FROM Customer;
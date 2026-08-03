==========================================
Sephora Beauty E-Commerce Website
Customer.sql - OUTPUT
==========================================

SQL> CREATE TABLE Customer (
  2      Customer_ID NUMBER PRIMARY KEY,
  3      First_Name VARCHAR2(50),
  4      Last_Name VARCHAR2(50),
  5      Gender VARCHAR2(10),
  6      Email VARCHAR2(100),
  7      Phone VARCHAR2(15),
  8      Password VARCHAR2(100),
  9      Address VARCHAR2(100),
 10      City VARCHAR2(50),
 11      State VARCHAR2(50),
 12      Pincode VARCHAR2(10),
 13      Registration_Date DATE
 14  );

Table created.


SQL> INSERT INTO Customer VALUES
(101,'Ananya','Sharma','Female','ananya@gmail.com','9876543210',
'Ananya123','12 MG Road','Bangalore','Karnataka','560001',DATE '2026-08-01');

1 row created.

SQL> INSERT INTO Customer VALUES
(102,'Priya','Nair','Female','priya@gmail.com','9876543211',
'Priya123','22 Marine Drive','Kochi','Kerala','682001',DATE '2026-08-02');

1 row created.

SQL> INSERT INTO Customer VALUES
(103,'Rahul','Verma','Male','rahul@gmail.com','9876543212',
'Rahul123','45 Anna Nagar','Chennai','Tamil Nadu','600040',DATE '2026-08-03');

1 row created.

SQL> INSERT INTO Customer VALUES
(104,'Sneha','Reddy','Female','sneha@gmail.com','9876543213',
'Sneha123','15 Jubilee Hills','Hyderabad','Telangana','500033',DATE '2026-08-04');

1 row created.

SQL> INSERT INTO Customer VALUES
(105,'Arjun','Patel','Male','arjun@gmail.com','9876543214',
'Arjun123','78 CG Road','Ahmedabad','Gujarat','380009',DATE '2026-08-05');

1 row created.


SQL> SELECT * FROM Customer;

CUSTOMER_ID FIRST_NAME LAST_NAME  GENDER EMAIL                 PHONE       PASSWORD   ADDRESS            CITY       STATE       PINCODE REGISTRATION_DATE
----------- ---------- ---------- ------ --------------------- ----------- ---------- ------------------ ---------- ----------- ------- -----------------
        101 Ananya     Sharma     Female ananya@gmail.com      9876543210 Ananya123  12 MG Road         Bangalore  Karnataka   560001  01-AUG-26
        102 Priya      Nair       Female priya@gmail.com       9876543211 Priya123   22 Marine Drive    Kochi      Kerala      682001  02-AUG-26
        103 Rahul      Verma      Male   rahul@gmail.com       9876543212 Rahul123   45 Anna Nagar      Chennai    Tamil Nadu  600040  03-AUG-26
        104 Sneha      Reddy      Female sneha@gmail.com       9876543213 Sneha123   15 Jubilee Hills   Hyderabad  Telangana   500033  04-AUG-26
        105 Arjun      Patel      Male   arjun@gmail.com       9876543214 Arjun123   78 CG Road         Ahmedabad  Gujarat     380009  05-AUG-26

5 rows selected.


SQL> UPDATE Customer
SET City = 'Mumbai'
WHERE Customer_ID = 105;

1 row updated.

SQL> SELECT * FROM Customer;

CUSTOMER_ID FIRST_NAME LAST_NAME  GENDER EMAIL                 PHONE       PASSWORD   ADDRESS            CITY       STATE       PINCODE REGISTRATION_DATE
----------- ---------- ---------- ------ --------------------- ----------- ---------- ------------------ ---------- ----------- ------- -----------------
        101 Ananya     Sharma     Female ananya@gmail.com      9876543210 Ananya123  12 MG Road         Bangalore  Karnataka   560001  01-AUG-26
        102 Priya      Nair       Female priya@gmail.com       9876543211 Priya123   22 Marine Drive    Kochi      Kerala      682001  02-AUG-26
        103 Rahul      Verma      Male   rahul@gmail.com       9876543212 Rahul123   45 Anna Nagar      Chennai    Tamil Nadu  600040  03-AUG-26
        104 Sneha      Reddy      Female sneha@gmail.com       9876543213 Sneha123   15 Jubilee Hills   Hyderabad  Telangana   500033  04-AUG-26
        105 Arjun      Patel      Male   arjun@gmail.com       9876543214 Arjun123   78 CG Road         Mumbai     Gujarat     380009  05-AUG-26

5 rows selected.


SQL> UPDATE Customer
SET Email = 'arjun.patel@gmail.com'
WHERE Customer_ID = 105;

1 row updated.

SQL> SELECT * FROM Customer;

CUSTOMER_ID FIRST_NAME LAST_NAME  GENDER EMAIL                    PHONE       PASSWORD   ADDRESS            CITY       STATE       PINCODE REGISTRATION_DATE
----------- ---------- ---------- ------ ------------------------ ----------- ---------- ------------------ ---------- ----------- ------- -----------------
        101 Ananya     Sharma     Female ananya@gmail.com         9876543210 Ananya123  12 MG Road         Bangalore  Karnataka   560001  01-AUG-26
        102 Priya      Nair       Female priya@gmail.com          9876543211 Priya123   22 Marine Drive    Kochi      Kerala      682001  02-AUG-26
        103 Rahul      Verma      Male   rahul@gmail.com          9876543212 Rahul123   45 Anna Nagar      Chennai    Tamil Nadu  600040  03-AUG-26
        104 Sneha      Reddy      Female sneha@gmail.com          9876543213 Sneha123   15 Jubilee Hills   Hyderabad  Telangana   500033  04-AUG-26
        105 Arjun      Patel      Male   arjun.patel@gmail.com    9876543214 Arjun123   78 CG Road         Mumbai     Gujarat     380009  05-AUG-26

5 rows selected.


SQL> DELETE FROM Customer
WHERE Customer_ID = 104;

1 row deleted.

SQL> SELECT * FROM Customer;

CUSTOMER_ID FIRST_NAME LAST_NAME  GENDER EMAIL                    PHONE       PASSWORD   ADDRESS            CITY       STATE       PINCODE REGISTRATION_DATE
----------- ---------- ---------- ------ ------------------------ ----------- ---------- ------------------ ---------- ----------- ------- -----------------
        101 Ananya     Sharma     Female ananya@gmail.com         9876543210 Ananya123  12 MG Road         Bangalore  Karnataka   560001  01-AUG-26
        102 Priya      Nair       Female priya@gmail.com          9876543211 Priya123   22 Marine Drive    Kochi      Kerala      682001  02-AUG-26
        103 Rahul      Verma      Male   rahul@gmail.com          9876543212 Rahul123   45 Anna Nagar      Chennai    Tamil Nadu  600040  03-AUG-26
        105 Arjun      Patel      Male   arjun.patel@gmail.com    9876543214 Arjun123   78 CG Road         Mumbai     Gujarat     380009  05-AUG-26

4 rows selected.

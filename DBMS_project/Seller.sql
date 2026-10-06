CREATE TABLE Seller (
    Seller_ID NUMBER PRIMARY KEY,
    Seller_Name VARCHAR2(100) NOT NULL,
    Email VARCHAR2(100) UNIQUE NOT NULL,
    Contact_No VARCHAR2(15) UNIQUE NOT NULL,
    Address VARCHAR2(200) NOT NULL
);

INSERT INTO Seller
VALUES (101, 'Lakme Cosmetics', 'lakme@gmail.com', '9876543210', 'Chennai');

INSERT INTO Seller
VALUES (102, 'Maybelline Store', 'maybelline@gmail.com', '9876543211', 'Bangalore');

INSERT INTO Seller
VALUES (103, 'Sugar Cosmetics', 'sugar@gmail.com', '9876543212', 'Mumbai');

INSERT INTO Seller
VALUES (104, 'MAC Cosmetics', 'mac@gmail.com', '9876543213', 'Delhi');

INSERT INTO Seller
VALUES (105, 'Nykaa Beauty', 'nykaa@gmail.com', '9876543214', 'Hyderabad');

COMMIT;

SELECT * FROM Seller;
CREATE TABLE Inventory (
    Inventory_ID NUMBER PRIMARY KEY,
    Product_ID NUMBER,
    Seller_ID NUMBER,
    Stock_Quantity NUMBER NOT NULL,
    Stock_Status VARCHAR2(20) NOT NULL,
    Last_Updated DATE NOT NULL,

    CONSTRAINT fk_inventory_product
        FOREIGN KEY (Product_ID)
        REFERENCES Product(Product_ID),

    CONSTRAINT fk_inventory_seller
        FOREIGN KEY (Seller_ID)
        REFERENCES Seller(Seller_ID)
);

INSERT INTO Inventory
VALUES (201, 301, 101, 50, 'Available', SYSDATE);

INSERT INTO Inventory
VALUES (202, 302, 102, 30, 'Available', SYSDATE);

INSERT INTO Inventory
VALUES (203, 303, 103, 0, 'Unavailable', SYSDATE);

INSERT INTO Inventory
VALUES (204, 304, 104, 25, 'Available', SYSDATE);

INSERT INTO Inventory
VALUES (205, 305, 105, 10, 'Available', SYSDATE);

COMMIT;

SELECT * FROM Inventory;
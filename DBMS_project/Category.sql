CREATE TABLE Category (
    Category_ID NUMBER PRIMARY KEY,
    Category_Name VARCHAR2(50) NOT NULL
);

INSERT INTO Category VALUES (1, 'Makeup');
INSERT INTO Category VALUES (2, 'Skincare');
INSERT INTO Category VALUES (3, 'Fragrance');

COMMIT;

SELECT * FROM Category;
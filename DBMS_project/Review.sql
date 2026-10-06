CREATE TABLE Review (
    Review_ID NUMBER PRIMARY KEY,
    Product_ID NUMBER NOT NULL,
    Customer_ID NUMBER NOT NULL,
    Rating NUMBER(1) NOT NULL,
    Review_Text VARCHAR2(500),
    Review_Date DATE NOT NULL,
    CHECK (Rating BETWEEN 1 AND 5)
);

INSERT INTO Review VALUES (701, 101, 101, 5, 'Excellent lipstick quality', SYSDATE);
INSERT INTO Review VALUES (702, 102, 102, 4, 'Good foundation coverage', SYSDATE);
INSERT INTO Review VALUES (703, 103, 103, 5, 'Very effective face serum', SYSDATE);
INSERT INTO Review VALUES (704, 104, 104, 4, 'Moisturizer is good', SYSDATE);
INSERT INTO Review VALUES (705, 105, 105, 5, 'Amazing fragrance', SYSDATE);

COMMIT;

SELECT * FROM Review;
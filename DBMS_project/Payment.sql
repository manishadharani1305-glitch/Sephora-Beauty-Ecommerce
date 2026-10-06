CREATE TABLE Payment (
    Payment_ID NUMBER PRIMARY KEY,
    Order_ID NUMBER NOT NULL,
    Payment_Mode VARCHAR2(30) NOT NULL,
    Payment_Date DATE NOT NULL,
    Payment_Status VARCHAR2(20) NOT NULL,

    CONSTRAINT chk_payment_mode
        CHECK (Payment_Mode IN ('UPI', 'Card', 'Cash', 'Net Banking')),

    CONSTRAINT chk_payment_status
        CHECK (Payment_Status IN ('Successful', 'Failed', 'Pending'))
);

INSERT INTO Payment
VALUES (501, 401, 'UPI', SYSDATE, 'Successful');

INSERT INTO Payment
VALUES (502, 402, 'Card', SYSDATE, 'Successful');

INSERT INTO Payment
VALUES (503, 403, 'Cash', SYSDATE, 'Pending');

INSERT INTO Payment
VALUES (504, 404, 'Net Banking', SYSDATE, 'Failed');

INSERT INTO Payment
VALUES (505, 405, 'UPI', SYSDATE, 'Successful');

COMMIT;

SELECT * FROM Payment;

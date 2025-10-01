
-- fee_payment_transaction.sql
-- Script to demonstrate fee payment table with transaction control

-- Create fee_payment table
CREATE TABLE fee_payment (
    pay_id INT PRIMARY KEY,
    student_name VARCHAR(100),
    amount DECIMAL(10, 2),
    payment_date DATE
);

-- First transaction: Insert multiple records
START TRANSACTION;

INSERT INTO fee_payment (pay_id, student_name, amount, payment_date)
VALUES 
    (201, 'Riya Sharma', 15000.00, '2025-10-01'),
    (202, 'Kunal Mehta', 18000.50, '2025-10-01'),
    (203, 'Sneha Kapoor', 22000.75, '2025-10-01');

COMMIT;

-- Display current records
SELECT * FROM fee_payment;

-- Second transaction: Attempt duplicate entry
START TRANSACTION;

INSERT INTO fee_payment (pay_id, student_name, amount, payment_date)
VALUES 
    (201, 'Duplicate Entry', 9999.99, '2025-10-02');

-- Rollback due to duplicate
ROLLBACK;

-- Display records after rollback
SELECT * FROM fee_payment;

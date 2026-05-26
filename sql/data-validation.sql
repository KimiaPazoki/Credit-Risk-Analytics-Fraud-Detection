-- Data Validation Checks
-- Purpose: Validate prepared data before loading into Power BI.

-- 1. Validate transaction fraud flag values
SELECT DISTINCT IsFraud
FROM transactions;

-- 2. Validate application fraud flag values
SELECT DISTINCT IsFraudApp
FROM applications;

-- 3. Check negative or zero loan amounts
SELECT *
FROM applications
WHERE LoanAmount <= 0;

-- 4. Check negative transaction amounts
SELECT *
FROM transactions
WHERE Amount < 0;

-- 5. Check unmatched customers between applications and customer table
SELECT a.CustomerID
FROM applications a
LEFT JOIN customers c
ON a.CustomerID = c.CustomerID
WHERE c.CustomerID IS NULL;

-- 6. Check unmatched customers between transactions and customer table
SELECT t.CustomerID
FROM transactions t
LEFT JOIN customers c
ON t.CustomerID = c.CustomerID
WHERE c.CustomerID IS NULL;

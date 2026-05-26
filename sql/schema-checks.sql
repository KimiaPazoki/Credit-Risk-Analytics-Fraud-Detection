-- Schema & Key Checks
-- Purpose: Verify key fields before importing data into Power BI.

-- Check application primary key
SELECT 
    ApplicationID,
    COUNT(*) AS record_count
FROM applications
GROUP BY ApplicationID
HAVING COUNT(*) > 1;

-- Check customer primary key
SELECT 
    CustomerID,
    COUNT(*) AS record_count
FROM customers
GROUP BY CustomerID
HAVING COUNT(*) > 1;

-- Check transaction primary key
SELECT 
    TransactionID,
    COUNT(*) AS record_count
FROM transactions
GROUP BY TransactionID
HAVING COUNT(*) > 1;

-- Check missing relationship keys
SELECT *
FROM applications
WHERE CustomerID IS NULL;

SELECT *
FROM transactions
WHERE CustomerID IS NULL;

-- Data Cleaning & Preparation
-- Purpose: Prepare loan, customer, transaction, and risk data for Power BI reporting.

-- 1. Check duplicate loan applications
SELECT 
    ApplicationID,
    COUNT(*) AS duplicate_count
FROM applications
GROUP BY ApplicationID
HAVING COUNT(*) > 1;

-- 2. Check missing key fields in applications
SELECT *
FROM applications
WHERE ApplicationID IS NULL
   OR CustomerID IS NULL
   OR LoanAmount IS NULL
   OR DecisionDate IS NULL;

-- 3. Standardize approval status
SELECT
    ApplicationID,
    CustomerID,
    LoanAmount,
    CASE
        WHEN Approved IN (1, 'Yes', 'Approved') THEN 1
        ELSE 0
    END AS Approved_Flag,
    DecisionDate
FROM applications;

-- 4. Check invalid credit scores
SELECT *
FROM customers
WHERE CreditScore < 300
   OR CreditScore > 850
   OR CreditScore IS NULL;

-- 5. Check missing transaction values
SELECT *
FROM transactions
WHERE TransactionID IS NULL
   OR CustomerID IS NULL
   OR Amount IS NULL
   OR TransactionDate IS NULL;

-- 6. Create credit score bands for analysis
SELECT
    CustomerID,
    CreditScore,
    CASE
        WHEN CreditScore >= 750 THEN 'Excellent'
        WHEN CreditScore >= 700 THEN 'Very Good'
        WHEN CreditScore >= 650 THEN 'Good'
        WHEN CreditScore >= 600 THEN 'Fair'
        ELSE 'Poor'
    END AS Credit_Score_Band
FROM customers;

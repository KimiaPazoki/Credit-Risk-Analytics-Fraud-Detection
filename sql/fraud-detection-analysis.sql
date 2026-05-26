-- Fraud Detection Analysis

SELECT
    Region,

    COUNT(TransactionID) AS Total_Transactions,

    SUM(CASE 
        WHEN IsFraud = 1 THEN 1 
        ELSE 0 
    END) AS Fraud_Transactions,

    ROUND(
        SUM(CASE WHEN IsFraud = 1 THEN 1 ELSE 0 END) * 100.0
        / COUNT(TransactionID),
        2
    ) AS Fraud_Rate,

    ROUND(
        SUM(CASE 
            WHEN IsFraud = 1 THEN Amount 
            ELSE 0 
        END),
        2
    ) AS Fraud_Exposure

FROM transactions

GROUP BY Region

ORDER BY Fraud_Exposure DESC;

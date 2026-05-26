-- Customer Segmentation Analysis

SELECT
    CASE
        WHEN CreditScore >= 750 THEN 'Excellent'
        WHEN CreditScore >= 700 THEN 'Good'
        WHEN CreditScore >= 650 THEN 'Fair'
        ELSE 'High Risk'
    END AS Credit_Score_Band,

    COUNT(CustomerID) AS Total_Customers,

    ROUND(AVG(CreditScore), 2) AS Avg_Credit_Score,

    ROUND(AVG(DebtToIncomeRatio), 2) AS Avg_DTI,

    SUM(CASE 
        WHEN HasDefaultedBefore = 1 THEN 1 
        ELSE 0 
    END) AS Customers_With_Default_History,

    ROUND(
        SUM(CASE WHEN HasDefaultedBefore = 1 THEN 1 ELSE 0 END) * 100.0
        / COUNT(CustomerID),
        2
    ) AS Default_History_Rate

FROM customers

GROUP BY Credit_Score_Band

ORDER BY Default_History_Rate DESC;

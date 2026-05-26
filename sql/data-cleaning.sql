-- Credit Risk KPI Analysis

SELECT 
    COUNT(ApplicationID) AS Total_Applications,
    
    SUM(CASE 
        WHEN Approved = 1 THEN 1 
        ELSE 0 
    END) AS Approved_Applications,

    ROUND(
        SUM(CASE WHEN Approved = 1 THEN 1 ELSE 0 END) * 100.0 
        / COUNT(ApplicationID),
        2
    ) AS Approval_Rate,

    ROUND(AVG(CreditScore),2) AS Avg_Credit_Score,

    ROUND(SUM(LoanAmount),2) AS Total_Loan_Exposure,

    ROUND(AVG(RiskProb) * 100,2) AS Avg_Risk_Probability

FROM applications;

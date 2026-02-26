
-- Asli Nuksan Kitna Hai? (Total Churn)
SELECT 
    "Churn Label", 
    COUNT(*) as Total_Customers
FROM churn_data
GROUP BY 
    "Churn Label";

-- Log Kyun Ja Rahe Hain? (Top 5 Churn Reasons)
SELECT 
    "Churn Reason", 
    COUNT(*) as Number_of_Customers
FROM 
    churn_data
WHERE 
    "Churn Label" = 'Yes'
GROUP BY 
    "Churn Reason"
ORDER BY 
    Number_of_Customers DESC
LIMIT 5;

-- Kaunsa Contract Sabse Khatarnak Hai?
SELECT 
    Contract, 
    COUNT(*) as Total_Customers,
    SUM(CASE WHEN "Churn Label" = 'Yes' THEN 1 ELSE 0 END) as Churned_Customers
FROM 
    churn_data
GROUP BY 
    Contract;

-- har mahine kitne Dollars ($) ka nuksan
SELECT 
    Contract, 
    COUNT(*) as Churned_Customers,
    ROUND(SUM("Monthly Charges":: numeric), 2) as Monthly_Revenue_Loss_Dollars
FROM 
    churn_data
WHERE 
    "Churn Label" = 'Yes'
GROUP BY 
    Contract
ORDER BY 
    Monthly_Revenue_Loss_Dollars DESC;


SELECT 
"Payment Method",
COUNT(*) as total_customers,
SUM(CASE WHEN "Churn Label" = 'Yes' THEN 1 ELSE 0 END) as churned_customers
FROM churn_data
GROUP BY "Payment Method";
	
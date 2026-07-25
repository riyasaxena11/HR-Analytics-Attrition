USE hr_analytics;
SHOW TABLES;
SELECT 
    COUNT(*) AS Total_Employees
FROM hr_employee_attrition;
SELECT COUNT(*) AS Employees_Left
FROM hr_employee_attrition
WHERE Attrition = 'Yes';
SELECT 
ROUND(
    (COUNT(CASE WHEN Attrition = 'Yes' THEN 1 END) * 100.0) 
    / COUNT(*), 
2
) AS Attrition_Rate
FROM hr_employee_attrition;
SELECT 
Department,
COUNT(*) AS Employee_Count
FROM hr_employee_attrition
GROUP BY Department;
SELECT 
Department,
COUNT(*) AS Employees_Left
FROM hr_employee_attrition
WHERE Attrition = 'Yes'
GROUP BY Department
ORDER BY Employees_Left DESC;
SELECT 
Department,
COUNT(*) AS Total_Employees,
COUNT(CASE WHEN Attrition = 'Yes' THEN 1 END) AS Employees_Left,
ROUND(
(COUNT(CASE WHEN Attrition = 'Yes' THEN 1 END) * 100.0) / COUNT(*),
2
) AS Attrition_Rate
FROM hr_employee_attrition
GROUP BY Department
ORDER BY Attrition_Rate DESC;
SELECT 
    JobRole,
    COUNT(*) AS Total_Employees,
    COUNT(CASE WHEN Attrition = 'Yes' THEN 1 END) AS Employees_Left,
    ROUND(
        (COUNT(CASE WHEN Attrition = 'Yes' THEN 1 END) * 100.0) / COUNT(*),
        2
    ) AS Attrition_Rate
FROM hr_employee_attrition
GROUP BY JobRole
ORDER BY Attrition_Rate DESC;
SELECT 
    OverTime,
    COUNT(*) AS Total_Employees,
    COUNT(CASE WHEN Attrition = 'Yes' THEN 1 END) AS Employees_Left,
    ROUND(
        (COUNT(CASE WHEN Attrition = 'Yes' THEN 1 END) * 100.0) / COUNT(*),
        2
    ) AS Attrition_Rate
FROM hr_employee_attrition
GROUP BY OverTime;
SELECT
    Attrition,
    COUNT(*) AS Employee_Count,
    ROUND(AVG(MonthlyIncome),2) AS Average_Salary
FROM hr_employee_attrition
GROUP BY Attrition;
SELECT
    JobSatisfaction,
    Attrition,
    COUNT(*) AS Employee_Count
FROM hr_employee_attrition
GROUP BY JobSatisfaction, Attrition
ORDER BY JobSatisfaction;
SELECT
    Attrition,
    COUNT(*) AS Employee_Count,
    ROUND(AVG(YearsAtCompany),2) AS Average_Years
FROM hr_employee_attrition
GROUP BY Attrition;
SELECT
    CASE
        WHEN Age BETWEEN 18 AND 25 THEN '18-25'
        WHEN Age BETWEEN 26 AND 35 THEN '26-35'
        WHEN Age BETWEEN 36 AND 45 THEN '36-45'
        WHEN Age BETWEEN 46 AND 55 THEN '46-55'
        ELSE '56+'
    END AS Age_Group,

    COUNT(*) AS Total_Employees,

    COUNT(CASE WHEN Attrition='Yes' THEN 1 END) AS Employees_Left,

    ROUND(
        (COUNT(CASE WHEN Attrition='Yes' THEN 1 END)*100.0)
        / COUNT(*),
        2
    ) AS Attrition_Rate

FROM hr_employee_attrition

GROUP BY Age_Group

ORDER BY Attrition_Rate DESC;
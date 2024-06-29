SELECT *
FROM `healthcareproj`.`healthcare_dataset`

-- How many patients are there by gender?

SELECT gender, COUNT(gender) as Gender_Count
FROM `healthcareproj`.`healthcare_dataset`
GROUP BY gender

-- What is the average billing amount for each medical condition?

SELECT `Medical Condition`, AVG(`Billing Amount`)
FROM `healthcareproj`.`healthcare_dataset`
GROUP BY `Medical Condition`

-- Which doctor has treated the most patients?

SELECT Doctor, COUNT(Doctor) AS Patient_Count
FROM `healthcareproj`.`healthcare_dataset`
GROUP BY Doctor
ORDER BY PatientCount DESC

-- What is the total billing amount for each insurance provider?

SELECT `Insurance Provider`, SUM(`Billing Amount`) AS Total_Billing_Amount
FROM `healthcareproj`.`healthcare_dataset`
GROUP BY `Insurance Provider`
ORDER BY Total_Billing_Amount DESC

-- How many patients were admitted in each hospital? 

SELECT Hospital, COUNT(Hospital) AS Patient_Count
FROM `healthcareproj`.`healthcare_dataset`
GROUP BY `Hospital`
ORDER BY PatientCount DESC

-- What is the average age of patients with each blood type?

SELECT `Blood Type`, AVG(Age) AS Average_Age
FROM `healthcareproj`.`healthcare_dataset`
GROUP BY `Blood Type`
ORDER BY Average_Age

-- How many patients had an "Urgent" admission type?

SELECT COUNT(*) AS Number_Of_Urgent_Admissions
FROM `healthcareproj`.`healthcare_dataset`
WHERE `Admission Type` = 'Urgent'

-- What is the total number of patients discharged on each date?

SELECT `Discharge Date`, COUNT(`Discharge Date`) AS Count_Of_Patients
FROM `healthcareproj`.`healthcare_dataset`
GROUP BY `Discharge Date`
ORDER BY `Discharge Date`

-- What is the most common medication prescribed?

SELECT Medication, COUNT(Medication) AS Number_Of_Prescriptions
FROM `healthcareproj`.`healthcare_dataset`
GROUP BY Medication
ORDER BY Number_Of_Prescriptions DESC

-- How many patients have normal test results?

SELECT COUNT(*) AS Number_Of_Normal_Results
FROM `healthcareproj`.`healthcare_dataset`
WHERE `Test Results` = 'Normal'

-- What is the average duration of hospital stay for each medical condition?

DESCRIBE `healthcareproj`.`healthcare_dataset`

SET SQL_SAFE_UPDATES = 0;


UPDATE `healthcareproj`.`healthcare_dataset`
SET `Date of Admission` = STR_TO_DATE(`Date of Admission`, '%m/%d/%Y');

UPDATE `healthcareproj`.`healthcare_dataset`
SET `Discharge Date` = STR_TO_DATE(`Discharge Date`, '%m/%d/%Y');

ALTER TABLE `healthcareproj`.`healthcare_dataset`
MODIFY COLUMN `Discharge Date` DATE;

ALTER TABLE `healthcareproj`.`healthcare_dataset`
MODIFY COLUMN `Date of Admission` DATE;

DESCRIBE `healthcareproj`.`healthcare_dataset`

SELECT `Medical Condition`, AVG(DATEDIFF(`Discharge Date`, `Date of Admission`)) AS Duration_of_Stay
FROM `healthcareproj`.`healthcare_dataset`
GROUP BY `Medical Condition`

-- How many patients were treated by each doctor in each year?  

SELECT Doctor, COUNT(Doctor) AS Number_Of_Patients, YEAR(`Date of Admission`) AS this_year
FROM `healthcareproj`.`healthcare_dataset`
GROUP BY Doctor, this_year
ORDER BY Number_Of_Patients DESC

-- How many patients have been treated for obesity in each hospital?

SELECT 
    CASE 
        WHEN Age BETWEEN 0 AND 9 THEN '0-9'
        WHEN Age BETWEEN 10 AND 19 THEN '10-19'
        WHEN Age BETWEEN 20 AND 29 THEN '20-29'
        WHEN Age BETWEEN 30 AND 39 THEN '30-39'
        WHEN Age BETWEEN 40 AND 49 THEN '40-49'
        WHEN Age BETWEEN 50 AND 59 THEN '50-59'
        WHEN Age BETWEEN 60 AND 69 THEN '60-69'
        WHEN Age BETWEEN 70 AND 79 THEN '70-79'
        WHEN Age BETWEEN 80 AND 89 THEN '80-89'
        WHEN Age >= 90 THEN '90+'
    END AS Age_range,
COUNT(*) AS patient_count
FROM `healthcareproj`.`healthcare_dataset`
GROUP BY Age_range
ORDER BY Age_range DESC
    



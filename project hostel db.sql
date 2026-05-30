--HOSTEL MANAGEMENT SYSTEM
CREATE TABLE Students (
    Student_ID INT PRIMARY KEY,
    Student_Name VARCHAR(100),
    Gender VARCHAR(10),
    Department VARCHAR(50),
    Year_of_Study INT,
    Contact_No VARCHAR(15)
);

SELECT * FROM Students;

COPY Students(Student_ID, Student_Name, Gender, Department,Year_of_Study, Contact_No)
FROM 'C:\Program Files\CSV_Files\sql files\hostel_data.csv'
DELIMITER','
CSV HEADER;

--QUERIS 
--1. COUNT TOTAL STUDENTS
SELECT COUNT(*) AS Total_Students
FROM Students;

--2. GENDER  
SELECT Gender,
       COUNT(*) AS Total_Students
FROM Students
GROUP BY Gender;

--3. Students by Department
SELECT Department,
       COUNT(*) AS Student_Count
FROM Students
GROUP BY Department
ORDER BY Student_Count DESC;

--4. STUDENTS BY YEAR 
SELECT Year_of_Study,
       COUNT(*) AS Student_Count
FROM Students
GROUP BY Year_of_Study
ORDER BY Year_of_Study;

--5. Male Students in Computer Science
SELECT *
FROM Students
WHERE Gender = 'Male'
AND Department = 'Computer Science';

--6. Students in Final Year
SELECT * 
FROM Students
WHERE Year_of_Study= 4;

--7. Department-wise Gender Distribution
SELECT Department,
       Gender,
       COUNT(*) AS Total
FROM Students
GROUP BY Department, Gender
ORDER BY Department;

--8. Top 5 Departments by Student Count
SELECT Department,
       COUNT(*) AS Total_Students
FROM Students
GROUP BY Department
ORDER BY Total_Students DESC
LIMIT 5;

--9. Percentage of Students by Department
SELECT Department,
       ROUND(
           COUNT(*) * 100.0 /
           (SELECT COUNT(*) FROM Students), 2
       ) AS Percentage
FROM Students
GROUP BY Department;

--10. Student Count by Year and Gender
SELECT Year_of_Study,
       Gender,
       COUNT(*) AS Total
FROM Students
GROUP BY Year_of_Study, Gender
ORDER BY Year_of_Study;

--11. Find Duplicate Contact Numbers
SELECT Contact_No,
       COUNT(*) AS Frequency
FROM Students
GROUP BY Contact_No
HAVING COUNT(*) > 1;

--12. Rank Departments by Student Count
SELECT Department,
       COUNT(*) AS Total_Students,
       RANK() OVER(
           ORDER BY COUNT(*) DESC
       ) AS Dept_Rank
FROM Students
GROUP BY Department;

--13. Running Total of Students by Year
SELECT Year_of_Study,
       COUNT(*) AS Students,
       SUM(COUNT(*)) OVER(
           ORDER BY Year_of_Study
       ) AS Running_Total
FROM Students
GROUP BY Year_of_Study;

--14. Percentage of Male vs Female Students
SELECT Gender,
       COUNT(*) AS Total,
       ROUND(
           COUNT(*) * 100.0 /
           (SELECT COUNT(*) FROM Students),2
       ) AS Percentage
FROM Students
GROUP BY Gender;

--15. Dashboard KPI Query
SELECT
    COUNT(*) AS Total_Students,
    COUNT(DISTINCT Department) AS Total_Departments,
    COUNT(DISTINCT Gender) AS Total_Genders,
    MAX(Year_of_Study) AS Highest_Year
FROM Students;
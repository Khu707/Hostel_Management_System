# Hostel_Management_System
Hostel Management System using SQL - 15 queries covering aggregations, window functions, and KPI dashboard
# 🏠 Hostel Management System – SQL Project

## 📌 Project Overview
A SQL-based data analysis project simulating a hostel student database.
Performed 15 analytical queries to extract insights on student demographics,
department distribution, and hostel KPIs.

## 🛠️ Tools Used
- PostgreSQL

## 📊 Table Structure
**Students Table**
| Column | Type |
|---|---|
| Student_ID | INT (Primary Key) |
| Student_Name | VARCHAR |
| Gender | VARCHAR |
| Department | VARCHAR |
| Year_of_Study | INT |
| Contact_No | VARCHAR |

## 🔍 Queries Covered
1. Total student count
2. Gender distribution
3. Students by department
4. Students by year of study
5. Filter by gender and department
6. Final year students
7. Department-wise gender distribution
8. Top 5 departments by student count
9. Percentage share by department
10. Student count by year and gender
11. Duplicate contact number detection
12. Department ranking using RANK() window function
13. Running total using SUM() OVER window function
14. Male vs Female percentage
15. Dashboard KPI summary query

## 💡 Key Highlights
- Used **Window Functions** (RANK, Running Total)
- Used **Subqueries** for percentage calculations
- Built a **KPI Dashboard Query** for quick insights

## 📁 Files
- `project_hostel_db.sql` – All table creation and query scripts

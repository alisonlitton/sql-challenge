-----------------------------------------------------
------------------DATA ANALYSIS----------------------
-----------------------------------------------------
---MAKE THE FOLLOWING QUERIES TO ANALYZIE THE DATA---
-----------------------------------------------------

--1. LIST THE FOLLOWING DETAILS OF EACH EMPLOYEE: EMP NUM, LAST NAME, FIRST NAME, SEX, SALARY
SELECT e.emp_no, e.last_name, e.first_name, e.sex, s.salary
FROM Employees e
JOIN Salaries s ON
e.emp_no = s.emp_no

--2. LIST FIRST NAME, LAST NAME, AND HIRE DATE OF EMPLOYEES HIRED IN 1986
SELECT first_name, last_name, hire_date
FROM Employees
WHERE extract(year FROM hire_date) = 1986;

--3. LIST THE MANAGER OF EACH DEPARTMENT WITH THE FOLLOWING INFORMATION: DEPT NUMBER, DEPT NAME, MANAGERS
--EMPLOYEE NUMBER, LAST NAME, FIRST NAME. 
SELECT dm.dept_no, d.dept_name, dm.emp_no, e.last_name, e.first_name
FROM Dept_manager dm
JOIN Departments d ON dm.dept_no = d.dept_no
JOIN Employees e ON dm.emp_no = e.emp_no

--4. LIST THE DEPT OF EACH EMPLOYEE WITH THE FOLLOWING INFORMATION: 
--EMP NUMBER, LAST NAME, FIRST NAME, DEPT NAME
SELECT e.emp_no, e.last_name, e.first_name, d.dept_name
FROM Departments d
JOIN Dept_emp de on d.dept_no = de.dept_no
JOIN Employees e on de.emp_no = e.emp_no

--5. LIST THE FIRST NAME, LAST NAME AND SEX FOR EMPLOYEES WHOSE FIRST NAME IS:
--'HERCULES' AND LAST NAME THAT STARTS WITH 'B'
SELECT e.first_name, e.last_name, e.sex
FROM Employees e 
WHERE first_name = 'Hercules' and last_name LIKE 'B%'

--6. LIST ALL EMPLOYEES IN THE SALES DEPT INCLUDING THEIR:
--EMPLOYEE NUMBER, LAST NAME, FIRST NAME, DEPT NAME
SELECT de.emp_no, e.last_name, e.first_name, d.dept_name
FROM Departments d 
JOIN Dept_emp de ON d.dept_no = de.dept_no
JOIN Employees e ON de.emp_no = e.emp_no
WHERE dept_name = 'Sales'

--7. LIST ALL THE EMPLOYESS IN THE SALES AND DEVELOPMENT DEPTS, INCLUDING
--THEIR EMPLOYEE NUMBER, LAST NAME, FIRST NAME AND DEPT NAME.
SELECT de.emp_no, e.last_name, e.first_name, d.dept_name
FROM Departments d 
JOIN Dept_emp de ON d.dept_no = de.dept_no
JOIN Employees e ON de.emp_no = e.emp_no
WHERE dept_name = 'Sales' OR dept_name = 'Development'

--8. IN DESCENDING ORDER, LIST THE FREQUENCY COUNT OF 
--EMPLOYEE LAST NAMES (HOW MANY EMPLOYEES SHARE EACH LAST NAME)
SELECT last_name, COUNT(last_name) AS "Last Name Count"
FROM Employees
GROUP BY last_name
ORDER BY "Last Name Count" DESC


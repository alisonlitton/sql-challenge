---------------------------------------
----------DATA ENGINEERING-------------
----CREATE TABLES TO STORE CSV DATA----
---IMPORT ALL CSV DATA FROM RESOURCES--
---------------------------------------

--DEPARTMENTS
CREATE TABLE Departments (
	dept_no VARCHAR(30) PRIMARY KEY NOT NULL,
	dept_name VARCHAR(30) NOT NULL
);

SELECT * FROM Departments

--TITLES
CREATE TABLE Titles (
	title_id VARCHAR(20) PRIMARY KEY NOT NULL,
	title VARCHAR(20) NOT NULL
);
SELECT * FROM Titles

--EMPLOYEES
CREATE TABLE Employees (
	emp_no INT PRIMARY KEY NOT NULL,
	emp_title_id VARCHAR(20) NOT NULL,
	birth_date DATE NOT NULL,
	first_name VARCHAR(30) NOT NULL,
	last_name VARCHAR(30) NOT NULL,
	sex VARCHAR(10) NOT NULL,
	hire_date DATE NOT NULL,
	FOREIGN KEY (emp_title_id) REFERENCES Titles(title_id)
);

SELECT * FROM Employees

--DEPT_MANAGER
CREATE TABLE Dept_manager(
	dept_no VARCHAR(10) NOT NULL,
	emp_no INT PRIMARY KEY NOT NULL,
	FOREIGN KEY (emp_no) REFERENCES Employees(emp_no)
);

SELECT * FROM Dept_manager

--DEPT_EMP
CREATE TABLE Dept_emp(
	emp_no INT NOT NULL,
	dept_no VARCHAR(20) NOT NULL,
	PRIMARY KEY (emp_no, dept_no),
	FOREIGN KEY (emp_no) REFERENCES Employees(emp_no)
);

SELECT * FROM Dept_emp

--SALARIES
CREATE TABLE Salaries (
	emp_no INT PRIMARY KEY NOT NULL,
	salary INT NOT NULL, 
	FOREIGN KEY (emp_no) REFERENCES Employees(emp_no)
);

SELECT * FROM Salaries

--------------------------------
--------MAC IMPORT DATA----------
---------------------------------
copy Departments
from '/tmp/departments.csv'
delimiter ','
CSV HEADER;

SELECT * FROM Departments
---------------------------------
COPY Titles
FROM '/TMP/titles.csv'
DELIMITER ','
CSV HEADER;

SELECT * FROM Titles
---------------------------------
COPY Employees
FROM '/TMP/employees.csv'
DELIMITER ','
CSV HEADER;

SELECT * FROM Employees
---------------------------------
COPY Dept_manager
FROM '/TMP/dept_manager.csv'
DELIMITER ','
CSV HEADER;

SELECT * FROM Dept_manager
---------------------------------
COPY Dept_emp
FROM '/TMP/dept_emp.csv'
DELIMITER ','
CSV HEADER;

SELECT * FROM Dept_emp
---------------------------------
COPY Salaries
FROM '/TMP/salaries.csv'
DELIMITER ','
CSV HEADER;

SELECT * FROM Salaries
-----------------------------------------------
--CHECK ONE MORE TIME TO MAKE SURE DATA IS IN--
-----------------------------------------------
SELECT * FROM Departments
SELECT * FROM Titles
SELECT * FROM Employees
SELECT * FROM Dept_manager
SELECT * FROM Dept_emp
SELECT * FROM Salaries
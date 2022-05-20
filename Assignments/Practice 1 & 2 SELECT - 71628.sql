-- Practice 1:
-- Tables: EMP, DEPT
-- 1. The following SELECT statement executes successfully:
--     	 SELECT ename, job, sal AS Sal
--    	 FROM emp;
--  ->   True
-- 2. The following SELECT statement executes successfully:
--    	 SELECT *
--   	 FROM Dept;
--  ->  True
-- 3. There are three coding errors in this statement. Can you identify them?
--  SELECT empno, ename
--  Sal x 12 ANNUAL SALARIES
--  FROM emp;
-- -> 
--  SELECT empno, ename,
--  Sal * 12 AS ANNUAL SALARIES
--  FROM emp;

CREATE DATABASE PracticeSelect;
USE PracticeSelect;

CREATE TABLE dept (
dept_no INT NOT NULL,
dept_name VARCHAR(14),
loc VARCHAR(13)
);
DESC dept;
-- 4. Show the structure of the DEPT table. Select all data from the table.
-- Name	Null?	Type
-- DEPTNO	NOT NULL	NUMBER(2)
-- DNAME		VARCHAR2(14)
-- LOC		VARCHAR2(13)

INSERT INTO dept VALUES(10,'Accounting','New York'),(20,'Research','Dallas'),(30,'Sales','Chicago'),(40,'Operations','Boston');
SELECT * FROM dept;

CREATE TABLE emp(
emp_no INT NOT NULL,
ename VARCHAR(10),
job VARCHAR(9),
mgr INT,
hiredate DATE,
sal DOUBLE(7,2),
comm DOUBLE(7,2),
dept_no INT NOT NULL
);
DESC emp;
-- 5. Show the structure of the EMP table. Create a query to display the EMPNO, ENAME, JOB, MGR, HIREDATE,   
--    SAL, COMM and DEPTNO for each employee, with employee name  appearing first. Provide an alias   
--    STARTDATE for the HIREDATE column. 
-- Name        	Null?    	Type
--  EMPNO         	NOT NULL 	NUMBER(4)
--  ENAME        	 	VARCHAR2(10)
--  JOB           	 	VARCHAR2(9)
--  MGR         	 	NUMBER(4)
--  HIREDATE   	 	DATE
--  SAL          	 	NUMBER(7,2)
--  COMM        	 	NUMBER(7,2)
--  DEPTNO      	 NOT NULL 	NUMBER(2)

INSERT INTO emp VALUES(7839,'KING','PRESIDENT',null,'1981-11-17',5000,null,10),
(7698,'BLAKE','MANAGER',7839,'1981-05-01',2850,null,30),
(7782,'CLARK','MANAGER',7839,'1981-06-09',2450,null,10),
(7566,'JONES','MANAGER',7839,'1981-04-02',2975,null,20),
(7654,'MARTIN','SALESMAN',7698,'1981-02-20',1600,1400,30),
(7499,'ALLEN','SALESMAN',7698,'1981-09-28',1250,300,30),
(7844,'TURNER','SALESMAN',7698,'1981-09-08',1500,null,30),
(7900,'JAMES','CLERK',7698,'1981-12-03',950,null,30),
(7521,'WARD','SALESMAN',7698,'1981-02-22',1250,500,30),
(7902,'FORD','ANALYST',7566,'1981-12-03',3000,null,20),
(7369,'SMITH','CLERK',7902,'1980-12-17',800,null,20),
(7788,'SCOTT','ANALYST',7566,'1982-12-09',3000,null,20),
(7876,'ADAMS','CLERK',7788,'1983-01-12',1100,null,20),
(7934,'MILLER','CLERK',7782,'1982-01-23',1300,null,10)
;

SELECT ename,emp_no,job,mgr,hiredate as startdate,sal,comm,dept_no 
FROM emp;

-- 6. Create a query to display unique job  from the EMP table.

SELECT DISTINCT job FROM emp ORDER BY job ASC;

-- 7. In question no. 5 Name the column headings: EMP #, Employee, Job Title, and Hire Date, respectively.     
--   Run your query again.

ALTER TABLE emp CHANGE `EMP#` `EMP_NO` INT;
ALTER TABLE emp CHANGE  `ename` `EMPLOYEE` VARCHAR(10);
ALTER TABLE emp CHANGE `Job Title` `JobTitle` VARChAR(9);
ALTER TABLE emp CHANGE `Hire Date` `HireDate` DATE;

SELECT * FROM emp;

-- Practice 2
-- 1.Create a query to display the name and salary of employees earning more than 2,000. from EMP table

SELECT Employee,sal as Salary FROM emp WHERE sal > 2000;

-- 2. Create a query to display the employee name and department number for employee number 7902.

SELECT Employee 'Employee Name',dept_no FROM emp WHERE EMP_NO= 7902; 


-- 3. Display the name and salary for all employees whose salary is not in the range of 2,000 and 5,000.

SELECT Employee,sal as Salary FROM emp WHERE sal NOT BETWEEN 2000 AND 5000;


-- 4. Display the employee  name, job, and Hiredate of employees hired between February 20, 1981, and May   
--     1, 1981. Order the query in ascending order by Hiredate.

SELECT Employee,JobTitle,HireDate FROM emp 
WHERE HireDate BETWEEN '1981-02-20' AND '1981-05-01' 
ORDER BY HireDate ASC;


-- 5. Display the  name and department number of all employees in departments 10 and 30 in alphabetical   
--     order by name.

SELECT Employee,dept_no FROM emp
WHERE dept_no = 10 OR dept_no =30
ORDER BY Employee ;

-- 6. list the name and salary of employees who earn between 2,000 and 3,000, and are in department 10 or   
--     30. Label the columns Employee and Monthly Salary, respectively

SELECT Employee,sal as Salary FROM emp
WHERE sal BETWEEN 2000 AND 3000 AND  dept_no IN(10,30);

-- 7. Display the name and hire date of every employee who was hired in 1981.

SELECT Employee,HireDate FROM emp
WHERE YEAR(HireDate)=1981;

-- 8. Display the name and job title of all employees who do not have a manager.

SELECT Employee,JobTitle FROM emp
WHERE mgr IS NULL;

-- 9. Display the  name, salary, and commission for all employees who earn commissions. Sort data in  
--     descending order of salary and commissions.

SELECT Employee,sal as Salary,comm as Commission FROM emp
WHERE comm IS NOT NULL ORDER BY sal DESC;

-- 10. Display the  names of all employees where the third letter of the name is an A.

SELECT Employee FROM emp
WHERE EMployee LIKE '__a%';

-- 11. Display the name of all employees who have an  A and an E in their last name.

SELECT Employee FROM emp
WHERE EMployee LIKE '%a%e%';

-- 12. Display the  name, job, and salary for all employees whose job is sales man or clerk and whose salary is not equal to 1,600, 8000, or 1,300.

SELECT Employee,JobTitle,sal as Salary FROM emp
WHERE sal NOT IN(1600,8000,1300) AND JobTitle IN('SALESMAN','CLERK');

-- 13. Display the name, salary, and commission for all employees whose commission amount is 20% greater than salary

SELECT Employee,sal as Salary,comm as Commmission FROM emp
WHERE comm  >  (sal*20/100) ;


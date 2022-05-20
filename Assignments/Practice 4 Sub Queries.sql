USE PracticeSelect;
SHOW TABLES;

-- 1.	Write a query to display the name and hire date of any employee in the same department as SMITH. Exclude SMITH.

-- ENAME      	HIREDATE
-- JONES      	02-APR-81
-- FORD       	03-DEC-81
-- SCOTT      	09-DEC-82
-- ADAMS      	12-JAN-83

SELECT EMPLOYEE,HireDate FROM emp
WHERE dept_no=(SELECT dept_no FROM emp WHERE EMPLOYEE ='SMITH') AND EMPLOYEE NOT IN('SMITH');

--  2.  Create a query to display the employee numbers and last names of all employees who earn more than the average salary. Sort the results in ascending order of salary. 	
-- EMPNO	 ENAME
-- 7782	CLARK 
-- 7698	BLAKE
-- 7566	JONES
-- 7902	FORD
-- 7788	SCOTT
-- 7839	KING

SELECT EMP_NO,EMPLOYEE FROM emp
WHERE sal > (SELECT AVG(sal) FROM emp)
ORDER BY sal ;

-- 3. Write a query that displays the employee numbers and names of all employees who work in a department with any employee whose name contains a U.
-- EMPNO	ENAME
-- 7698	BLAKE
-- 7654	MARTIN
-- 7499	ALLEN
-- 7844	TURNER
-- 7900	JAMES
-- 7521	WARD

SELECT EMP_NO,EMPLOYEE FROM emp
WHERE dept_no = (SELECT dept_no FROM emp WHERE EMPLOYEE LIKE '%U%');

	
-- 4. Display the last name and salary of every employee who reports to BLAKE.
-- ENAME         	    SAL
-- MARTIN	1250
-- ALLEN	1600
-- TURNER	1500
-- JAMES	950
-- WARD	1250

SELECT EMPLOYEE,sal FROM emp
WHERE mgr= (SELECT EMP_NO FROM emp WHERE EMPLOYEE='BLAKE');

-- 5. Display the department number, name, and job ID for every employee in the sales department.
-- DEPTNO	 ENAME  	    JOB
-- 30	BLAKE	MANAGER
-- 30	MARTIN	SALESMAN
-- 30	ALLEN	SALESMAN
-- 30	TURNER	SALESMAN
-- 30	JAMES	CLERK
-- 30	WARD	SALESMAN

SELECT dept_no,EMPLOYEE,JobTitle FROM emp
WHERE dept_no=(SELECT DISTINCT dept_no FROM emp WHERE JobTitle LIKE 'SALES%');

-- 6. Modify the query in 5th exercise  to display the employee numbers, last names,
--  and salaries of all employees who earn more than the average salary and who work in a department with any employee with a ‘A’ in their name.
-- EMPNO 	ENAME     	    SAL
-- 7839	KING          	5000
-- 7782	CLARK	2450
-- 7566	JONES	2975
-- 7788	SCOTT	3000
-- 7902	FORD	3000
-- 7698	BLAKE	2850

SELECT EMP_NO,EMPLOYEE,sal FROM emp
WHERE sal > (SELECT AVG(sal) FROM emp WHERE EMPLOYEE LIKE '%A%');


SELECT * FROM emp;
SELECT * FROM dept;

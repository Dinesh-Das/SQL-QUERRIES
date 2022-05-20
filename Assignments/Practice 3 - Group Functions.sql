USE PracticeSelect;
SHOW TABLES;

-- 4. Display the highest, lowest, sum, and average salary of all employees. Label the columns
-- Maximum,  Minimum, Sum, and Average, respectively. Round  your results to the nearest whole number. 
--   MINIMUM    MAXIMUM        SUM    AVERAGE
-- --------- ---------- ---------- -----------------------------
--       800           5000           29025       2073

SELECT ROUND(MIN(sal)) Minimum,ROUND(MAX(sal)) Maximum,ROUND(SUM(sal)) Sum,ROUND(AVG(sal)) Average FROM emp; 

-- 5. Modify the query in 4 exercise to display the minimum, maximum, sum, and average salary for
--     each job type.
-- MINIMUM    MAXIMUM        SUM    AVERAGE
-- ------- ---------- ---------- ------------------------------------
--    3000      	 3000       	6000       3000
--     800       	1300       	4150       1038
--    2450       	2975       	8275       2758
--    5000       	5000       	5000       5000
--    1250       	1600       	5600       1400

SELECT ROUND(MIN(sal)) Minimum,ROUND(MAX(sal)) Maximum,ROUND(SUM(sal)) Sum,ROUND(AVG(sal)) Average 
FROM emp GROUP BY JobTitle ORDER BY JobTitle; 

-- 6. Write a query to display the number of people with the same job.
-- JOB         COUNT(*)
-- --------- ----------
-- ANALYST         2
-- CLERK             4
-- MANAGER        3
-- PRESIDENT      1
-- SALESMAN       4

SELECT DISTINCT JobTitle,COUNT(JobTitle) 
FROM emp GROUP BY JobTitle ORDER BY JobTitle; 

-- 7.  Determine the number of managers without listing them. Label the column Number of
-- Managers. 
-- NUMBER OF MANAGERS
-- ------------------
--                  6

SELECT COUNT(DISTINCT mgr) AS Number_of_Managers FROM emp ;

-- . Write a query that displays the difference between the highest and lowest salaries. Label the
--      column DIFFERENCE.
-- DIFFERENCE
-- ----------
--    	   4200

SELECT MAX(sal)-MIN(sal) AS Difference FROM emp;

-- 9. Display the manager number and the salary of the lowest paid employee for that manager.
--     Exclude anyone whose manager is not known. Exclude any groups where the minimum
--     salary is 1,000 or less. Sort the output in descending order of salary.
--   MGR   MIN(SAL)
-- ----- ----------
--  7566       3000
--  7839       2450
--  7782       1300
--  7788       1100

SELECT mgr,MIN(sal) FROM emp 
WHERE mgr IS NOT NULL 
GROUP BY mgr HAVING MIN(sal) > 1000
ORDER BY MIN(sal) DESC;


-- 10. Create a query that will display the total number of employees and, of that total, the number   
--       of employees hired in 1981, 1983 and 1980. Create appropriate column headings.

--      TOTAL       1983       1982       1980
--       ---------- ---------- ----------   ----------
--         14               1          2              1

SELECT COUNT(DISTINCT EMP_No) AS Total,
(SELECT COUNT(DISTINCT EMP_NO) FROM emp WHERE HireDate LIKE '1983%') AS '1983',
(SELECT COUNT(DISTINCT EMP_NO) FROM emp WHERE HireDate LIKE '1982%') AS '1982',
(SELECT COUNT(DISTINCT EMP_NO) FROM emp WHERE HireDate LIKE '1980%') AS '1980'
FROM emp;

-- 11. Create a matrix query to display the job, the salary for that job based on department number,   
--      and the total salary for that job, for departments 10 ,20 and 30,  giving each column an    
--      Appropriate heading.
-- JOB         	 Dept 10    Dept 20    Dept 30      Total
-- --------- 	---------   ----------     ----------   ----------
-- ANALYST                          6000                  	6000
-- CLERK                1300       1900        950       	4150
-- MANAGER           2450       2975       2850       	8275
-- PRESIDENT         5000                                	5000
-- SALESMAN                              	       5600       	5600

-- SELECT DISTINCT JobTitle AS JOB,dept_no,sum(sal) AS TOTAL
-- FROM emp WHERE dept_no IN (10,20,30) 
-- GROUP BY (JobTitle) ORDER BY JobTitle ; 

SELECT DISTINCT JobTitle AS "JOB", SUM(CASE dept_no WHEN 10 THEN sal END) as "DEPT 10",SUM(CASE dept_no WHEN 20 THEN sal END) as "DEPT 20",
SUM(CASE dept_no WHEN 30 THEN sal END) as "DEPT 30", SUM(sal) as "TOTAL" FROM emp GROUP BY JobTitle ORDER BY JobTitle ASC;

SELECT * FROM dept;
SELECT * FROM emp;

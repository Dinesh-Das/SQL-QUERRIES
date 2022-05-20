CREATE DATABASE LMS;
USE LMS;

 -- DROP DATABASE LMS;
 
CREATE TABLE MEMBERS (
MEMBER_ID VARCHAR(10),
MEMBER_NAME VARCHAR(30) NOT NULL,
CITY VARCHAR(20),
DATE_REGISTER DATE NOT NULL,
DATE_EXPIRE DATE,
MEMBERSHIP_STATUS VARCHAR(15) NOT NULL,
CONSTRAINT MEMBER_ID_PK PRIMARY KEY (MEMBER_ID)
);

CREATE TABLE FINE_DETAILS (
FINE_RANGE VARCHAR(3),
FINE_AMOUNT  Numeric(10,2) NOT NULL,
CONSTRAINT FR_PK PRIMARY KEY(FINE_RANGE)
);

CREATE TABLE SUPPLIERS_DETAILS (
SUPPLIER_ID VARCHAR(3),
SUPPLIER_NAME VARCHAR(30) NOT NULL,
ADDRESS VARCHAR(50),
CONTACT Numeric(10) NOT NULL,
EMAIL VARCHAR(15) NOT NULL,
CONSTRAINT SUPPLIER_ID_PK PRIMARY KEY (SUPPLIER_ID)
);

CREATE TABLE BOOK_DETAILS(
BOOK_CODE VARCHAR(10),
BOOK_TITLE VARCHAR(50) NOT NULL,
CATEGORY VARCHAR(15) NOT NULL,
AUTHOR VARCHAR(30) NOT NULL,
PUBLICATION VARCHAR(30),
PUBLISH_DATE DATE,
BOOK_EDITION Numeric(2),
PRICE Numeric(8,2) NOT NULL,
RACK_NUM VARCHAR(3),
DATE_ARRIVAL DATE NOT NULL,
SUPPLIER_ID VARCHAR(3) NOT NULL,
CONSTRAINT BOOK_CODE_PK PRIMARY KEY (BOOK_CODE),
CONSTRAINT SUPPLIER_ID_FK FOREIGN KEY(SUPPLIER_ID) REFERENCES SUPPLIERS_DETAILS(SUPPLIER_ID)
);


CREATE TABLE BOOK_ISSUE(
BOOK_ISSUE_NO Numeric,
MEMBER_ID VARCHAR(10) NOT NULL,
BOOK_CODE VARCHAR(10) NOT NULL,
DATE_ISSUE DATE NOT NULL,
DATE_RETURN DATE NOT NULL,
DATE_RETURNED DATE NOT NULL,
BOOK_ISSUE_STATUS VARCHAR(20) NOT NULL,
FINE_RANGE VARCHAR(3),
CONSTRAINT BOOK_ID_PK PRIMARY KEY (BOOK_ISSUE_NO),
CONSTRAINT MEMBER_ID_FK FOREIGN KEY (MEMBER_ID) REFERENCES MEMBERS(MEMBER_ID),
CONSTRAINT BOOK_CODE_FK FOREIGN KEY (BOOK_CODE) REFERENCES BOOK_DETAILS(BOOK_CODE),
CONSTRAINT FINE_RANGE_FK FOREIGN KEY (FINE_RANGE) REFERENCES FINE_DETAILS(FINE_RANGE)
);


/* ** Insert values in table called LMS_MEMBERS ** */

Insert into MEMBERS
Values('LM001', 'AMIT','CHENNAI','2012-02-12','2013-02-11','Temporary');

Insert into MEMBERS
Values('LM002', 'ABDHUL','DELHI', '2012-04-10','2013-04-09','Temporary');

Insert into MEMBERS
Values('LM003', 'GAYAN', 'CHENNAI','2013-05-12','2013-05-14', 'Permanent');

Insert into MEMBERS
Values('LM004', 'RADHA', 'CHENNAI', '2012-04-22','2013-04-21','Temporary');

Insert into MEMBERS
Values('LM005', 'GURU','BANGALORE', '2012-03-20','2013-03-29','Temporary');

Insert into MEMBERS
Values('LM006','MOHAN', 'CHENNAI', '2012-04-12','2013-04-12','Temporary');


/* ** Insert values in table called LMS_SUPPLIERS_DETAILS ** */


Insert into  SUPPLIERS_DETAILS 
Values ('S01','SINGAPORE SHOPPEE', 'CHENNAI', 9894123555,'sing@gmail.com');


Insert into  SUPPLIERS_DETAILS 
Values ('S02','JK Stores', 'MUMBAI', 9940123450 ,'jks@yahoo.com');


Insert into  SUPPLIERS_DETAILS 
Values ('S03','ROSE BOOK STORE', 'TRIVANDRUM', 9444411222,'rose@gmail.com');


Insert into SUPPLIERS_DETAILS 
Values ('S04','KAVARI STORE', 'DELHI', 8630001452,'kavi@redif.com');


Insert into  SUPPLIERS_DETAILS 
Values ('S05','EINSTEN BOOK GALLARY', 'US', 9542000001,'eingal@aol.com');


Insert into  SUPPLIERS_DETAILS 
Values ('S06','AKBAR STORE', 'MUMBAI',7855623100 ,'akbakst@aol.com');


/* ** Insert values in table called LMS_FINE_DETAILS ** */


Insert into FINE_DETAILS Values('R1', 20);


insert into FINE_DETAILS Values('R2', 50);


Insert into FINE_DETAILS Values('R3', 75);


Insert into FINE_DETAILS Values('R4', 100);


Insert into FINE_DETAILS Values('R5', 150);


Insert into FINE_DETAILS Values('R6', 200);



/* ** Insert values in table called LMS_BOOK_DETAILS ** */


Insert into BOOK_DETAILS
Values('BL000001', 'Java How To Do Program', 'JAVA', 'Paul J. Deitel', 'Prentice Hall', '1999-12-10', 6, 600.00, 'A1','2011-05-10', 'S01');


Insert into BOOK_DETAILS
Values('BL000002', 'Java: The Complete Reference ', 'JAVA', 'Herbert Schildt',  'Tata Mcgraw Hill ','2011-10-10', 5, 750.00, 'A1','2011-05-10', 'S03');


Insert into BOOK_DETAILS 
Values('BL000003', 'Java How To Do Program', 'JAVA', 'Paul J. Deitel', 'Prentice Hall','1999-12-10',6, 600.00, 'A1', '2012-5-12', 'S01');


Insert into BOOK_DETAILS
Values('BL000004', 'Java: The Complete Reference ', 'JAVA', 'Herbert Schildt', 'Tata Mcgraw Hill ','2011-10-10', 5, 750.00, 'A1','2012-05-12', 'S01');


Insert into BOOK_DETAILS 
Values('BL000005', 'Java How To Do Program', 'JAVA', 'Paul J. Deitel',  'Prentice Hall','1999-12-10', 6, 600.00, 'A1', '2012-05-12', 'S01');


Insert into BOOK_DETAILS
Values('BL000006', 'Java: The Complete Reference ', 'JAVA', 'Herbert Schildt', 'Tata Mcgraw Hill ', '2011-10-10', 5, 750.00, 'A1','2012-05-12', 'S03');


Insert into BOOK_DETAILS 
Values('BL000007', 'Let Us C', 'C', 'Yashavant Kanetkar ', 'BPB Publications', '2010-12-11',  9, 500.00 , 'A3', '2010-01-03','S03');


Insert into BOOK_DETAILS 
Values('BL000008', 'Let Us C', 'C', 'Yashavant Kanetkar ','BPB Publications', '2010-12-11',  9, 500.00 , 'A3','2010-01-03', 'S04');
  
 
/* ** Insert values in table called LMS_BOOK_ISSUE ** */


Insert into BOOK_ISSUE 
Values (001, 'LM001', 'BL000001',  '2012-05-01', '2012-05-16',   '2012-05-16' ,'N', 'R1');


Insert into BOOK_ISSUE 
Values (002, 'LM002', 'BL000002',  '2012-04-20', '2012-05-06',  '2012-05-04' , 'N', 'R2');


Insert into BOOK_ISSUE
Values (003, 'LM003', 'BL000007',  '2012-04-01', ' 2012-04-16',  ' 2012-04-20' ,'Y','R1');


Insert into BOOK_ISSUE 
Values (004, 'LM004', 'BL000005',  ' 2012-04-01', ' 2012-04-16' , ' 2012-04-20',  'Y', 'R1');


Insert into BOOK_ISSUE 
Values (005, 'LM005', 'BL000008',  ' 2012-03-30' ,  ' 2012-04-15', ' 2012-04-20',  'N', 'R2');


-- 1. Write a query to display the book code, book title and availability status of the ‘JAVA’ books whose 
-- edition is "5”. Show the availability status with alias name “AVAILABILITYSTATUS”.
-- Hint: Book availability status can be fetched from “BOOK_ISSUE_STATUS” column of 
-- LMS_BOOK_ISSUE table. 

SELECT B.BOOK_CODE,B.BOOK_TITLE,BI.BOOK_ISSUE_STATUS AS "AVAILABILITYSTATUS" FROM BOOK_DETAILS B 
JOIN BOOK_ISSUE BI ON B.BOOK_CODE=BI.BOOK_CODE 
WHERE B.CATEGORY="JAVA" AND B.BOOK_EDITION=5 ;

-- 2. Write a query to display the book code, book title of the books which are issued on the date "1st April 
-- 2012".

SELECT B.BOOK_CODE,B.BOOK_TITLE FROM BOOK_DETAILS B 
JOIN BOOK_ISSUE BI ON B.BOOK_CODE=BI.BOOK_CODE
WHERE BI.DATE_ISSUE ='2012-04-01'; 

SELECT BOOK_CODE,BOOK_TITLE FROM BOOK_DETAILS WHERE BOOK_CODE IN (SELECT BOOK_CODE FROM BOOK_ISSUE WHERE DATE_ISSUE  ='2012-04-01' );


-- 3. Write a query to display the total number of Java books available in library with alias name 
-- ‘NO_OF_BOOKS’

SELECT COUNT(*) NO_OF_BOOKS FROM BOOK_DETAILS WHERE CATEGORY='JAVA';

-- 4. Write a query to display the average price of books which is belonging to ‘JAVA’ category with alias 
-- name “AVERAGEPRICE”.

SELECT AVG(PRICE) AVERAGEPRICE FROM BOOK_DETAILS WHERE CATEGORY="JAVA";

select * from book_details;

select * from members;

select * from book_issue;

select * from Suppliers_details;

select * from fine_details;



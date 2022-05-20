-- Create the following tables for HMS(Hospital Management System):
-- The Doctor_master table contains information about doctors in the hospital.
-- DOCTOR_MASTER(doctor_id,doctor_name,dept)
-- Column Name	Data type & Data size	Description
-- doctor_id	Varchar(15)	doctorid must be unique and not null
-- doctor_name	Varchar2(15)	Doctor name should be not null
-- Dept	Varchar2(15)	Dept name should be not null

CREATE DATABASE HospitalManagementSystem;
USE HospitalManagementSystem;
SHOW DATABASES;
CREATE TABLE Doctor_Master (
doctor_id VARCHAR(15),
doctor_name VARCHAR(25) NOT NULL,
dept VARCHAR(15) NOT NULL,
CONSTRAINT doctor_id_pk PRIMARY KEY (doctor_id)
);
INSERT INTO Doctor_Master (doctor_id,doctor_name,dept)
VALUES ('D0001','Ram','ENT'),('D0002','Rajan','ENT'),('D0003','Smita','EYE'),
('D0004','Bhavan','Surgery'),('D0005','Sheela','Surgery'),('D0006','Nethra','Surgery');


-- The room_master table contains information about room availability in the hospital.
-- ROOM_MASTER(room_no, room_type, status)
-- Column Name	Data type & Data size	Description
-- room_no	Varchar(15)	roomno must be unique and not null
-- room_type	Varchar2(15)	room type name should be not null
-- status	Varchar2(15)	status name should be not null

CREATE TABLE Room_Master (
room_no VARCHAR(15),
room_type VARCHAR(15) NOT NULL,
status VARCHAR(15) NOT NULL,
CONSTRAINT room_no_pk PRIMARY KEY(room_no)
);
INSERT INTO Room_Master VALUES('R0001','AC','occupied'),('R0002','Suite','vacant'),('R0003','NonAC','vacant'),
('R0004','NonAC','occupied'),('R0005','AC','vacant'),('R0006','AC','occupied');

-- The patient_master table contains information about patients in the hospital.
-- PATIENT_MASTER(pid, name,age,weight,gender,address,phoneno,disease,doctorid)
-- Column Name	Data type & Data size	Description
-- pid	Varchar(15)	pid must be unique and not null
-- name	Varchar2(15)	name should be not null
-- age	number(15)	age should be not null
-- Weight	number(15)	weight should be not null
-- Gender	Varchar(10)	gender should be not null
-- Address	Varchar(50)	address should be not null
-- phoneno	varchar(10)	phoneno should be not null
-- Disease	Varchar(50)	disease should be not null
-- Doctor_id	Varchar(5)	Must be an existing doctor

CREATE TABLE Patient_Master (
pid VARCHAR(15),
name VARCHAR(25) NOT NULL,
age INT NOT NULL,
weight INT NOT NULL,
gender VARCHAR(10) NOT NULL,
address VARCHAR(50) NOT NULL,
phoneno VARCHAR(10) NOT NULL,
disease VARCHAR(50) NOT NULL,
doctor_id VARCHAR(5),
CONSTRAINT pid_pk PRIMARY KEY (pid),
CONSTRAINT doctor_id_fk FOREIGN KEY (doctor_id) REFERENCES Doctor_Master(doctor_id)
);

INSERT INTO Patient_Master VALUES('P0001','Gita',35,65,'F','Chennai','9867145678','EYE Infection','D0003'),
('P0002','Ashish',40,70,'M','Delhi','9845645678','Asthma','D0003'),
('P0003','Radha',25,60,'F','Chennai','9867145658','Pain in heart','D0005'),
('P0004','Chandra',28,55,'F','Bangalore','9978675567','Asthma','D0001'),
('P0005','Goyal',42,65,'M','Delhi','8967533223','Pain in Stomach','D0004');

-- The room_allocation table contains information about the allocation of room to the patients in the hospital.
-- ROOM_ALLOCATION(room_no, pid, admission_date,release_date)
-- Column Name	Data type & Data size	Description
-- room_no	Varchar(15)	Must be an existing rooms
-- pid	Varchar2(15)	Must be an existing patients
-- admission_date	date	Admission date should be not null
-- Release_date	date	

CREATE TABLE Room_Allocation (
room_no VARCHAR(15),
pid VARCHAR(15),
admission_date DATE NOT NULL,
release_date DATE,
CONSTRAINT room_no_fk FOREIGN KEY (room_no) REFERENCES Room_Master(room_no),
CONSTRAINT pid_fk FOREIGN KEY (pid) REFERENCES Patient_Master(pid)
);

INSERT INTO Room_Allocation VALUES ('R0001','P0001','2016-10-15','2016-10-26'),('R0002','P0002','2016-11-15','2016-11-26'),
('R0002','P0003','2016-12-01','2016-12-30'),('R0004','P0001','2017-01-01','2017-01-30');

SELECT * FROM Doctor_Master;
SELECT * FROM Room_Master;
SELECT * FROM Patient_Master;
SELECT * FROM Room_Allocation;

-- Query #1: Display the patients who were admitted in the month of january.

SELECT * FROM Patient_Master p
JOIN  Room_Allocation r ON p.pid=r.pid
Where MONTH(r.admission_date)=01 ;

-- Selecting Month
-- SELECT * FROM Room_Allocation WHERE MONTH(admission_date)=01;

-- Query #2: Display the female patient who is not suffering from ashma

SELECT * FROM Patient_Master WHERE gender='F' AND disease !='Asthma';

-- Query #3: Count the number of male and female patients.
SELECT SUM(gender='F') as Female, SUM(gender='M') as Male FROM Patient_Master;

-- Query #4: Display the patient_id,patient_name, doctor_id, doctor_name, room_no, room_type and admission_date.

SELECT  p.pid as patient_id,p.name as patient_name, d.doctor_id, d.doctor_name, r.room_no, r.room_type,ra.admission_date
FROM Patient_Master p
JOIN Doctor_Master d ON p.doctor_id = d.doctor_id 
JOIN Room_Allocation ra ON ra.pid = p.pid 
JOIN Room_Master r ON ra.room_no = r.room_no ;

-- Query #5: Display the room_no which was never allocated to any patient.

SELECT room_no,room_type 
FROM Room_Master
WHERE room_no NOT IN(SELECT room_no FROM Room_Allocation);

-- Query #6: Display the room_no, room_type which are allocated more than once.

SELECT room_no,room_type FROM Room_Master
WHERE room_no IN(select room_no FROM Room_Allocation GROUP BY room_no HAVING COUNT(room_no) >1);

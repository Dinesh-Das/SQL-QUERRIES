-- Create the following tables for FMS(Flight Management System):

CREATE DATABASE FlightManagementSystem;
USE FlightManagementSystem;

-- The Passenger table contains information about passengers in the flight.
-- Passenger(passenger_id,passenger_name,passenger_email,passenger_dob)
-- Column Name	Data type & Data size	Description
-- passenger _id	Varchar2(15)	passenger id must be unique and not null
-- passenger_name	Varchar2(15)	passenger name should be not null
-- passenger_email	Varchar2(15)	passenger email should be not null
-- Passenger_dob	date	passenger dob should be not null

CREATE TABLE Passenger (
passenger_id VARCHAR(15),
passenger_name VARCHAR(15) NOT NULL,
passenger_email VARCHAR(25) NOT NULL,
passenger_dob DATE NOT NULL,
CONSTRAINT passenger_id_pk PRIMARY KEY (passenger_id)
);

INSERT INTO Passenger VALUES('P0001','Ram','Ram@gmail.com','1980-12-01'),('P0002','Rajan','Rajan@gmail.com','1939-11-11'),
('P0003','Smita','Smita@gmail.com','1988-02-06'),('P0004','Bhavan','Bhavan@gmail.com','1973-09-18'),
('P0005','Sheela','Sheela@gmail.com','1976-05-09'),('P0006','Nethra','Nethra@gmail.com','1955-10-08');

-- The Flight table contains information about flight.
-- Flight(flightid, flightsource, status)
-- Column Name	Data type & Data size	Description
-- flightid	Varchar2(15)	flightid must be unique and not null
-- flightsource	Varchar2(15)	flightsource  should be not null
-- flightdest	Varchar2(15)	flightdest should be not null
-- flightdate	Varchar2(15)	Flightdate should be not null
-- flightseat	Varchar2(15)	Flightseat should be not null
-- ticketcost	Varchar2(15)	Ticketcost should be not null

CREATE TABLE Flight(
flight_id VARCHAR(15),
flight_source VARCHAR(15) NOT NULL,
flight_dest VARCHAR(15) NOT NULL,
flight_date VARCHAR(15) NOT NULL,
flight_seat VARCHAR(15) NOT NULL,
flight_cost VARCHAR(15) NOT NULL,
CONSTRAINT flight_id_pk PRIMARY KEY (flight_id)
);

INSERT INTO Flight VALUES ('F0001','Kolkatta','Hyderabad','2012-12-01','100','2000'),
('F0002','Chennai','Hyderabad','2012-12-02','100','3000'),
('F0003','Pune','Kolkatta','2012-12-02','100','2500'),
('F0004','Bangalore','Pune','2012-11-18','100','2300'),
('F0005','Hyderabad','Bangalore','2012-04-09','100','2600'),
('F0006','Pune','Hyderabad','2012-08-08','100','3500'),
('F0007','Pune','Kolkatta','2012-12-04','100','2900'),
('F0008','Kolkatta','Hyderabad','2012-12-06','100','3500');

-- The Booking table contains booking information of the flight.
-- Booking (booking_id, flight_id,bookdate)
-- Column Name	Data type & Data size	Description
-- booking_id	Varchar(15)	booking_id must be unique and not null
-- flight_id	Varchar2(15)	Must be an existing flights
-- bookdate	number(15)	bookdate should be not null

CREATE TABLE Booking (
booking_id VARCHAR(15),
flight_id VARCHAR(15),
bookdate DATE NOT NULL,
CONSTRAINT booking_id_pk PRIMARY KEY (booking_id),
CONSTRAINT flight_id_fk FOREIGN KEY (flight_id) REFERENCES Flight(flight_id)
);

INSERT INTO Booking VALUE('B0001','F0001','2012-12-01'),('B0002','F0004','2012-12-02'),('B0003','F0005','2012-12-03'),
('B0004','F0003','2012-12-04'),('B0005','F0001','2012-12-02'),('B0006','F0004','2012-12-02'),('B0007','F0003','2016-12-02');

-- The Booking_details table contains booking information of the passenger in the flight.
-- Column Name	Data type & Data size	Description
-- Booking_id	Varchar(15)	Must be an existing booking id
-- passenger _id	Varchar2(15)	Must be an existing passenger

CREATE TABLE Booking_details (
booking_id VARCHAR(15),
passenger_id VARCHAR(15),
CONSTRAINT booking_id_fk FOREIGN KEY (booking_id) REFERENCES Booking(booking_id),
CONSTRAINT passenger_id_fk FOREIGN KEY (passenger_id) REFERENCES Passenger(passenger_id)
);

INSERT INTO Booking_details VALUES('B0001','P0001'),('B0001','P0002'),('B0001','P0003'),('B0002','P0004'),
('B0002','P0005'),('B0003','P0006'),('B0003','P0001'),('B0004','P0002'),('B0005','P0003');


SELECT * FROM Passenger;
SELECT * FROM Flight;
SELECT * FROM Booking;
SELECT * FROM Booking_details;

-- Query #1: Display passenger name who has a ‘e’ as second letter in their name.

SELECT passenger_name FROM Passenger WHERE passenger_name LIKE '_e%';

-- Query #2: Display the name of the youngest passenger. 

SELECT * FROM Passenger WHERE passenger_dob = (SELECT MAX(passenger_dob) FROM Passenger);

-- Query #3: Display the number of flights leaving Kolkata. 

SELECT COUNT(*) NO_OF_Flights FROM FLight WHERE flight_source="Kolkatta";

-- Query #4: Display the passenger’s name having more than 1 booking.

SELECT p.passenger_name FROM Passenger p
JOIN Booking_Details b ON p.passenger_id = b.passenger_id
GROUP BY p.passenger_id HAVING COUNT(*)>1;

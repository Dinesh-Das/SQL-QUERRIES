use cinema_booking_system;

SELECT * FROM CUSTOMERS;
SELECT COUNT(*) FROM CUSTOMERS;
SELECT COUNT(first_name) FROM CUSTOMERS;

SELECT last_name,COUNT(*) FROM CUSTOMERS
GROUP BY last_name 
HAVING Count(*) >= 2
ORDER BY COUNT(*) DESC; 

SELECT COUNT(*) FROM CUSTOMERS WHERE last_name="Smith";
SELECT COUNT(*) FROM CUSTOMERS WHERE first_name IS NULL;


SELECT * FROM rooms;
SELECT SUM(no_seats) FROM rooms;
SELECT SUM(no_seats) FROM rooms WHERE id > 1;

SELECT * FROM films;
SELECT max(length_min) FROM films;
SELECT name,max(length_min) FROM films;
SELECT min(length_min) FROM films;


SELECT avg(length_min) FROM films;
SELECT avg(length_min) FROM films WHERE length_min > 120;

--  EXERCISE 1
SELECT * FROM bookings;
select * from screenings;

-- HOW MANY BOOKINGS DID CUSTOMER 10 MADE IN OCT 2017

SELECT COUNT(*) FROM bookings b
JOIN screenings s ON b.screening_id=s.id 
WHERE b.customer_id=10 and
s.start_time BETWEEN '2017-10-01' AND '2017-10-31';

--  COUNT THE NUMBER OF SCREENINGS OF BLADE RUNNER 2049 on OCT 2017
select * from screenings;
select * from films;

SELECT COUNT(*) FROM screenings s
JOIN films f ON s.film_id = f.id 
WHERE f.name="Blade Runner 2049";

-- COUNT THE TOTAL NUMBER OF UNIQUE CUSTOMERS who MADE BOOKING for OCT 2017
select * from customers;
select * from bookings;

SELECT COUNT(DISTINCT c.id) FROM customers c
JOIN bookings b ON c.id=b.customer_id;


SELECT COUNT(DISTINCT (customer_id)) FROM Bookings;

SELECT f.name,s.start_time,c.first_name,c.last_name,COUNT(b.id) FROM films f
JOIN screenings s ON f.id= s.film_id 
JOIN bookings b ON s.id=b.screening_id
JOIN customers c ON b.customer_id= c.id
GROUP BY f.name,c.last_name,c.first_name,s.start_time
ORDER BY s.start_time;


--  GROUP BY

select * from bookings;
select COUNT(id) FROM bookings;

select customer_id,count(id) from bookings
group by customer_id;

select customer_id,screening_id,count(id) from bookings
group by customer_id,screening_id;

select customer_id,screening_id,count(id) from bookings
group by customer_id,screening_id
having customer_id =10;

-- EXERCISSE 2 

-- select the customer id and count the number of reserved seats group by customers for oct 2017

SELECT b.customer_id, COUNT(rs.id) FROM bookings b 
JOIN reserved_seat rs ON b.id = rs.booking_id
GROUP BY b.customer_id;


--  SELECT THE FILM NAME and count number of screenings for each film whose length is 2hr long

SELECT f.name, f.length_min, COUNT(s.id) FROM films f
JOIN screenings s ON f.id = s.film_id 
GROUP BY f.name, f.length_min
HAVING f.length_min > 120;



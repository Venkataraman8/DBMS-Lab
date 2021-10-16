use mysampldb;
DROP TABLE ORDERR;
DROP TABLE CUSTOMER;

CREATE TABLE ORDERR
(
	OrderId INT PRIMARY KEY,
	CustomerID INT,
	OrderDate DATE
);

CREATE TABLE CUSTOMER
(
	CustomerId INT PRIMARY KEY,
	CustomerName VARCHAR(100),
	ContactName VARCHAR(100),
	Country VARCHAR(100)
);

-- 1)
INSERT INTO ORDERR
VALUES
	(10308, 2, '1996-09-18'),
	(10309, 37, '1996-09-19'),
	(10310, 77, '1996-09-20'),
	(10311, 4, '2019-02-20'),
	(10312, 42, '2018-11-28'),
	(10313, 3, '2012-03-12'),
	(10314, 42, '2003-12-31'),
	(10315, 6, '1998-05-14');


INSERT INTO CUSTOMER
VALUES
	(1, 'Alfreds Futterkiste', 'Maria Anders', 'Germany'),
	(2, 'Ana Trujillo Emparedados y helados', 'Ana Trujillo', 'Mexico'),
	(3, 'Antonio Moreno Taqueira', 'Antonio Moreno', 'Mexico'),
	(4, 'Balakumar Nair', 'Ranga Nair', 'India'),
	(5, 'Akash Sharma', 'Anita Sharma', 'India'),
	(6, 'Shreya Patel', 'Harsh Patel ', 'India'),
	(7, 'Aditya Kumar', 'Dhruv Kumar', 'USA'),
	(8, 'Rahul Pandey', 'Nicholas Pandey', 'USA');

-- 2)
SELECT *
FROM CUSTOMER INNER JOIN ORDERR ON CUSTOMER.CustomerId=ORDERR.CustomerId;

-- 3)
SELECT * FROM CUSTOMER LEFT OUTER JOIN ORDERR
ON CUSTOMER.CustomerId=ORDERR.CustomerId;

-- 4)
SELECT * FROM CUSTOMER RIGHT OUTER JOIN ORDERR
ON CUSTOMER.CustomerId=ORDERR.CustomerId;

-- 5)
SELECT * FROM CUSTOMER LEFT OUTER JOIN ORDERR
ON CUSTOMER.CustomerId=ORDERR.CustomerId
UNION
SELECT * FROM CUSTOMER RIGHT OUTER JOIN ORDERR
ON CUSTOMER.CustomerId=ORDERR.CustomerId;
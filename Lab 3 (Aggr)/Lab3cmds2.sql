use mysampldb;
DROP TABLE Borrower;
DROP TABLE Depositor;
DROP TABLE Customer;
DROP TABLE Bank;

CREATE TABLE Borrower(
	customer_name VARCHAR(100),
    bank_no INT,
    loan_no INT,
    Amount FLOAT
);

CREATE TABLE Depositor(
	customer_name VARCHAR(100),
    bank_no INT,
    account_no INT,
    Amount FLOAT
);

CREATE TABLE Customer(
	customer_name VARCHAR(100),
    street VARCHAR(100),
    customer_city VARCHAR(100),
    PRIMARY KEY(customer_name)
);

CREATE TABLE Bank(
	bankno INT,
    Bankname VARCHAR(100),
    city VARCHAR(100),
    street VARCHAR(100),
    PRIMARY KEY(bankno)
);

INSERT INTO Borrower VALUES('Rohan', 1, 1001, 2000000.50);
INSERT INTO Borrower VALUES('Sam', 1, 1002, 200000.50);
INSERT INTO Borrower VALUES('Akash', 2, 1003, 10000.50);
INSERT INTO Borrower VALUES('Krishna', 3, 1004, 2000.50);
INSERT INTO Borrower VALUES('Krishna', 3, 1005, 1000.50);
SELECT * FROM Borrower;

INSERT INTO Depositor VALUES('Rohan', 1, 1101, 20000.50);
INSERT INTO Depositor VALUES('Rohan', 1, 1102, 30000.50);
INSERT INTO Depositor VALUES('Sam', 1, 1103, 3000000.50);
INSERT INTO Depositor VALUES('Krishna', 3, 1104, 1000.50);
INSERT INTO Depositor VALUES('Jay', 4, 1105, 2000000.50);
SELECT * FROM Depositor;

INSERT INTO Customer VALUES('Rohan', 'R street', 'Chennai');
INSERT INTO Customer VALUES('Sam', 'S street', 'Mumbai');
INSERT INTO Customer VALUES('Krishna', 'K street', 'Kolkata');
INSERT INTO Customer VALUES('Jay', 'J street', 'Kolkata');
INSERT INTO Customer VALUES('Akash', 'A street', 'Trichy');
SELECT * FROM Customer;

INSERT INTO Bank VALUES(1, 'HDFC', 'street 1', 'Chennai');
INSERT INTO Bank VALUES(2, 'JP', 'street 2', 'Chennai');
INSERT INTO Bank VALUES(3, 'Citi', 'street 3', 'Chennai');
INSERT INTO Bank VALUES(4, 'Axis', 'street 4', 'Chennai');
INSERT INTO Bank VALUES(5, 'SBI', 'street 5', 'Chennai');
SELECT * FROM Bank;

select customer_name from Borrower union
select customer_name from Depositor;


select customer_name from Borrower where customer_name NOT IN
(select customer_name from Depositor);


select Customer.customer_name from Borrower,Customer 
where Borrower.customer_name = Customer.customer_name and customer_city='Trichy';


select Customer.customer_name, Customer.street, customer_city, bankno, Bankname, city, Bank.street 
from Borrower, Customer, Bank 
where Borrower.customer_name = Customer.customer_name and  Borrower.bank_no = Bank.bankno 
and Borrower.Amount >1000000;

select Distinct Customer.customer_name from Customer,Depositor,Bank where Customer.customer_name = Depositor.customer_name
and Depositor.bank_no = Bank.bankno and customer_city=Bank.street;

select bank_no from Borrower where Amount in (select max(Amount) from Borrower);

DELETE Customer, Depositor, Borrower FROM Customer, Depositor, Borrower
  WHERE Customer.customer_name = Borrower.customer_name OR Customer.customer_name = Depositor.customer_name;
  SELECT * FROM CUSTOMER;
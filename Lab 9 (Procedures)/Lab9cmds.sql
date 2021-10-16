CREATE DATABASE LAB9;
USE LAB9;
DROP TABLE DEPT;
DROP TABLE EMP;
create table DEPT (
	DEPTNO INT,
	DNAME varchar (30),
	LOC varchar (20),
    PRIMARY KEY(DEPTNO)
);
create table EMP (
    EMPNO numeric (6),
    ENAME varchar (20),
	JOB varchar (10),
	DEPTNO INT,
	SAL numeric (7,2),
	primary key (EMPNO),
	foreign key (DEPTNO) references DEPT(DEPTNO)
);

insert into EMP
values (163, 'Clara Dutta', 'IT_PROG', 1, 1000.0),
	(1, 'Abeshek Kumar', 'ST_PROG', 2, 1054.12),
	(2, 'Ahmed Patel', 'IT_PROG', 3, 30231.12),
	(183, 'Anjaneya Pandey', 'ST_PROG', 4, 10523.12),
	(5, 'Pranav Kumar', 'IT_PROG', 5, 100.1),
	(134, 'Karan Purswani', 'IT_PROG', 1, 103.43),
	(7, 'Chandra Sardesai', 'ST_PROG', 2, 1052.0),
	(159, 'Brijesh Sankar', 'IT_PROG', 3, 8078.0),
	(9, 'Ramki Singh', 'IT_PROG', 4, 10213.21),
	(10, 'Arun Shrivastava', 'ST_PROG', 5, 10213.21),
	(121, 'Dhruv Bodani', 'IT_PROG', 1, 1099.99),
	(133, 'Sriram P', 'ST_PROG', 5, 13200.05);

insert into DEPT
values (1, 'Administration', 'NIT Trichy'),
	(2, 'Marketing', 'Mumbai'),
	(3, 'Purchasing', 'IIT Bombay'),
	(4, 'Human Resources', 'IIT Bombay'),
	(5, 'Shipping IT', 'IIT Delhi'),
	(6, 'Public Relations', 'IIT Delhi'),
	(7, 'Sales', 'IIT Kharagpur'),
	(8, 'Executive', 'NIT Trichy'),
	(9, 'Finance', 'NIT Trichy'),
	(10, 'Accounting', 'IIT Delhi');

SELECT * FROM EMP;
SELECT * FROM DEPT;

-- 1)
create procedure DisplayEmployeeDetails(in employeeNumber numeric (6))
SELECT *
FROM EMP
WHERE EMP.EMPNO = employeeNumber;

call DisplayEmployeeDetails(1);

-- 2)
create procedure AddEmployee(
	in empNo numeric (6),
	in empName varchar (20),
	in job varchar (10),
	in deptNo numeric (3),
	in sal numeric (7,2))
insert into EMP 
values (empNo, empName, job, deptNo, sal);

call AddEmployee(123, 'Mohan Kumar', 'IT_PROG', 6, 1000.95);


-- 3)
create procedure RaiseSalary(
	in empNo numeric (6),
	in raiseAmount numeric (7, 2))
update EMP set SAl=SAL + raiseAmount where EMP.EMPNO=empNo;

call RaiseSalary(2, 500.25);

-- 4)
create procedure RemoveEmployee(in empName varchar (20))
delete from EMP  where ENAME=empName;

call RemoveEmployee('Ahmed Patel');

-- 5)
DELIMITER //
create function MinSalary() 
returns numeric(7,2) DETERMINISTIC
begin
	declare minSal numeric(7,2);
	select min(SAL) into minSal from EMP;
	return minSal;
end //
DELIMITER ;
select MinSalary();


-- 6)
create procedure DisplaySalary(in empNo numeric (6))
select SAL from EMP where EMP.EMPNO=empNo;

call DisplaySalary(5);

-- 7)
DELIMITER //
create function Average(deptNo numeric (2)) returns numeric(7,2) DETERMINISTIC
begin
	declare ans numeric(7,2);
	select avg(SAL) into ans from EMP where EMP.DEPTNO=deptNo;
	return ans;
end;//
DELIMITER ;

select Average(5);



-- 8)
DELIMITER //
create function HighestPaid(deptNo numeric (2)) 
returns numeric(7,2) DETERMINISTIC 
begin
	declare ans numeric(7,2);
	select max(SAL) into ans
	from EMP
	where EMP.DEPTNO=deptNo;
	return ans;
end;//
DELIMITER ;

create procedure ShowAllSalary()
select HighestPaid(DEPTNO) from DEPT;

call ShowAllSalary();

-- 9)
DELIMITER //
create function HighPaidEmployees() returns int DETERMINISTIC
begin
	declare ans int;
	select count(empNo) into ans
	from EMP 
	where EMP.SAL > 30000;
	return ans;
end//
DELIMITER ;

select HighPaidEmployees();

-- 10)
DELIMITER //
create function MumbaiCount() returns int DETERMINISTIC
begin
	declare ans int;
	select count(empNo) into ans
	from EMP
	where EMP.DEPTNO = (select DEPTNO from DEPT where DEPT.LOC='Mumbai');
	return ans;
end;//
DELIMITER ;

select MumbaiCount();
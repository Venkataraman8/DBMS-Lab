-- Question 1 
CREATE USER 'dbuser'@'localhost' IDENTIFIED BY 'password';
CREATE DATABASE mysampldb;
use mysampldb;
GRANT ALL PRIVILEGES ON mysampldb.EMP TO 'dbuser'@'localhost';
FLUSH PRIVILEGES;

-- Question 3
-- 3a
CREATE TABLE EMP(
	EMPNO int(6),
    ENAME varchar(20) NOT NULL,
    JOB varchar(10) NOT NULL,
    DEPTNO int(3),
    SAL double(7,2)
);
-- 3b
ALTER TABLE EMP ADD experience INT NULL;
-- 3c
ALTER TABLE EMP MODIFY COLUMN JOB varchar(30) NOT NULL;
-- 3d
CREATE TABLE dept(
	DEPTNO int(2),
    DNAME varchar(10),
    LOC varchar(10) 
);
-- 3e
ALTER TABLE EMP DROP COLUMN experience;

-- Question 4
-- 4a
INSERT INTO dept VALUES(106, "CSE", "East");
-- 4b
INSERT INTO EMP VALUES (1001,"Alice","Manager",2, 10000.00), (1002,"Bob","Engineer",8, 50000.00), (1003,"Charlie","Sales",5, 5000.00);
-- 4c
SELECT  ENAME, JOB from EMP;

-- Question 5
-- 5a
TRUNCATE TABLE EMP;
-- 5b
DROP TABLE dept; 

-- Question 6
-- 6a
REVOKE ALL PRIVILEGES on mysampldb.EMP FROM 'dbuser'@'localhost';
FLUSH PRIVILEGES;
-- 6b
CREATE USER 'dbuser1'@'localhost' IDENTIFIED BY 'password';
-- 6c
GRANT SELECT ON mysampldb.EMP TO 'dbuser1'@'localhost';
FLUSH PRIVILEGES;
-- 6d
REVOKE SELECT on mysampldb.EMP FROM 'dbuser1'@'localhost';
FLUSH PRIVILEGES;

SELECT * FROM EMP;
SELECT * FROM dept;
use mysampldb;
DROP TABLE EMP;
DROP TABLE DEPT;
DROP TABLE LOCA;

CREATE TABLE EMP(
	EMPLOYEE_ID INT,
	FIRST_NAME VARCHAR(100),
	LAST_NAME VARCHAR(100),
	EMAIL VARCHAR(100),
	PHONE_NUMBER VARCHAR(100),
	HIRE_DATE DATE,
	JOB_ID VARCHAR(10),
	COMMISSION_PCT FLOAT,
    SALARY FLOAT,
	MANAGER_ID INT,
	DEPARTMENT_ID INT
);

CREATE TABLE DEPT(
	DEPARTMENT_ID INT,
	DEPARTMENT_NAME VARCHAR(100),
	MANAGER_ID INT,
	LOCATION_ID INT
);

CREATE TABLE LOCA(
	LOCATION_ID INT,
	STREET_ADDRESS VARCHAR(100),
	POSTAL_CODE INT,
	CITY VARCHAR(100),
	STATA_PROVINCE VARCHAR(100),
	COUNTRY_ID INT
);

INSERT INTO EMP VALUES(163,'Arjun','Ramprasad','arjun@gmail.com', '9521233450','2008-01-01','IT_PROG',5.50,3000,177,1001);
INSERT INTO EMP VALUES(169,'Clara','Singh','clara1@gmail.com', '9533434350','2009-11-21','ACC',5.50,2000,121,1002);
INSERT INTO EMP VALUES(170,'Jagdish','Manohar','jaggi@gmail.com', '9519633450','2018-01-21','TAX',5.50,1500,159,1003);
INSERT INTO EMP VALUES(134,'Arun','Reddy','arun@gmail.com', '9521233321','2000-03-02','IT_PROG',5.50,4000,101,1001);
INSERT INTO EMP VALUES(159,'Tanmay','Sharma','tanman33@gmail.com', '9525633450','2001-01-01','DESIGN',5.50,2000,111,1004);
INSERT INTO EMP VALUES(200,'Ron','Weasley','ron88@gmail.com', '1525633450','2001-01-01','TEST',5.50,2000,111,1004);
INSERT INTO EMP VALUES(183,'Jack','Samuel','jack@gmail.com', '9521233450','2008-01-01','IT_PROG',5.50,3000,177,1002);
INSERT INTO EMP VALUES(199,'Dinesh','Karthik','dinesh@gmail.com', '9523434350','2009-11-21','ACC',5.50,2000,121,1003);
INSERT INTO EMP VALUES(110,'MS','Dhoni','dhoni@gmail.com', '9519635650','2018-01-21','TAX',5.50,1500,159,1001);
INSERT INTO EMP VALUES(114,'Lawrence','Turbo','landt@gmail.com', '951233321','2000-03-02','IT_PROG',5.50,4000,134,1004);
INSERT INTO EMP VALUES(119,'Giri','Nath','gir33@gmail.com', '9525623450','2001-01-01','DESIGN',5.50,2000,159,1001);
INSERT INTO EMP VALUES(112,'Tarry','Potter','tarry88@gmail.com', '1545633450','2001-01-01','TEST',5.50,2000,221,1004);

INSERT INTO DEPT VALUES(1001,'Computer',177,51);
INSERT INTO DEPT VALUES(1002,'Finance',121,52);
INSERT INTO DEPT VALUES(1003,'Taxation',111,53);
INSERT INTO DEPT VALUES(1004,'Production',101,54);
INSERT INTO DEPT VALUES(1005,'Arts',159,55);
INSERT INTO DEPT VALUES(1006,'Electrical',211,56);
INSERT INTO DEPT VALUES(1007,'Sales',221,57);
INSERT INTO DEPT VALUES(1008,'Marketting',231,58);
INSERT INTO DEPT VALUES(1009,'Testing',241,59);
INSERT INTO DEPT VALUES(1010,'Law',210,60);

INSERT INTO LOCA VALUES(51,'Nehru street',600017,'Chennai','TamilNadu',91);
INSERT INTO LOCA VALUES(52,'RedWood street',300007,'Toronto','Canada',10);
INSERT INTO LOCA VALUES(53,'ABC street',200017,'New York','USA',21);
INSERT INTO LOCA VALUES(54,'Shivaji street',600017,'Mumbai','Maharashtra',91);
INSERT INTO LOCA VALUES(55,'Anna street',300017,'Chennai','TamilNadu',91);
INSERT INTO LOCA VALUES(56,'Gandhi street',600017,'Chennai','TamilNadu',91);
INSERT INTO LOCA VALUES(57,'BlueWood street',300007,'Toronto','Canada',10);
INSERT INTO LOCA VALUES(58,'DEF street',200017,'New York','USA',21);
INSERT INTO LOCA VALUES(59,'Pakoda street',600017,'Mumbai','Maharashtra',91);
INSERT INTO LOCA VALUES(60,'Periyar street',300017,'Chennai','TamilNadu',91);

-- 1.
SELECT FIRST_NAME,LAST_NAME FROM EMP WHERE SALARY > (SELECT SALARY FROM EMP WHERE EMPLOYEE_ID = 163);

-- 2.
SELECT EMPLOYEE_ID, FIRST_NAME,LAST_NAME ,SALARY ,DEPARTMENT_ID,JOB_ID FROM EMP WHERE JOB_ID = (SELECT JOB_ID FROM EMP WHERE EMPLOYEE_ID = 169) AND EMPLOYEE_ID != 169;

-- 3.
SELECT FIRST_NAME, LAST_NAME, SALARY, DEPARTMENT_ID   FROM EMP WHERE SALARY IN   ( SELECT MIN(SALARY)   FROM EMP   GROUP BY DEPARTMENT_ID  );

-- 4.
 SELECT EMPLOYEE_ID ,FIRST_NAME, LAST_NAME ,SALARY FROM EMP WHERE SALARY > (SELECT AVG(SALARY) FROM EMP);

-- 5
SELECT FIRST_NAME AS EMPLOYEE_NAME ,EMPLOYEE_ID,SALARY FROM EMP WHERE MANAGER_ID = (SELECT EMPLOYEE_ID FROM EMP WHERE FIRST_NAME ="ARUN");

-- 6
SELECT DISTINCT FIRST_NAME,LAST_NAME,JOB_ID,DEPARTMENT_NAME FROM EMP,DEPT  
     WHERE EMP.DEPARTMENT_ID = ( 
	SELECT DEPARTMENT_ID FROM DEPT  
    WHERE DEPARTMENT_NAME = 'FINANCE') AND EMP.DEPARTMENT_ID = DEPT.DEPARTMENT_ID;
    
-- 7
SELECT * FROM EMP WHERE SALARY = 3000 AND MANAGER_ID = 121;

-- 8
SELECT * FROM EMP WHERE EMPLOYEE_ID IN (134,159,183);
    
-- 9
SELECT * FROM EMP WHERE SALARY BETWEEN 1000 AND 3000;
    
-- 10
SELECT * FROM EMP WHERE SALARY BETWEEN (SELECT MIN(SALARY) FROM EMP) AND 2500;

-- 11
SELECT * FROM  EMP WHERE DEPARTMENT_ID NOT IN (SELECT DEPARTMENT_ID FROM DEPT WHERE MANAGER_ID BETWEEN 100 AND 200);

-- 12
SELECT * FROM EMP WHERE SALARY IN (SELECT max(SALARY) FROM EMP WHERE SALARY NOT IN(select max(SALARY) FROM EMP));

-- 13
SELECT FIRST_NAME, LAST_NAME, HIRE_DATE FROM EMP WHERE DEPARTMENT_ID IN (SELECT DEPARTMENT_ID FROM EMP WHERE FIRST_NAME = "Clara") AND FIRST_NAME != "Clara";

-- 14
SELECT EMPLOYEE_ID, FIRST_NAME, LAST_NAME FROM EMP WHERE DEPARTMENT_ID IN(SELECT DEPARTMENT_ID FROM EMP WHERE FIRST_NAME LIKE "%t%");

-- 15:
  SELECT EMPLOYEE_ID, FIRST_NAME, LAST_NAME, SALARY FROM EMP 
  WHERE 
  SALARY > (select avg(SALARY) from EMP) 
  && 
  DEPARTMENT_ID IN (SELECT DISTINCT DEPARTMENT_ID FROM EMP WHERE FIRST_NAME LIKE 'J%');

-- 16:
  SELECT  FIRST_NAME, LAST_NAME, EMPLOYEE_ID, JOB_ID  FROM EMP  
  WHERE 
  DEPARTMENT_ID in (SELECT DEPARTMENT_ID	FROM dept 
                    WHERE LOCATION_ID IN (SELECT LOCATION_ID FROM LOCA WHERE CITY ='TORONTO'));

-- 17:
  SELECT EMPLOYEE_ID, FIRST_NAME, LAST_NAME, JOB_ID FROM EMP 
  WHERE 
  SALARY < ANY (select min(SALARY) from EMP WHERE JOB_ID='IT_PROG'); 

-- 18:
 SELECT EMPLOYEE_ID,FIRST_NAME,LAST_NAME,JOB_ID FROM EMP 
 WHERE 
 SALARY < ANY ( SELECT SALARY FROM EMP WHERE JOB_ID = 'IT_PROG' );

-- 19:
 SELECT EMPLOYEE_ID, FIRST_NAME, LAST_NAME, JOB_ID FROM EMP 
 WHERE 
 SALARY > ALL (select SALARY from EMP WHERE JOB_ID='IT_PROG'); 

-- 20:
SELECT EMPLOYEE_ID, FIRST_NAME, LAST_NAME, JOB_ID FROM EMP 
WHERE 
SALARY > ALL ( SELECT AVG(SALARY) FROM EMP GROUP BY DEPARTMENT_ID );

-- 21
SELECT * FROM EMP E WHERE  (SELECT COUNT(DISTINCT SALARY ) FROM EMP WHERE  E.SALARY >= SALARY) = 2;

-- 22
 SELECT CITY FROM LOCA,DEPT,EMP WHERE LOCA.LOCATION_ID=DEPT.LOCATION_ID AND DEPT.DEPARTMENT_ID=EMP.DEPARTMENT_ID AND EMPLOYEE_ID=134;

-- 23
SELECT FIRST_NAME,LAST_NAME,SALARY,DEPARTMENT_ID FROM EMP WHERE DEPARTMENT_ID IN (SELECT DEPARTMENT_ID FROM DEPT,LOCA WHERE DEPT.LOCATION_ID=LOCA.LOCATION_ID AND CITY='LONDON');

-- 24 
SELECT FIRST_NAME,LAST_NAME,SALARY,DEPARTMENT_ID FROM EMP HAVING SALARY>(SELECT AVG(SALARY) FROM EMP) ORDER BY SALARY DESC;

-- 25
SELECT * FROM EMP WHERE EXISTS (SELECT * FROM DEPT WHERE DEPT.MANAGER_ID = EMP.EMPLOYEE_ID);

-- 26
SELECT e1.FIRST_NAME, e1.LAST_NAME FROM EMP e1 WHERE e1.SALARY > ( SELECT (SUM(SALARY))*0.5 FROM EMP e2 WHERE e1.DEPARTMENT_ID = e2.DEPARTMENT_ID);

-- 27
SELECT * FROM DEPT WHERE DEPT.DEPARTMENT_ID IN (SELECT DISTINCT (DEPARTMENT_ID) FROM EMP);

-- 28
SELECT FIRST_NAME, LAST_NAME FROM EMP WHERE EXISTS(SELECT * FROM EMP WHERE SALARY>3700);

-- 29
SELECT DEPARTMENT_ID, DEPARTMENT_NAME FROM DEPT WHERE NOT EXISTS(SELECT * FROM EMP WHERE EMP.DEPARTMENT_ID = DEPT.DEPARTMENT_ID);
 

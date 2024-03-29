USE MYSAMPLDB;
drop table if exists book;
drop table if exists book_author;
drop table if exists borrower;
drop table if exists book_loans;

    CREATE TABLE BOOK(BID INT PRIMARY KEY,TITLE VARCHAR(100),PUBLISHER VARCHAR(100));
  
    CREATE TABLE BOOK_AUTHOR(AID INT PRIMARY KEY,BID INT,AUTHOR_NAME VARCHAR(100),FOREIGN KEY (BID) REFERENCES BOOK(BID));
 
    CREATE TABLE BORROWER(CARDNO INT PRIMARY KEY,NAME VARCHAR(100),ADDRESS VARCHAR(100),PHONE INT);
  
    CREATE TABLE BOOK_LOANS(TRANSID INT PRIMARY KEY,BID INT,CARDNO INT,DATE_OUT DATE,DUE_DATE DATE);


    INSERT INTO BOOK VALUES (100,'MATHS','SHARMA');
    INSERT INTO BOOK VALUES (101,'ENGLISH','ALICE');
    INSERT INTO BOOK VALUES (102,'SCIENCE','RAJU');
    INSERT INTO BOOK VALUES (103,'SOCIAL','NEEL');
    INSERT INTO BOOK VALUES (104,'HINDI','RAM');
    INSERT INTO BOOK VALUES (105,'TELUGU','RAMHARAN');

    INSERT INTO BOOK_AUTHOR VALUES (1,100,'KUMAR');
    INSERT INTO BOOK_AUTHOR VALUES (2,101,'JOHN');
    INSERT INTO BOOK_AUTHOR VALUES (3,102,'BRIJESH');
    INSERT INTO BOOK_AUTHOR VALUES (4,103,'GURU');
    INSERT INTO BOOK_AUTHOR VALUES (5,104,'RAHUL');
  
 select * from book_author; 
 
-- 3
UPDATE BOOK SET BID=6 WHERE BID=5;


-- 4
 ALTER TABLE BOOK_AUTHOR DROP FOREIGN KEY BID;
 
 
-- 5
ALTER TABLE BOOK_AUTHOR ADD FOREIGN KEY (BID) REFERENCES BOOK(BID) ON UPDATE CASCADE;

-- 6
UPDATE BOOK SET BID=6 WHERE BID=5;


-- 7
DELETE FROM BOOK WHERE BID=6;

-- 8
ALTER TABLE BOOK_AUTHOR ADD FOREIGN KEY (BID) REFERENCES BOOK(BID) ON DELETE CASCADE;

-- 9
DELETE FROM BOOK WHERE BID=6;

-- 10
ALTER TABLE BOOK_LOANs ADD FOREIGN KEY (BID) REFERENCES BOOK(BID) ON UPDATE RESTRICT ON DELETE SET NULL;

desc book;
desc book_loans;
-- 11
insert into Borrower values ( 51 , "Ayush" , "Chennai" , 109823) , ( 52 , "Pinky" , "Madurai" , 903951) , ( 53 , "Harshit" ,"Mumbai" ,  980980) , ( 54 ,"Nitin" , "Duabii"  , 12323) , (55 , "Priyanka" , "Bangalore" , 99819);

insert into Book_loans values ( 1001 , 4 , 52 , "2020-01-31" , "2020-04-1") , ( 1002 , 3 , 52 , "2020-01-03" , "2020-08-01" ) , ( 1003 ,10 , 53 , "2020-09-01" , "2020-12-12") , ( 1004 , 5 , 54 , "2020-09-01" , "2020-12-12");

-- 12
DELETE FROM BORROWER WHERE CARDNO =1;
DELETE FROM BORROWER WHERE CARDNO =4;

select * from borrower;

-- 13
UPDATE BOOK SET TITLE="FAMOUS FIVE" WHERE BID=1;

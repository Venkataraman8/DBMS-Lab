CREATE DATABASE LAB10;
USE LAB10;
CREATE TABLE PRODUCT (
     PID int(11) NOT NULL,
     BARCODE int(11) NOT NULL,
     PNAME varchar(255) NOT NULL,
     PRICE int(11) NOT NULL,
     QUANTITYINSTOCK int(11) NOT NULL
   );
SET autocommit = OFF;
-- SET autocommit = ON;

INSERT INTO Product(PID, BarCode, PName, Price, QuantityInStock)    
   VALUES (113, 110111, 'CYCLE', 800, 1500); 
     
   SELECT * FROM PRODUCT;

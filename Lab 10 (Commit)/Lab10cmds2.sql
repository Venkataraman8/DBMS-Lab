USE LAB10;
CREATE TABLE PRODUCT (
     PID int(11) NOT NULL,
     BARCODE int(11) NOT NULL,
     PNAME varchar(255) NOT NULL,
     PRICE int(11) NOT NULL,
     QUANTITYINSTOCK int(11) NOT NULL
   );
SET autocommit = OFF;

   START TRANSACTION; 
 

   INSERT INTO Product(PID, BarCode, PName, Price, QuantityInStock)   
   VALUES (111, 110014, 'Bike', 70000, 100);  

   SELECT * FROM PRODUCT;
   
   SAVEPOINT my_savepoint;  

   INSERT INTO Product(PID, BarCode, PName, Price, QuantityInStock)    
   VALUES (001, 110010, 'CYCLE', 700, 1500); 
     
   SELECT * FROM PRODUCT;
   
   ROLLBACK TO SAVEPOINT my_savepoint;  
   
   INSERT INTO Product(PID, BarCode, PName, Price, QuantityInStock)   
   VALUES (101, 110013, 'CAR', 800000, 10);  
   
   SELECT * FROM PRODUCT;
     
   COMMIT;
   
   SELECT * FROM PRODUCT;
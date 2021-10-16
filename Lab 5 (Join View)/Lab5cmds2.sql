use mysampldb;
DROP TABLE Customer;
DROP TABLE Item;
DROP TABLE Sale;

CREATE TABLE Customer
(
    Cust_id  INT PRIMARY KEY, 
    cust_name VARCHAR(50)
);

CREATE TABLE Item
(
    item_id INT,
    item_name VARCHAR(50), 
    price INT    
);


CREATE TABLE Sale
(
	bill_no INT PRIMARY KEY,
    bill_date DATE, 
    cust_id INT,
    item_id INT,
    qty_sold INT DEFAULT 0
);

INSERT INTO CUSTOMER VALUES
(101,'Ahmed'),
(102,'Bala'),
(103, 'Chan'),
(104, 'Dhruv'),
(105, 'Easwar'),
(106, 'Freddy'),
(107, 'Gayatri'),
(108, 'Harsh'),
(109,'Rahul'),
(110, 'Sam');

INSERT INTO Item VALUES
(1, 'T-Shirt', 999),
(2, 'Smartphone', 30000),
(3, 'Watch', 5000),
(4, 'Cap', 300),
(5, 'Trimmer', 3000),
(6, 'Comb', 100),
(7, 'Laptop', 60000),
(8, 'Gaming System', 200000),
(9, 'Headphones', 7000),
(10, 'Shoes', 2000);

INSERT INTO Sale VALUES
(8001, '2018-12-27',103, 4, 5),
(8002, '2019-01-15', 103, 2, 10),
(8003, '2019-02-07', 101, 3, 2),
(8004, '2019-04-13', 110, 5, 1),
(8005, '2019-06-27', 109, 7, 2),
(8006, '2019-08-07', 109, 7, 3),
(8007, '2019-10-17', 102, 6, 100),
(8008, '2019-12-07', 105, 8, 1),
(8009, '2020-09-28', 106, 8, 1),
(8010, '2020-09-28', 108, 8, 1);

-- b
CREATE VIEW Luxury_Items AS 
(SELECT * FROM ITEM WHERE PRICE > 500);
SELECT * FROM LUXURY_ITEMS;
-- c
UPDATE Luxury_Items SET PRICE = 250 WHERE ITEM_ID = 2;

-- d
INSERT INTO Luxury_Items VALUES (11, 'Kitchen knife', 450);

-- e
CREATE VIEW Luxury_Items1 AS 
(SELECT ITEM_ID FROM ITEM WHERE PRICE > 500) WITH CHECK OPTION;
SELECT * FROM Luxury_Items1;

-- f
INSERT INTO Luxury_Items1 VALUES (11, 'Kitchen knife', 450);

-- g
CREATE VIEW TodaysSale AS SELECT Sale.bill_no, Sale.item_id, Item.item_name, Item.price, 
(SELECT cust_name FROM Customer WHERE cust_id = Sale.cust_id) AS CUSTOMER_NAME 
FROM Sale INNER JOIN Item ON Sale.item_id = Item.item_id WHERE Sale.bill_date='2020-09-28';
SELECT * FROM TodaysSale;

-- h
SET SQL_SAFE_UPDATES=0;
UPDATE TodaysSale SET price = 900 WHERE item_id = 8;

-- i
CREATE VIEW I AS (SELECT CUSTOMER.CUST_NAME,SUM(QTY_SOLD) FROM CUSTOMER,SALE WHERE CUSTOMER.CUST_ID=SALE.CUST_ID GROUP BY SALE.CUST_ID);
SELECT * FROM I;

-- j
CREATE VIEW V AS (SELECT BILL_NO,BILL_DATE,CUST_ID,SALE.ITEM_ID AS ITEM_ID,PRICE,QTY_SOLD,(PRICE*QTY_SOLD) AS AMOUNT 
FROM ITEM,SALE WHERE ITEM.ITEM_ID=SALE.ITEM_ID);
SELECT * FROM V;

-- k
SELECT ITEM_NAME,SALES_REVENUE FROM 
(SELECT ITEM_NAME,PRICE*QTY_SOLD FROM ITEM,SALE WHERE YEAR(BILL_DATE)='2019' GROUP BY ITEM_NAME) AS ITEM_SALES(ITEM_NAME,SALES_REVENUE) 
ORDER BY SALES_REVENUE DESC LIMIT 5;


-- l
SELECT typeC, count(typeC) from( 
      SELECT CUST_ID, 
		case 
			when (SUM(QTY_SOLD * price) < 10000 )   then 'Silver'
			when (SUM(QTY_SOLD * price) >= 10000 AND SUM(QTY_SOLD * price) < 50000)   then 'Gold'
            when (SUM(QTY_SOLD * price) > 50000 )   then 'Platinum'
		end
		as typeC 
		from SALE, ITEM 
		where SALE.ITEM_ID = ITEM.item_id
        group by cust_id) AS cust_types
GROUP BY typeC;
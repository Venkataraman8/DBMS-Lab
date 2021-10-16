use mysampldb;
DROP TABLE books;
CREATE TABLE books (
	BOOKNO INT(3),
    TITLE VARCHAR(50),
    PUBLICATION VARCHAR(50),
    AUTHOR VARCHAR(100),
    PRICE DECIMAL(6,2),
    QUANTITY INT(3),
    EDITION INT(2),
    PRIMARY KEY (BOOKNO),
    CHECK(QUANTITY<=100)
);
SELECT * FROM books;

INSERT INTO books VALUES(1,'Fundamentals of Database System', 'Pearson' ,'Elmasri, Navathe', 800, 25, 7);
INSERT INTO books VALUES(2, 'Database System Concepts','TATA McGrawHill Higher Education', 'Silberschatz, Korth, Sudharshan', 750, 15, 7);
INSERT INTO books VALUES(3, 'Database Management System', 'TATA McGraw Hill', 'Raghurama Krishnan, Johannes Gehrke', 590, 10, 3);
INSERT INTO books VALUES(4, 'Datastructures and Algorithm', 'Pearson', 'H. Cormen', 1080, 5, 6);
INSERT INTO books VALUES(5, 'Operating system concepts', 'Wiley', 'Silberschatz, Galvin, Gagne', 640, 8, 6);
INSERT INTO books VALUES(6, 'Modern Operating System', 'Prentice Hall India', 'Tanenbaum', 890, 23, 2);
INSERT INTO books VALUES(7, 'Computer Networks', 'PHI', 'Kurose, Ross', 390, 102, 6);
SELECT * from books; 

SELECT TITLE,AUTHOR FROM books;

SELECT AUTHOR FROM books WHERE TITLE='Database System Concepts';

SELECT * FROM books WHERE PRICE>800;

SELECT * FROM books WHERE QUANTITY>15 ORDER BY PRICE;

SELECT * FROM books WHERE PUBLICATION LIKE 'P___%';

SELECT * FROM books WHERE PUBLICATION NOT REGEXP "^[PT].*$";

SELECT * FROM books WHERE AUTHOR LIKE 'Silberschatz%' AND PUBLICATION LIKE 'TATA%';

SELECT * FROM books WHERE TITLE LIKE '%CONCEPTS%';

UPDATE books SET PRICE = (PRICE*1.1) WHERE PUBLICATION='Pearson';
SELECT * FROM books;


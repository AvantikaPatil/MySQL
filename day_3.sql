use training;

-- PRIMARY KEY CONSTRAINT (UNIQUE + NOT NULL)
CREATE TABLE Pk_table(
custid INT PRIMARY KEY,
custname VARCHAR(100) NOT NULL,
age INT CHECK(age>20 and age<=60),
city VARCHAR(100) DEFAULT 'HYDRABAD',
mobile VARCHAR(100) UNIQUE
);

INSERT INTO Pk_table VALUES(1000, "Madhan", 36, "Chennai", 1234567890);
INSERT INTO Pk_table VALUES(1000, "Ravi", 37, "Banglore", 9923683757); -- ERROR since custid 1000 is duplicate
INSERT INTO Pk_table(custname, age, city, mobile) VALUES("Madhan", 36, "Chennai", 1234567890); -- ERROR since custid doesn't have a value
INSERT INTO Pk_table VALUES(1001, "Ravi", 36, "Banglore", 9923683757);
SELECT * FROM Pk_table;

CREATE TABLE Pk_table_comp(
custid INT,
custname VARCHAR(100) NOT NULL,
age INT CHECK(age>20 and age<=60),
city VARCHAR(100) DEFAULT 'HYDRABAD',
mobile VARCHAR(100) UNIQUE,
primary key(custid, custname)
);

INSERT INTO Pk_table_comp VALUES(1000, "Raja", 30, "Chennai", 8901234567);
INSERT INTO Pk_table_comp VALUES(1000, "Rajesh", 30, "Chennai", 8902134567);
INSERT INTO Pk_table_comp VALUES(1000, "Raja", 30, "Chennai", 8901234567); -- ERROR since custid and custname(1000-Raja) are duplicate

CREATE TABLE customers(
cust_id INT PRIMARY KEY,
custname VARCHAR(100) NOT NULL,
city VARCHAR(100) DEFAULT 'HYDRABAD'
);

INSERT INTO customers VALUES(1000, "Bala", "Banglore"), (1001, "Irfan", "Hydrabad"), (1002, "Anand", "Chennai");
SELECT * FROM customers;

CREATE TABLE orders(
ord_id INT PRIMARY KEY,
cust_id INT,
prod_name VARCHAR(100),
amount INT,
constraint fk_orders FOREIGN KEY (cust_id) REFERENCES customers(cust_id)
);

INSERT INTO orders VALUES(1, 1000, "Mobile", 50000);
INSERT INTO orders VALUES(2, 1003, "Laptop", 100000); -- ERROR => value(1003) is not present in customer table
INSERT INTO orders VALUES(2, 1001, "Laptop", 100000);
SELECT * FROM orders;

DELETE FROM customers WHERE cust_id=1000; -- ERROR => Cannot delete or update a parent row: a foreign key constraint fails 
-- IF YOU WANT TO REMOVE IT THEN, FIRST WE NEED TO REMOVE FROM CHILD THEN WE CAN REMOVE FROM PARENT TABLE

DELETE FROM orders WHERE cust_id=1000;
DELETE FROM customers WHERE cust_id=1000;

drop table orders;

CREATE TABLE orders(
ord_id INT PRIMARY KEY,
cust_id INT,
prod_name VARCHAR(100),
amount INT,
constraint fk_orders FOREIGN KEY (cust_id) REFERENCES customers(cust_id) ON DELETE CASCADE
);

INSERT INTO orders VALUES(1, 1000, "Mobile", 50000);
INSERT INTO orders VALUES(2, 1001, "Laptop", 100000);
SELECT * FROM orders;

DELETE FROM customers WHERE cust_id=1000;

-- ============================== AUTO INCREMENT ======================================
CREATE TABLE users(
user_id INT UNIQUE auto_increment,
user_name VARCHAR(100),
city VARCHAR(100)
);

INSERT INTO users(user_name, city) VALUES('Ganesh', "Mumbai");
SELECT * FROM users;
INSERT INTO users(user_name, city) VALUES('Ramya', "Pune");
INSERT INTO users(user_name, city) VALUES('Siva', "Chennai");
INSERT INTO users VALUES(100, 'Raghul', "Chennai"); -- id = 100
INSERT INTO users(user_name, city) VALUES('Siva', "Chennai"); -- now id will become 101
INSERT INTO users VALUES(50, 'Ashwini', "Chennai");
INSERT INTO users(user_name, city) VALUES('Tharani', "Hydrabad");

-- ============================== AUTO INCREMENT ======================================

-- ALTER STATEMENT
-- ADD A NEW COLUMN
-- REMOVE THE COLUMN
-- MODIFYING THE COLUMN
-- RENAMING THE COLUMN
-- RENAMING THE TABLE

------------ ALTER STATEMENT ---------------
--------- ADD A NEW COLUMN -----------------

SELECT * FROM customers;

desc customers;

ALTER TABLE customers
ADD COLUMN country VARCHAR(100);

SELECT * FROM customers;

INSERT INTO customers VALUES(1003, "Durga", "Hydrabad", "India");

set sql_safe_updates=0;
UPDATE customers SET country="india" WHERE country is NULL;

ALTER TABLE customers
ADD COLUMN profession VARCHAR(100) DEFAULT 'Software Engineer';
SELECT * FROM customers;

desc customers;

----- REMOVE THE COLUMN ---------

ALTER TABLE customers
DROP COLUMN country;

SELECT * FROM customers;

desc customers;

----- MODIFY THE COLUMN ---------

ALTER TABLE customers
MODIFY COLUMN city VARCHAR(100) DEFAULT 'new delhi';

desc customers;

ALTER TABLE customers
Modify custname VARCHAR(100) unique;

desc customers;

----- RENAME THE COLUMN ---------

ALTER TABLE customers
RENAME column city to location;

desc customers;

----- RENAME THE TABLE ---------

ALTER TABLE customer
RENAME TO organisation;

RENAME TABLE organisation to customer;

desc customers;

----- ADD THE PC CONSTRAINT ---------

desc product;

DELETE FROM product WHERE prod_id IS NULL;

ALTER TABLE product
ADD PRIMARY KEY(prod_id);

desc product;

ALTER TABLE product
modify column amount INT CHECK(amount>0);

INSERT INTO product VALUES(12, 'toys', 0); -- ERRO0R - amount should be greater than 

DELETE FROM product; -- TO delete all records from product table

-- ------------------------------ TRUNCATE ---------------------------------
-- TRUNCATE is delete all the records in a table
-- TRUNCATE is run faster than DELETE

select * from users;

TRUNCATE TABLE users;
select * from users;
desc users;

-- -------- drop ----------------

SELECT * FROM customer;
DROP TABLE customer;
select * from customer;

-- --------------------------------------------------------------------------
------------------------ TCL - TRANSACTION CONTROL STATEMENT --------------------

---------------------- COMMIT ---------------------------

START TRANSACTION;
SELECT * FROM customers;

delete from customers where cust_id in (1001, 1002);

commit; -- trnasaction is done , cannot be roll back

---------------------- ROLL BACK ---------------------------

SELECT * FROM unique_table;

START TRANSACTION;
SELECT * FROM unique_table;
DELETE FROM unique_table;
SELECT * FROM unique_table;

rollback; -- USED TO UNDO TRANSACTION WHICH ARE AFTER COMMITED

SELECT * FROM unique_table;

START TRANSACTION;
DELETE FROM unique_table where custid is null;
SELECT * FROM unique_table;

commit;

START TRANSACTION;
SELECT * FROM unique_table;
TRUNCATE TABLE unique_table;

SELECT * FROM unique_table;

Rollback; -- TRUNCATE AND DROP ARE NOT SUPPORTED TO ROLLBACK
SELECT * FROM unique_table;

START TRANSACTION;
SELECT * FROM company;

SAVEPOINT p1;
update company set Salary=10000 where salary is null;

SAVEPOINT p2;
update company set place="Hydrabad" where place is null;

SAVEPOINT p3;
delete from company where age=0;

SAVEPOINT p4;
ALTER TABLE company
RENAME column place to location;

SELECT * FROM company;

ROLLBACK TO SAVEPOINT p4;
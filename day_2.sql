use training;

CREATE TABLE product(
prod_id INT, 
prod_name VARCHAR(100), 
amount INT 
);

INSERT INTO product values(1, "Mobile", 30000), (2, "Laptop", 75000), (3, "TV", 60000), (4, "Desktop", 55000), (5, "Fridge", 30000);

SELECT * FROM product;

SELECT * FROM product WHERE prod_name="Fridge";
DELETE FROM product WHERE prod_name="Fridge";

SELECT * FROM product;
SELECT * FROM product WHERE prod_id>2;
DELETE FROM product WHERE prod_id>2;

SELECT * FROM company;
SELECT * FROM company WHERE Salary=NULL;
DELETE FROM company WHERE Salary=NULL;


------ SQL CONSTRAINT -------
-- 1. UNIQUE
-- for insert unique value in column
-- it show error if insert similar value in column
		
-- 2. NOT NULL
-- it show error when we insert "null" 
		
-- 3. CHECK
-- it check condition
-- if condition is not satisfied, it will show error
-- syntax - 
-- col_name data_type(size) CHECK(condition)

-- 4. DEFAULT
-- enter default value if user not insert any value at that place
-- syntax
-- create table table_name(
-- …,
-- col_name data_type(size) DEFAULT("val"),
-- ...
-- )
			
-- insert into table_name(col_name, … )value(val, …)
-- don't write name of col_name which has give any default value

-- 5. ENUM
-- insert specific value
-- varchar gender ENUM("Male", "Female")

---- UNIQUE ----
CREATE TABLE unique_table(
custid INT UNIQUE,
custname VARCHAR(100), 
age INT,
city VARCHAR(100)
);

INSERT INTO unique_table VALUES(100, "Ramkumar", 35, "Chennai");
INSERT INTO unique_table VALUES(101, "Balravikumar", 30, "Hydrabad");
INSERT INTO unique_table VALUES(100, "Mohan", 40, "Banglore"); -- ERROR - UNIQUE VALUE
INSERT INTO unique_table VALUES(102, "Mohan", 40, "Banglore");
INSERT INTO unique_table VALUES(103, "Mohan", 40, "Banglore");

INSERT INTO unique_table(custname, age, city) VALUES("Aveek", 40, "Delhi");
INSERT INTO unique_table(custname, age, city) VALUES("Aveek", 40, "Delhi");
SELECT * FROM unique_table;

-- UNIQUE column can accpet more than 1 null value 

---- NOT NULL ----
CREATE TABLE notnull_table(
custid INT NOT NULL,
custname VARCHAR(100) UNIQUE,
age INT,
city VARCHAR(100)
);

INSERT INTO notnull_table VALUES(1, "Raja", 25, "Hydrabad");

INSERT INTO notnull_table VALUES(1, "Raja", 25, "Hydrabad"); -- CUSTOMER NAME DUPLICATE
INSERT INTO notnull_table VALUES(1, "Rajesh", 25, "Hydrabad");
INSERT INTO notnull_table(custname,age, city) VALUES("Bala", 30, "Chennai"); -- NOT NULL ID
INSERT INTO notnull_table(custid, custname, age, city) VALUES(2, "Bala", 30, "Chennai");
SELECT * FROM notnull_table;

---- CHECK ----

CREATE TABLE check_table(
custid INT UNIQUE NOT NULL,
custname VARCHAR(100) NOT NULL,
age INT CHECK(age>0 and age<100),
city VARCHAR(100)
);

INSERT INTO check_table VALUES(1, "Siva", 25, "Hydrabad");
INSERT INTO check_table VALUES(1, "Siva", 25, "Hydrabad"); -- DUPLICATE ID
INSERT INTO check_table(custname, age, city) VALUES("Siva", 25, "Hydrabad"); -- NOT NULL ID
INSERT INTO check_table VALUES(2, "Vyanktesh", 36, "Hydrabad");
INSERT INTO check_table VALUES(3, "Ramya", -25, "Delhi"); -- ERROR - CHECK CONDITION
INSERT INTO check_table VALUES(3, "Ramya", 101, "Hydrabad"); -- ERROR - CHECK CONDITION
INSERT INTO check_table VALUES(3, "Ramya", 25, "Delhi");

SELECT * FROM check_table;

---- DEFAULT ----

CREATE TABLE default_table(
custid INT UNIQUE NOT NULL,
custname VARCHAR(100) UNIQUE,
age INT CHECK(age>22 and age<44),
city VARCHAR(100) default 'Hydrabad'
);

INSERT INTO default_table VALUES(1, "Prakash", 25, "Banglore");
INSERT INTO default_table VALUES(2, "Priya", 20, "Banglore"); -- ERROR CHECK CONDITION
INSERT INTO default_table VALUES(2, "priya", 50, "Banglore"); -- ERROR CHECK CONDITION
INSERT INTO default_table VALUES(2, "Priya", 30, "Banglore");
INSERT INTO default_table(custid, custname, age) VALUES(3, "Satya", 25);

SELECT * FROM default_table;

------------------------------------ EXERCISE -------------------------------------

CREATE TABLE country(
country_id INT,
country_name VARCHAR(100) UNIQUE,
people_count INT
);

INSERT INTO country VALUES(1, "China", 1439323776),
(2, "India", 1380004385),
(3, "US", 331002651),
(4, "Indonesia", 273523615),
(5, "Pakistan", 220892340),
(6, "Brazil", 212559417),
(7, "Nigeria", 206139589),
(8, "Bangladesh", 164689383),
(9, "Russia", 145934462),
(10, "Mexico", 128932753);

SELECT * FROM country;
UPDATE country SET country_name="United States" where country_name="US";

DELETE FROM country WHERE country_name="China";

--------------------------------------------------------

SELECT * FROM product;

INSERT INTO product VALUES(10, "House", 10000000);
INSERT INTO product(prod_id, prod_name) VALUES(11, "Car");
INSERT INTO product(prod_name) VALUES("Bike");
INSERT INTO product VALUES(NULL, NULL, 1000);
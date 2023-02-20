CREATE DATABASE training;

-- TO comment

use training;

-------------------------------------------------------------------------------------------
-- DDL = Data Defination Language ( CREATE, ALTER, DROP, TRUNCATE, RENAME)
-- DML = Data Manupulation Language (INSERT, UPDATE, DELETE)
-- DCL = Data Control Language (GRANT, REVOKE)
-- TCL =Transaction Control Language (COMMIT, ROLLBACK, SAVEPOINT)
-- DQL = Data Query Language (SELECT)

-- JOINS
-- FUNCTIONS
-- PLSQL
-------------------------------------------------------------------------------------------

-- OLTP => Online Transaction Process 
-- OLAP => Online Analysis Process (Write once and read many times (can not modify))

-- Type of database
-- 1. Relational Database System => MYSQL, ORACLE, MsSQL
-- 2. NoSQL => MangoDB, ElasticSearch, Cassandra, Hbase
-- 3. DataWarehouse => Redshift, BigQuery, Snowflake
-- 4. Datalake => s3, GFS, Azure Blob
-- 5. Data Lakehouse => data bracks

-- CREATE TABLE
CREATE TABLE customer (
custid INT,
custname VARCHAR(50),
age INT,
gender CHAR(1),
city VARCHAR(50)
);

-- Data type
-- DATA TYPES 
-- Int -> to store a number (no length is taken)
-- Char -> Fixed length of string
-- VARCHAR -> variable character (alpha + num)
-- DATE -> 05-02-2023
-- BOOLEAN -> True False None
-- DOUBLE -> 30.56

-- INSERT VALUES IN TABLE
insert into customer(custid, custname, age, gender, city)values(1, 'Avantika', 20, 'F', 'Kasegoan');
insert into customer(custid, custname, age, gender, city)values(2, 'Shruti', 20, 'F', 'Malhar Peth');
insert into customer values(3, 'Dashrath', 20, 'M', 'Kundal');
insert into customer values(4, 'Ashutosh', 23, 'M', 'Kasegoan');
insert into customer values(5, 'Aditya', 23, 'M', 'Kasegoan');
insert into customer values(6, 'Somnath', 22, 'M', 'Talbid');
insert into customer values(7, 'Dhanashri', 20, 'F', 'Kadegaon');
SELECT * from customer;


-- UPDATES THE RECORDS
SET sql_safe_updates=0; -- IN SAFE MODE
update customer SET age=19 WHERE custname="Dashrath";

update customer SET age=20, city="Pune" WHERE custid=1;

-- DELETE THE RECORDS
delete from customer WHERE custid=1;

-- DISPLAY TABLE
SELECT * from customer; 

delete from customer where city in("Malhar Peth", "kadegaon");
SELECT * from customer;

delete from customer where city not in("Pune", "Talbid");
SELECT * from customer;



CREATE TABLE company (
Company VARCHAR(50),
Age INT,
Salary INT,
Place VARCHAR(50),
Country VARCHAR(50),
Gender varchar(50)
); 

insert into company(Company, Age, Place, Country, Gender) values("TCS", 20, "Chennai", "India", "Female");
insert into company(Company, Age, Place, Country, Gender) values("Infosys", 30, "Mumbai", "India", "Female");
insert into company values("TCS", 35, 2300, "Calcutta", "India", "Female");
insert into company values("Infosys", 40, 3000, "Delhi", "India", "Female");
insert into company values("TCS", 23, 4000, "Mumbai", "India", "Female");
insert into company values("Infosys", 23, 7000, "Mumbai", "India", "Male");
insert into company values("TCS", 34, 8000, "Mumbai", "India", "Male");
insert into company values("CTS", 45, 9000, "Delhi", "India", "Female");
insert into company(Company, Age, Place, Country, Gender) values("CTS", 23, "Mumbai", "India", "Female");
insert into company values("CTS", 34, 1089, "Calcutta", "India", "Female");
insert into company values("Infosys", 51, 3184, "Hydrabad", "India", "Female");
insert into company values("Infosys", 44, 4034, "Hydrabad", "India", "Female");
insert into company(Company, Age, Place, Country, Gender) values("TCS", 20, "Noida", "India", "Female");
insert into company(Company, Age, Place, Country, Gender) values("Infosys", 35, "Mumbai", "India", "Male");
insert into company values("CTS", 35, 2300, "Calcutta", "India", "Female");
insert into company values("Infosys", 40, 3550, "Delhi", "India", "Male");
insert into company values("TCS", 25, 4000, "Noida", "India", "Female");
insert into company values("Infosys", 23, 7080, "Mumbai", "India", "female");
insert into company values("CTS", 34, 8080, "Mumbai", "India", "Male");
insert into company values("CTS", 50, 9000, "Delhi", "India", "Male");
insert into company(Company, Age, Place, Country, Gender) values("CTS", 23, "Noida", "India", "Male");
insert into company values("CTS", 34, 1089, "Calcutta", "India", "Male");
insert into company values("Infosys", 51, 4984, "Hydrabad", "India", "Female");
insert into company values("Infosys", 37, 3434, "Noida", "India", "Male");
insert into company(Company, Age, Salary, Country, Gender) values("CTS", 23, 3490, "India", "Male");

SELECT * FROM company;

SELECT * FROM company WHERE company="Infosys";
SELECT * FROM company WHERE company="Infosys" AND Place="Hydrabad";
SELECT * FROM company WHERE company="Infosys" AND Salary>3000;
SELECT * FROM company WHERE company="TCS" OR Salary>3000;


SET sql_safe_updates=0;
UPDATE company SET place="Newyork" WHERE place=NULL;

USE training;

CREATE TABLE employee (
emp_id INT primary key, 
emp_name VARCHAR(100), 
salary INT,
mgr_id INT
);

INSERT INTO employee Values
(1, "Avantika", 10000, 3), 
(2, "Shruti", 9000, 5), 
(3, "Dashrath", 9500, 5), 
(4, "Somnath", 12000, 3), 
(5, "Dhanashri", 10500, 3);

UPDATE employee SET mgr_id=5 where emp_id=5;

SELECT * FROM employee;

SELECT emp_name, salary FROM employee
WHERE salary=(
SELECT max(salary) from employee);

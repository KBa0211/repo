/*1. Create database called «lab5»*/
CREATE DATABASE lab5;

/*2. Create following table «customers» and «orders»:*/
CREATE TABLE customers(
    customer_id INT,
    cust_name VARCHAR(100),
    city VARCHAR(100),
    grade INT,
    salesman_id INT
);
CREATE TABLE orders(
    ord_no INT,
    purch_amt FLOAT,
    ord_date DATE,
    customer_id INT,
    salesman_id INT
);

CREATE TABLE salesman(
    salesman_id INT,
    name VARCHAR(100),
    city VARCHAR(100),
    commission FLOAT
);
INSERT INTO customers VALUES(3002, 'Nick Rimando', 'New York', 100,5001);
INSERT INTO customers VALUES(3005, 'Graham Zusi', 'California', 200,5002);
INSERT INTO customers VALUES(3001, 'Brad Guzan', 'London', NULL,5005);
INSERT INTO customers VALUES(3004, 'Fabian Johns', 'Paris', 300,5006);
INSERT INTO customers VALUES(3007, 'Brad Davis', 'New York', 200,5001);
INSERT INTO customers VALUES(3009, 'Geoff Camero', 'Berlin', 100,5003);
INSERT INTO customers VALUES(3008, 'Julian Green', 'London', 300,5002);

INSERT INTO orders VALUES(70001, 150.8, '2012-10-05', 3005,5001);
INSERT INTO orders VALUES(70009, 270.65, '2012-09-10', 3001,5001);
INSERT INTO orders VALUES(70002, 65.26, '2012-10-05', 3002,5001);
INSERT INTO orders VALUES(70004, 110.5, '2012-08-17', 3009,5001);
INSERT INTO orders VALUES(70007, 948.5, '2012-09-10', 3005,5001);
INSERT INTO orders VALUES(70005, 2400.6, '2012-07-27', 3007,5001);
INSERT INTO orders VALUES(70008, 5760, '2012-09-10', 3002,5001);

INSERT INTO salesman VALUES(5001,'James Hoog','New York',0.15);
INSERT INTO salesman VALUES(5002,'Nail Knite','Paris',0.13);
INSERT INTO salesman VALUES(5005,'Pit Alex','London',0.11);
INSERT INTO salesman VALUES(5006,'Mc Lyon','Paris',0.14);
INSERT INTO salesman VALUES(5003,'Lauson Hen',NULL,0.12);
INSERT INTO salesman VALUES(5007,'Paul Adam','Rome',0.13);

/*3. Select the total purchase amount of all orders.*/
SELECT SUM(purch_amt) AS total_amount FROM orders;

/*4. Select the average purchase amount of all orders*/
SELECT AVG(purch_amt) AS average_purchase_amount FROM orders;

/*5. Select how many customer have listed their names*/
SELECT COUNT(cust_name) AS cust_with_names FROM customers
    WHERE cust_name IS NOT NULL;

/*6. Select the minimum purchase amount of all the orders.*/
SELECT MIN(purch_amt) AS min_amount FROM orders;

/*7. Select customer with all information whose name ends with the
letter 'b'.*/
SELECT * FROM customers
    WHERE cust_name LIKE '%b';

/*8. Select orders which made by customers from ‘New York’.*/
SELECT o.* FROM orders o JOIN customers c ON o.customer_id = c.customer_id
    WHERE c.city = 'New York';

/*9. Select customers with all information who has order with
purchase amount more than 10.*/
SELECT c.* FROM customers c JOIN orders o ON c.customer_id = o.customer_id
    WHERE o.purch_amt > 10;

/*10. Select total grade of all customers.*/
SELECT SUM(grade) AS total_grade FROM customers;

/*11. Select all customers who have listed their names.*/
SELECT * FROM customers WHERE cust_name IS NOT NULL;

/*12. Select the maximum grade of all the customers.*/
SELECT MAX(grade) AS maximum_grade FROM customers;

/*DROP TABLE customers;*/
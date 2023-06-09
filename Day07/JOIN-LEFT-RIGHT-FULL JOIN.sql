CREATE TABLE orders(
  company_id CHAR(3),
  order_id CHAR(3),
  order_date DATE
);
INSERT INTO orders VALUES(101, 11, '17-Apr-2020');
INSERT INTO orders VALUES(102, 22, '18-Apr-2020');
INSERT INTO orders VALUES(103, 33, '19-Apr-2020');
INSERT INTO orders VALUES(104, 44, '20-Apr-2020');
INSERT INTO orders VALUES(105, 55, '21-Apr-2020');
SELECT * FROM orders;

CREATE TABLE my_companies
(
  company_id CHAR(3),
  company_name VARCHAR(20)
);
INSERT INTO my_companies VALUES(100, 'IBM');
INSERT INTO my_companies VALUES(101, 'GOOGLE');
INSERT INTO my_companies VALUES(102, 'MICROSOFT');
INSERT INTO my_companies VALUES(103, 'APPLE');
SELECT * FROM my_companies;


/*--JOINS:JOINS: 1) INNER JOIN: Ortak (Common) datayı verir.
       2) LEFT JOIN: Birinci table'ın tüm datasını verir.
       3) RIGHT JOIN: İkinci table'ın tüm datasını verir.
       4) FULL JOIN: İki table'ın da tüm datasını verir.
       5) SELF JOIN: Tek table üzerinde çalışırken iki table varmış gibi çalışılır.*/
	   
--1) INNER JOIN
--Ortak companyler için company_name, order_id ve order_date değerlerini çağırın.
SELECT mc.company_name,o.order_id,o.order_date 
FROM my_companies mc INNER JOIN orders o
ON mc.company_id=o.company_id;

SELECT company_name,order_id,order_date 
FROM my_companies INNER JOIN orders
ON my_companies.company_id=orders.company_id;

-- 2) LEFT JOIN
--my_companies table'ındaki companyler için order_id ve order_date değerlerini çağırın.
SELECT company_name,order_id,order_date 
FROM my_companies LEFT JOIN orders
ON my_companies.company_id=orders.company_id;

SELECT mc.company_name, o.order_id, o.order_date 
FROM my_companies mc  LEFT JOIN orders o
ON mc.company_id=o.company_id;

--3) RIGHT JOIN
--Orders table'ındaki company'ler için company_name, company_id ve order_date değerlerini çağırın.
select company_name, company_id,order_date
from my_companies RIGHT JOIN orders
ON my_companies.company_id=orders.company_id;


SELECT mc.company_name,o.company_id,o.order_date
FROM my_companies mc RIGHT JOIN orders o
ON mc.company_id=o.company_id;

--FULL JOIN
--İki table'dan da company_name, order_id ve order_date değerlerini çağırın
SELECT mc.company_name,o.order_id,o.order_date
FROM my_companies mc FULL JOIN orders o
ON mc.company_id=o.company_id;

--SELF JOIN
CREATE TABLE workers
(
  id CHAR(2),
  name VARCHAR(20),
  title VARCHAR(60),
  manager_id CHAR(2)
);
INSERT INTO workers VALUES(1, 'Ali Can', 'SDET', 2);
INSERT INTO workers VALUES(2, 'John Walker', 'QA', 3);
INSERT INTO workers VALUES(3, 'Angie Star', 'QA Lead', 4);
INSERT INTO workers VALUES(4, 'Amy Sky', 'CEO', 5);

SELECT * FROM workers;

--workers tablosunu kullanarak çalışanların yöneticilerini gösteren bir tablo hazırlayın.
SELECT employee.name,manager.name
FROM workers employee JOIN workers manager
ON employee.manager_id=manager.id;


SELECT employee.name AS Employee, manager.name AS Manager
FROM workers employee FULL JOIN workers manager
ON employee.manager_id=manager.id;


CREATE TABLE workers
(
  id CHAR(9),
  name VARCHAR(50),
  state VARCHAR(50),
  salary SMALLINT,
  company VARCHAR(20)
);
INSERT INTO workers VALUES(123456789, 'John Walker', 'Florida', 2500, 'IBM');
INSERT INTO workers VALUES(234567890, 'Brad Pitt', 'Florida', 1500, 'APPLE');
INSERT INTO workers VALUES(345678901, 'Eddie Murphy', 'Texas', 3000, 'IBM');
INSERT INTO workers VALUES(456789012, 'Eddie Murphy', 'Virginia', 1000, 'GOOGLE');
INSERT INTO workers VALUES(567890123, 'Eddie Murphy', 'Texas', 7000, 'MICROSOFT');
INSERT INTO workers VALUES(456789012, 'Brad Pitt', 'Texas', 1500, 'GOOGLE');
INSERT INTO workers VALUES(123456710, 'Mark Stone', 'Pennsylvania', 2500, 'IBM');

SELECT * FROM workers;
--Toplam salary değeri 2500 üzeri olan her bir çalışan için salary toplamını bulun.
SELECT name,SUM(salary) AS "Total Salary"
FROM workers
GROUP BY name
HAVING SUM(salary)>2500; --"GROUP BY ardından WHERE kullanılmaz"

--Birden fazla çalışanı olan, her bir state için çalışan toplamlarını bulun.
SELECT state,COUNT(state) AS number_of_employees
from workers
GROUP BY state
HAVING COUNT(state)>1; -->GROUP BY ile  gruplamadan sonraki şart için group by dan sonra HAVING kullanılır

--Her bir state için değeri 3000'den az olan maximum salary değerlerini bulun.
select state,MAX(salary) AS maxi_salary
from workers
group by state
having MAX(salary)<3000;

--Her bir company için değeri 2000'den fazla olan minimum salary değerlerini bulun.
select company,MIN(salary) AS mini_salary
from workers
group by company
having MIN(salary)>2000;

--Tekrarsız isimleri çağırın.
select  distinct name -- distinct clause, cagrilan terimlerden tekrarlı olanlarin sadece birincisin alir
FROM workers;

--Tekrarsız companyleri  çağırın.
select distinct company 
from workers;

--Name değerlerini company kelime uzunluklarına göre sıralayın.
select name,company
from workers
order by LENGTH(company);


--Tüm name ve state değerlerini aynı sütunda çağırarak her bir sütun değerinin uzunluğuna göre sıralayın.
select CONCAT(name,' ',state) AS name_and_state
from workers
ORDER BY length(name) + length(state);
--2.yol:
select name || ' ' || state || ' ' || length(name) + length(state) AS "Name and States"
from workers
ORDER BY LENGTH(name) + LENGTH(state);


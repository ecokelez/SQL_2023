/*
--UNION Operator: 1) İki sorgu(query) sonucunu birleştirmek için kullanılır.
                  2) Tekrarsız(unique) recordları verir.
                  3) Tek bir sütuna çok sütun koyabiliriz.
				  4) Tek bir sütuna çok sütun koyarken mevcut data durumuna dikkat etmek gerekir.
				
*/
--salary değeri 3000'den yüksek olan state değerlerini ve 2000'den küçük olan name değerlerini tekrarsız olarak bulun.
select state AS "Name and State",salary
from workers
WHERE salary >3000
UNION
select name,salary
from workers
WHERE  salary<2000;

--salary değeri 3000'den yüksek olan state değerlerini ve 2000'den küçük olan name değerlerini tekrarlı olarak bulun.
select state ,salary
from workers
where salary>3000
UNION ALL   ----------->UNION ile aynı isi yapar ancak tekrarlı degerleri verir
select name,salary
from workers
where salary<2000;

--INTERSECT Operator: İki sorgu (query) sonucunun ortak(common) değerlerini verir. Unique(tekrarsız) recordları verir.

--salary değeri 1000'den yüksek, 2000'den az olan "ortak" name değerlerini bulun.
select name
from workers 
where salary>1000
INTERSECT
select name
from workers
where salary<2000;

--salary değeri 2000'den az olan ve ve company değeri  IBM, APPLE yada MICROSOFT olan ortak "name" değerlerini bulun.

select name  --->salary'leri yazmayabiliriz
from workers
where salary<2000

INTERSECT

select name
from workers
where company IN('IBM','APPLE','MICROSOFT');

--salary değeri 2500'den fazla olan ve  state değeri  Florida ve Texas olan ortak "name" değerlerini bulun.
select name 
from workers
where salary>2500
INTERSECT
select name 
from workers
where state IN('Florida','Texas');

--salary değeri 1500'den fazla olan ve  name değeri  Eddie Murphy olan ortak "state" değerlerini bulun.
select state
from workers
where salary>1500
INTERSECT
select state
from workers
where name='Eddie Murphy';


--EXCEPT Operator :-- Bir sorgu sonucundan başka bir sorgu sonucunu çıkarmak için kullanılır. 
					--Unique(tekrarsız) recordları verir.
--salary değeri 3000'den az ve GOOGLE'da çalışmayan  name değerlerini bulun.
select name
from workers
where salary<3000

EXCEPT

select name
from workers
where company='GOOGLE';

--company  değeri IBM  olan ve  name değeri  Brad Pit olmayan  ortak "state" değerlerini bulun.
select state
from workers
where company='IBM'
EXCEPT
select state
from workers
where name='Brad Pit';

--state degeri Texas olan ve salary degeri 3500'den buyuk olmayan ortak name degerlerini bulun
select name
from workers
where state='Texas'
EXCEPT
select name
from workers
where salary>3500;

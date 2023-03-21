--LİMİT

-- listeden ilk 5 veriyi listeleyiniz
select * from kisiler limit 5;

--ilk iki veriden sonra 5 veriyi listeleyiniz
select * from kisiler limit 5 OFFSET 2 ;

-- id değeri 5 den büyük olan ilk iki veriyi listeleyiniz
select * from kisiler WHERE id>5 limit 2;

-- id değeri 3 den büyük olan ilk 3 veriyi listeleyiniz
select * from kisiler WHERE id>3 limit 3;

--  MAAŞ'ı en yüksek 3 kişinin bilgilerini listeleyiniz
select * from  kisiler ORDER by maas desc limit 3;

--  MAAŞ'ı en duusk  5 kişinin bilgilerini listeleyiniz
select * from kisiler ORDER by maas asc limit 5;

-- En yüksek maaşı alan 4. 5.  6. kişilerin bilgilerini listeleyiniz
select * from kisiler ORDER by maas desc limit 3 OFFSET 3;

-- En dusuk maaşı alan 4. 5.  kişilerin bilgilerini listeleyiniz
select * from kisiler ORDER BY maas limit 2 OFFSET 3;

-- En dusuk maaşı alan 3. 4. 5. ve 6.  kişilerin bilgilerini listeleyiniz
select * from kisiler ORDER by maas asc limit 4 OFFSET 2;

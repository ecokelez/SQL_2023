--AGGREGATE METHOD KULLANIMI --
/*
-Aggregate Methodları (SUM(Topla),COUNT(Say),MIN(EN küçük değer),MAX(En büyük değer),AVG(Ortalama))
-Subquery içinde de kullanılır
-Ancak, sorgu tek bir değer döndürüyor olmalıdır
SYNTAX: sum() şeklinde olmalı sum () arasında boşluk olmamalı
*/


select * from calisanlar2

-- 1- Çalısanlar2 tablosundaki en yüksek maaş değerini listeleyiniz
select max(maas) from calisanlar2;

--2- Calisanlar tablosundaki maaşların toplamını listeleyiniz
select sum(maas) from calisanlar2;
--3- Calıcanlar tablosundaki maas ortalamalını listeleyiniz
select AVG(maas) from calisanlar2;

select round(avg(maas)) from calisanlar2 --noktadan sonrasını(2730)yani ondalık kısmı kaldırır

SELECT round(AVG(maas),2) from calisanlar2--noktadan sonrasını(2730.77)yani ondalık kısmı 2 rakam olarak kalır

--4- Calisanlar toplasundan en düşük maası listeleyiniz;
select min(maas) from calisanlar2

--5- Calisanlar tablosundaki kaç kişinin maaş aldığını listeleyiniz;
select count(maas) from  calisanlar2

--6- Her markanin ismini, calisan sayisini ve o markaya ait calisanlarin toplam maaşini listeleyiniz
select marka_isim,calisan_sayisi,
(select SUM(maas) from calisanlar2 where marka_isim = isyeri) 
AS toplam_maas from markalar;
--7- Her markanin ismini, calisan sayisini ve o markaya ait calisanlarin maksimum ve minumum maaşini
--listeleyen bir Sorgu yaziniz. ******-- tekrar bakılacak!!!..****************
select marka_isim,calisan_sayisi,
(select MAX(maas) from calisanlar2 where marka_isim = isyeri) AS max_maas,
(select MIN(maas) from calisanlar2  where marka_isim = isyeri) AS min_maas
from markalar;


--8- Her markanin id’sini, ismini ve toplam kaç şehirde bulunduğunu listeleyen bir SORGU yaziniz.
select * from markalar
select * from calisanlar2

select marka_id,marka_isim,
(select COUNT(sehir) from calisanlar2  where marka_isim = isyeri ) 
 AS max_sehir from markalar;
 
--9- Interview Question: En yüksek ikinci maas değerini çağırın.
select MAX(maas) AS en_yüksek_ikinci_maas from calisanlar2
WHERE maas < (select MAX(maas) from calisanlar2);

--10- Interview Question: En düşük ikinci maas değerini çağırın.
select MIN(maas) AS en_dusuk_ikinci_maas from calisanlar2
where maas > (select MIN(maas) from calisanlar2);

--11- En yüksek üçüncü maas değerini bulun
select MAX(maas) AS en_yüksek_ucuncu_maas from calisanlar2
where maas < (select MAX(maas) from calisanlar2 
			  where maas < (select MAX(maas) from calisanlar2));


--12- En dusuk ucuncu maas degerini bulunuz(ODEV)  --> 2500 ?
select MIN(maas) AS  en_dusuk_ikinci_maas from calisanlar2
where maas > (select MIN(maas) from calisanlar2 
			  where maas > (select MIN(maas) from calisanlar2));




















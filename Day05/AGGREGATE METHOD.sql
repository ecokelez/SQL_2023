--AGGREGATE METHOD KULLANIMI --
/*
-Aggregate Methodları (SUM(Topla),COUNT(Say),MIN(EN küçük değer),MAX(En büyük değer),AVG(Ortalama))
-Subquery içinde de kullanılır
-Ancak, sorgu tek bir değer döndürüyor olmalıdır
SYNTAX: sum() şeklinde olmalı sum () arasında boşluk olmamalı
*/

select * from calisanlar2

-- Çalısanlar2 tablosundaki en yüksek maaş değerini listeleyiniz
SELECT  MAX(maas) from calisanlar2
--Calisanlar tablosundaki maaşların toplamını listeleyiniz
select  SUM(maas) from calisanlar2
--Calıcanlar tablosundaki maas ortalamalını listeleyiniz
SELECT  AVG(maas) from calisanlar2--(2730.7744)
select round(avg(maas)) from calisanlar2 --noktadan sonrasını(2730)yani ondalık kısmı kaldırır
SELECT round(AVG(maas),2) from calisanlar2--noktadan sonrasını(2730.77)yani ondalık kısmı 2 rakam olarak kalır

----Calisanlar toplasundan en düşük maası listeleyiniz;
select min(maas) from calisanlar2
----Calisanlar tablosundaki kaç kişinin maaş aldığını listeleyiniz;
select count(maas) from calisanlar2
-- Her markanin ismini, calisan sayisini ve o markaya ait calisanlarin toplam maaşini listeleyiniz
select marka_isim,calisan_sayisi,
(SELECT SUM(maas) from calisanlar2 	WHERE marka_isim=isyeri)
AS toplam_maas from markalar
 
-- Her markanin ismini, calisan sayisini ve o markaya ait calisanlarin maksimum ve minumum maaşini
--listeleyen bir Sorgu yaziniz. ******-- tekrar bakılacak!!!..****************
SELECT marka_isim,calisan_sayisi,
(select max(maas) from calisanlar2 WHERE marka_isim=isyeri) AS maximum_maas,
(select min(maas) from calisanlar2 	where marka_isim=isyeri) AS minumum_maas 
from markalar;

--Her markanin id’sini, ismini ve toplam kaç şehirde bulunduğunu listeleyen bir SORGU yaziniz.
SELECT marka_id,marka_isim,
(SELECT count(sehir) from calisanlar2 WHERE marka_isim=isyeri) AS maxi_sehir from markalar

--Interview Question: En yüksek ikinci maas değerini çağırın.
SELECT max(maas) AS enYuksek_ikinci_maas from calisanlar2 
WHERE maas < (select max(maas) from calisanlar2 )

----Interview Question: En düşük ikinci maas değerini çağırın.
SELECT min(maas) AS en_düşük_ikinci_maas from calisanlar2 
WHERE maas >(select min(maas) from calisanlar2 ) ;

--En yüksek üçüncü maas değerini bulun
select MAX(maas) AS enYuksek_ucuncu_maas from calisanlar2
WHERE maas<(select max(maas) from calisanlar2 WHERE maas< (select max(maas) from calisanlar2))

--En dusuk ucuncu maas degerini bulunuz(ODEV)  --> 2500 ?
SELECT min(maas) AS endusuk_ucuncu_maas from calisanlar2
WHERE maas> (select min (maas) from calisanlar2 WHERE maas >(SELECT min(maas) from calisanlar2));


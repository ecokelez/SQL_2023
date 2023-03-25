CREATE TABLE sirketler
(
	sirket_id int,
	sirket_isim VARCHAR(20)
);
INSERT INTO sirketler VALUES(100, 'Toyota');
INSERT INTO sirketler VALUES(101, 'Honda');
INSERT INTO sirketler VALUES(102, 'Ford');
INSERT INTO sirketler VALUES(103, 'Hyundai');
CREATE TABLE siparisler
(
	siparis_id int,
	sirket_id int,
	siparis_tarihi DATE
);
INSERT INTO siparisler VALUES(11, 101, '2022-04-17');
INSERT INTO siparisler VALUES(22, 102, '2022-04-18');
INSERT INTO siparisler VALUES(33, 103, '2022-04-19');
INSERT INTO siparisler VALUES(44, 104, '2022-04-20');
INSERT INTO siparisler VALUES(55, 105, '2022-04-21');
select * from sirketler;
select * from siparisler;

--SORU1: Iki Tabloda sirket_id’si ayni olanlarin; sirket_ismi, siparis_id ve
  --siparis_tarihleri listeleyen bir sorgu yaziniz.
 
SELECT sirket_isim,siparis_id,siparis_tarihi
from sirketler INNER JOIN siparisler
ON sirketler.sirket_id=siparisler.sirket_id;

select  A.sirket_isim,B.siparis_id,B.siparis_tarihi
from sirketler A INNER JOIN siparisler B
ON A.sirket_id=B.sirket_id;

--SORU2: sirketler tablosundaki tum sirketleri ve bu sirketlere ait olan
 			 ---siparis_id ve siparis_tarihleri listeleyen bir sorgu yaziniz.
			 
SELECT sirket_isim,siparis_id,siparis_tarihi
from sirketler LEFT JOIN siparisler
ON sirketler.sirket_id=siparisler.sirket_id;

SELECT A.sirket_isim,B.siparis_id,B.siparis_tarihi
from sirketler A LEFT JOIN siparisler B
ON A.sirket_id=B.sirket_id;

--SORU3: siparisler  tablosundaki tum sirketleri ve bu sirketlere ait olan
 			 ---siparis_id ve siparis_tarihleri listeleyen bir sorgu yaziniz.
SELECT A.sirket_id ,A.sirket_isim,B.siparis_id,B.siparis_tarihi
from siparisler B  RIGHT JOIN sirketler A
ON A.sirket_id=B.sirket_id;

SELECT A.sirket_id ,A.sirket_isim,B.siparis_id,B.siparis_tarihi
from siparisler B  RIGHT JOIN sirketler A
ON A.sirket_id=B.sirket_id;
union all

--SORU4: siparisler tablosundaki tum siparis_id ve siparis_tarihleri ile
      --bunlara karşılık gelen sirket_isimlerini listeleyen bir sorgu yaziniz.
SELECT A.sirket_id,A.sirket_isim,B.siparis_id,B.siparis_tarihi
from sirketler as A FULL JOIN siparisler as B
ON A.sirket_id=B.sirket_id;


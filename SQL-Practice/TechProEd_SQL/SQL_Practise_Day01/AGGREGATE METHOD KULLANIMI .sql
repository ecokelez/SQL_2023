CREATE TABLE calisanlar 
(
id int, 
isim VARCHAR(50), 
sehir VARCHAR(50), 
maas int, 
isyeri VARCHAR(20)
);
INSERT INTO calisanlar VALUES(123456789, 'Ali Seker', 'Istanbul', 2500, 'Vakko');
INSERT INTO calisanlar VALUES(234567890, 'Ayse Gul', 'Istanbul', 1500, 'LCWaikiki');
INSERT INTO calisanlar VALUES(345678901, 'Veli Yilmaz', 'Ankara', 3000, 'Vakko');
INSERT INTO calisanlar VALUES(456789012, 'Veli Yilmaz', 'Izmir', 1000, 'Pierre Cardin');
INSERT INTO calisanlar VALUES(567890123, 'Veli Yilmaz', 'Ankara', 7000, 'Adidas');
INSERT INTO calisanlar VALUES(456789012, 'Ayse Gul', 'Ankara', 1500, 'Pierre Cardin');
INSERT INTO calisanlar VALUES(123456710, 'Fatma Yasa', 'Bursa', 2500, 'Vakko');
    
CREATE TABLE markalar
(
marka_id int, 
marka_isim VARCHAR(20), 
calisan_sayisi int
);
    
INSERT INTO markalar VALUES(100, 'Vakko', 12000);
INSERT INTO markalar VALUES(101, 'Pierre Cardin', 18000);
INSERT INTO markalar VALUES(102, 'Adidas', 10000);
INSERT INTO markalar VALUES(103, 'LCWaikiki', 21000);
    
select * from calisanlar;
select * from markalar;

-- SORU1: calisan sayisi 15.000’den cok olan markalarin isimlerini ve bu
-- markada calisanlarin isimlerini ve maaşlarini listeleyin.
select isim,maas from calisanlar
WHERE isyeri IN(select marka_isim from markalar WHERE calisan_sayisi>15000)

-- SORU2: marka_id’si 101’den büyük olan marka çalişanlarinin isim, maaş ve şehirlerini listeleyiniz. 
select isim,maas,sehir from markalar
WHERE isyeri IN(select marka_isim from markalar WHERE marka_id>101);

-- SORU3: Ankara’da calisani olan markalarin marka id'lerini ve calisan sayilarini listeleyiniz.
  select marka_id,calisan_sayisi from  markalar
  WHERE marka_isim IN(select isyeri from calisanlar WHERE sehir='Ankara');
      
-- SORU4: Her markanin ismini, calisan sayisini ve o markaya ait calisanlarin toplam maaşini listeleyen bir Sorgu yaziniz.
select marka_isim,calisan_sayisi,
(select SUM(maas) from calisanlar WHERE marka_isim=isyeri)
AS toplam_maas from markalar 

-- SORU5: Her markanin ismini, calisan sayisini ve o markaya ait calisanlarin ortalama maaşini listeleyen bir Sorgu yaziniz.
select  marka_isim,calisan_sayisi,
(select round(AVG(maas)) from calisanlar where marka_isim=isyeri)
AS ort_maas from markalar;

-- SORU6: Her markanin ismini, calisan sayisini ve o markaya ait calisanlarin maksimum ve minumum maaşini listeleyen bir Sorgu yaziniz.
select marka_isim,calisan_sayisi,
(select MIN(maas) from calisanlar where marka_isim=isyeri) AS mini_maas,
(select MAX(maas) from calisanlar where marka_isim=isyeri) AS maxi_maas  from markalar;

-- SORU7: Her markanin id’sini, ismini ve toplam kaç şehirde bulunduğunu listeleyen bir SORGU yaziniz.
select marka_id,marka_isim,(select COUNT(sehir) from calisanlar WHERE marka_isim=isyeri)
AS toplam_sehir_sayısı from markalar;

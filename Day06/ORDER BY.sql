-- ORDER BY --
-- ORDER BY cümleciği bir SORGU deyimi içerisinde belli ibr SUTUN'a göre
-- sıralama yapmak için kullanılır
--ASC-asc (ASCENDING) yazmasakta verir
--DESCENDING (DESC-desc) tersten sıralama

CREATE TABLE kisiler 
(
id int PRIMARY KEY,
ssn CHAR(9) ,
isim VARCHAR(50), 
soyisim VARCHAR(50), 
maas int,
adres VARCHAR(50) 
);
    
INSERT INTO kisiler VALUES(1, 123456789, 'Ali','Can', 3000,'Istanbul');
INSERT INTO kisiler VALUES(2, 234567890, 'Veli','Cem', 2890,'Ankara');
INSERT INTO kisiler VALUES(3, 345678901, 'Mine','Bulut',4200,'Adiyaman');
INSERT INTO kisiler VALUES(4, 256789012, 'Mahmut','Bulut',3150,'Adana');
INSERT INTO kisiler VALUES (5, 344678901, 'Mine','Yasa', 5000,'Ankara');
INSERT INTO kisiler VALUES (6, 345458901, 'Veli','Yilmaz',7000,'Istanbul');
INSERT INTO kisiler VALUES(7,113456789, 'Ali','Can', 3000,'Istanbul');
INSERT INTO kisiler VALUES(8,224567890, 'Veli','Cem', 2890,'Ankara');
INSERT INTO kisiler VALUES(9,335678901, 'Mine','Bulut',4200,'Ankara');
INSERT INTO kisiler VALUES(10,446789012, 'Mahmut','Bulut',3150,'Istanbul');
INSERT INTO kisiler VALUES (11,554678901, 'Mine','Yasa', 5000,'Ankara');
INSERT INTO kisiler VALUES (12,665458901, 'Veli','Yilmaz',7000,'Istanbul');

-- kisiler tablosunu adres'e göre sıralayarak sorgulayınız.
select * from  kisiler ORDER BY adres;
select * from kisiler ORDER BY adres asc; -- -> ASC-asc (ASCENDING) yazmasakta verir

-- kisiler tablosunu adres'e  göre tersten sıralayarak sorgulayınız.
select * from kisiler ORDER BY adres desc; --DESCENDING (DESC-desc) tersten sıralama
-- kisiler tablosunda maas'a göre buyukten kucuge dogru sıralayınız
select * from kisiler ORDER by maas desc;
-- ismi Mine olanları, maas a göre AZALAN sırada sorgulayınız
select * from kisiler WHERE isim='Mine' ORDER by maas desc;
-- soyismi 'i Bulut olanları maas sıralı olarak sorgulayınız.
select * from kisiler WHERE soyisim='Bulut' ORDER by maas ;
-- soyismi 'i Cem olanları maas sıralı olarak sorgulayınız.
select * from kisiler WHERE soyisim='Cem' ORDER by maas ;
-- adres 'i İstanbul olanları maas tersten olarak sorgulayınız.
select * from kisiler WHERE adres='Istanbul' ORDER by maas desc;
-- maas' ı 5000 olanları iism  olarak sorgulayınız.
select * from kisiler WHERE maas=5000 ORDER by isim;
--ismi A ile baslayan kisileri maas olarak sıralayınız
select * from kisiler WHERE isim ~~* 'A%'ORDER by maas asc;
--ismi M ile baslayan kisileri maas olarak tersten sıralayınız
select * from kisiler WHERE isim ~~* 'M%' ORDER by maas desc;
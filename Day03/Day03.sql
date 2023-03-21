CREATE TABLE calısanlar(
id CHAR(5) PRIMARY KEY, -- not null + unique
isim VARCHAR(50) UNIQUE, -- UNIQUE --> Bir sutundaki tüm değerlerin BENZERSİZ yani tek olmasını sağlar
maas int NOT NULL,   -- NOT NULL --> Bir sutunun NULL içermemesini yani boş olmamasını sağlar
ise_baslama DATE
);


INSERT INTO calısanlar VALUES('10002', 'Mehmet Yılmaz' ,12000, '2018-04-14');
INSERT INTO calısanlar VALUES('10008', null, 5000, '2018-04-14');
--INSERT INTO calısanlar VALUES('10010', Mehmet Yılmaz, 5000, '2018-04-14'); --Unique
INSERT INTO calısanlar VALUES('10004', 'Veli Han', 5000, '2018-04-14');
INSERT INTO calısanlar VALUES('10005', 'Mustafa Ali', 5000, '2018-04-14');
--INSERT INTO calısanlar VALUES('10006', 'Canan Yaş', NULL, '2019-04-12'); --NOT NULL
INSERT INTO calısanlar VALUES('10003', 'CAN', 5000, '2018-04-14');
--INSERT INTO calısanlar VALUES('10007', 'CAN', 5000, '2018-04-14'); --UNIQUE
--INSERT INTO calısanlar VALUES('10009', 'cem', '', '2018-04-14'); --NOT NULL
INSERT INTO calısanlar VALUES('', 'osman', 2000, '2018-04-14');
--INSERT INTO calısanlar VALUES('', 'osman can', 2000, '2018-04-14'); --PRIMARY KEY
--INSERT INTO calısanlar VALUES( '10002', 'ayse Yılmaz' ,12000, '2018-04-14'); --PRIMARY KEY
--INSERT INTO calısanlar VALUES( null, 'filiz ' ,12000, '2018-04-14'); -- PRIMARY KEY


--FOREIGN KEY--
CREATE TABLE adresler
(
adres_id char(5) ,
sokak varchar(20),
cadde varchar(30),
sehir varchar(20),
CONSTRAINT fk FOREIGN KEY (adres_id) REFERENCES calısanlar(id)
);
INSERT INTO adresler VALUES('10003','Mutlu Sok', '40.Cad.','IST');
INSERT INTO adresler VALUES('10003','Can Sok', '50.Cad.','Ankara');
INSERT INTO adresler VALUES('10002','Ağa Sok', '30.Cad.','Antep');
select * from adresler;
INSERT INTO adresler VALUES('10012','Ağa Sok', '30.Cad.','Antep');
--Parent tabloda olmayan id ile child tabloya ekleme yapamayız
INSERT INTO adresler VALUES(NULL,'Ağa Sok', '30.Cad.','Antep');
--Calısanlar id ile adresler tablosundaki adres_id ile eşlesenlere bakmak için
select * from calısanlar,adresler WHERE calısanlar.id = adresler.adres_id;
DROP table calısanlar
--Parant tabloyu yani primary key olan tabloyu silmek istediğimizde tabloyu silmez
--Önce child tabloyu silmemiz gerekir

delete from calısanlar where id=10002; --parent

delete from adresler WHERE adres_id = '10002'; --child

drop table calısanlar;

-- ON DELETE CASCADE --
--Her defasında önce child tablodaki verileri silmek yerine
--ON DELETE CASCADE silme özelliğini aktif hale getirebiliriz
--Bunun için FK olan satırın en sonuna ON DELETE CASCADE komutunu yazmamız yeterli

CREATE TABLE talebeler
(
id CHAR(3) primary key,
isim VARCHAR(50),
veli_isim VARCHAR(50),
yazılı_notu int
);
select * from talebeler

INSERT INTO talebeler VALUES(123, 'Ali Can', 'Hasan',75);
INSERT INTO talebeler VALUES(124, 'Merve Gul', 'Ayse',85);
INSERT INTO talebeler VALUES(125, 'Kemal Yasa', 'Hasan',85);
INSERT INTO talebeler VALUES(126, 'Nesibe Yılmaz', 'Ayse',95);
INSERT INTO talebeler VALUES(127, 'Mustafa Bak', 'Can',99);

CREATE TABLE notlar(
talebe_id char(3),
ders_adi varchar(30),
yazili_notu int,
CONSTRAINT notlar_fk FOREIGN KEY (talebe_id) REFERENCES talebeler(id)
on delete cascade
);

INSERT INTO notlar VALUES ('123','kimya',75);
INSERT INTO notlar VALUES ('124', 'fizik',65);
INSERT INTO notlar VALUES ('125', 'tarih',90);
INSERT INTO notlar VALUES ('126', 'Matematik',90);

select * from talebeler
select * from notlar

delete from notlar where talebe_id ='123'  -- child table
delete from talebeler where id ='126'  -- on delete cascade kullandıgımız ıcın parent table'dan direkt silebildik
--Parent table'dan silebildigimiz icin chil table'dan da silinmis olur

Delete from talebeler

DROP table talebeler CASCADE;-- PARENT tablouy kaldırmak istersek Drop table  tablo_adı' ndan sonra 
--CASCADE komutunu kullanırız

alter table talebeler 
alter column isim TYPE VARCHAR(30),
ALTER COLUMN isim SET NOT NULL;

--talebeler  tablosundaki yazılı_notu sutununa 

alter table talebeler
ADD CONSTRAINT sınır CHECK(yazılı_notu>60)
--CHECK komutu ile tablodaki istedigimz sutunu sınırlandırabiliriz

INSERT INTO talebeler VALUES(128,'Mustafa CAN','Hasan',45);
-- yukarda 60'i sinir olarak belirledigimiz icin bunu eklemedi asagıdaki eror verdi
--ERROR:  new row for relation "talebeler" violates check constraint "sınır"
-- DETAIL:  Failing row contains (128, Mustafa CAN, Hasan, 45).

create table ogrenciler(
id int,
isim varchar(45),
adres varchar(100),
sinav_notu int
);

Create table ogrenci_adres
AS
SELECT id, adres from ogrenciler;

select * from ogrenciler

select * from ogrenci_adres

--Tablodaki bir sutuna PRIMARY KEY ekleme
alter table ogrenciler 
ADD PRIMARY KEY (id);

--PRIMERY KEY olusturmada 2. yol:
alter table ogrenciler
ADD CONSTRAINT pk_id PRIMARY KEY (id);

--PK'den sonra FK ataması;
alter table ogrenci_adres
ADD foreign key (id) REFERENCES ogrenciler ;

alter table ogrenciler DROP CONSTRAINT pk_id;

alter table ogrenciler DROP CONSTRAINT ogrenci_adres_id_fkey;

--Yazılı notu 85'ten buyuk olan talebe bilgileri:
Select * from talebeler WHERE yazılı_notu>85

--ismi Mustafa Bak olan talebenin tum bilgieri:
select * from talebeler where isim='Mustafa Bak'

--SELECT komutunda  --BETWEEN kosulu

create table personel
(
id char(4),
isim varchar(50),
maas int
);

insert into personel values('1001', 'Ali Can', 70000);
insert into personel values('1002', 'Veli Mert', 85000);
insert into personel values('1003', 'Ayşe Tan', 65000);
insert into personel values('1004', 'Derya Soylu', 95000);
insert into personel values('1005', 'Yavuz Bal', 80000);
insert into personel values('1006', 'Sena Beyaz', 100000);

/*
    AND (ve): Belirtilen şartların her ikiside gerçekleşiyorsa o kayıt listelenir
Bir tanesi gerçekleşmezse listelemez
    Select * from matematik sinav1 > 50 AND sınav2 > 50
Hem sınav1 hemde sınav2 alanı, 50'den büyük olan kayıtları listeler
    OR (VEYA): Belirtilen şartlardan biri gerçekleşirse, kayıt listelenir
    select * From matematik sınav>50 OR sınav2>50 
Hem sınav1 veya sınav2 alanı, 50 den büyük olan kayıtları listeler    
*/
select * from personel

select * from personel WHERE id BETWEEN '1003' and '1005';

-- 2. yol;
select * from personel WHERE id >= '1003' and id<='1005';

select * from personel WHERE isim between 'Derya Soylu' AND 'Yavuz Bal'

select * from personel WHERE maas=70000 or isim='Sena Beyaz'

--IN : Birden fazla mantıksal ifade ile tanımlayabileceğimiz durumları tek komutta yazabilme imkanı verir
--Farklı sütunlar için IN kullanılamaz

--id'si 1001,1002 ve 1004 olan personelin bilgilerini listele
select * from personel where id ='1001' or id='1002' or id ='1004';

--2. yol:
select  * from personel WHERE id IN ('1001','1002','1004');

select * from personel WHERE maas in (70000,100000);

/*
SELECT - LIKE koşulu
LIKE : Sorgulama yaparken belirli kalıp ifadeleri kullanabilmemizi sağlar
ILIKE : Sorgulama yaparken büyük/küçük harfe duyarsız olarak eşleştirir
LIKE : ~~
ILIKE : ~~*
NOT LIKE : !~~
NOT ILIKE :!~~*
% --> 0 veya daha fazla karakteri belirtir.
_ --> Tek bir karakteri belirtir

*/

-- Ismi A harfi ile baslayan personeli listele
select * from personel WHERE isim LIKE 'A%';
--Ismi t harfi ile biten personeli listele
select * from personel where isim like '%t';
--
select * from personel where isim like '_e%';

-- Isminin 3.harfi r olan personeli listeleyiniz
select * from personel WHERE isim LIKE '__r%'


﻿/*
SELECT - LIKE koşulu
LIKE : Sorgulama yaparken belirli (pattern) kalıp ifadeleri kullanabilmemizi sağlar
ILIKE : Sorgulama yaparken büyük/küçük harfe duyarsız olarak eşleştirir
LIKE : ~~
ILIKE : ~~*
NOT LIKE : !~~
NOT ILIKE :!~~*
% --> 0 veya daha fazla karakteri belirtir.
_ --> Tek bir karakteri belirtir

*/

create table personel(
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

-- Ismi A harfi ile baslayan personeli listele
select * from personel where isim like 'A%';
-- Isminin 2. harfi e olan personeli listeleyiniz
select * from personel where isim like '_e%';
-- Ismi t harfi ile biten personeli listele
select * from personel where isim like '%t';

-- 'a' ile başlayıp 'n' ile biten personel isimlerini listeleyiniz
select isim from personel where isim ~~* 'a%n';

-- ikinci karakteri 'a' ve dördüncü karakteri 'u' olan personel isimlerini listeleyiniz
select  isim from personel where isim ~~* '_a_u%';

-- İçinde 'e' ve 'r' bulunan personel isimlerini listeleyiniz
select * from personel where isim ILIKE '%e%' and isim ilike '%r%';
--select  isim from personel where isim ~~* '%e%' and isim ~~* '%r%';

-- İçinde 'e' ve 'r' bulunan personel isimlerini listeleyiniz
select * from personel where isim ILIKE '%e%' or isim ilike '%r%';

-- 2. harfi e olup diğer harflerinde y olan personeli listeleyiniz
select * from personel where isim ~~* '_e%y%';

-- a harfi olmayan personeli listeleyin
--// select * from personel where isim not like '%a%';
select * from personel where isim !~~ '%a%';

-- 1. harfi A ve 7. harfi a olan personeli listeleyin
select * from personel where isim like 'A_____a%';
--//select * from personel where isim ~~* 'A_____a%';

--Sondan ikinci karakteri 'r' olan "isim" değerlerini listeleyiniz.
select * from personel where isim ~~* '%r_';

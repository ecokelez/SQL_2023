-- IS NULL, IS NOT NULL, COALESCE -- 

/*
IS NULL ve IS NOT NULL boolean operatörleridir. Bir ifadenin NULL olup olmadığını kontrol eder.

COALESCE (Birleştirme) ise bir fonksiyondur ve içerisindeki parametrelerden NULL olmayan ilk ifadeyi döndürür.
*/

CREATE TABLE insanlar 
(	ssn CHAR(9), -- Social Security Number	
isim VARCHAR(50), 	
adres VARCHAR(50) 
);

INSERT INTO insanlar VALUES('123456789', 'Ali Can', 'Istanbul');
INSERT INTO insanlar VALUES('234567890', 'Veli Cem', 'Ankara');
INSERT INTO insanlar VALUES('345678901', 'Mine Bulut', 'Izmir');
INSERT INTO insanlar (ssn, adres) VALUES('456789012', 'Bursa');
INSERT INTO insanlar (ssn, adres) VALUES('567890123', 'Denizli');
INSERT INTO insanlar (adres) VALUES('Sakarya');
INSERT INTO insanlar (ssn) VALUES('999111222');

select * from insanlar;

-- İsmi null olanları sorgulayınız 
select * from insanlar where isim is null;
-- İsmi null omayanları listeleyelim
select * from insanlar where isim is not null;

-- isim 'i NULL olan kişilerin isim'ine NO NAME atayınız.
UPDATE insanlar 
SET isim = 'NO NAME'
WHERE isim is null;
select * from insanlar;
-- Tabloyu bir önceki soruyu çözmeden önceki haline geri getirin
UPDATE insanlar
set isim = null
where isim =  'NO NAME';

--  Not: Coklu degisimde her degisim icin set ... where isim is null gibi ifade yazmamak icin
-- COALESCE (birlestirme) kullanilir

/* 
isim 'i NULL olanlara 'Henuz isim girilmedi'
adres 'i NULL olanlara 'Henuz adres girilmedi'
ssn 'i NULL olanlara ' no ssn' atayalım.
*/
select * from insanlar;

UPDATE insanlar
SET isim = coalesce (isim,'Henuz isim girilmedi'),
    adres = coalesce (adres,'Henuz adres girilmedi'),
	ssn = coalesce (ssn,'no ssn');
	



























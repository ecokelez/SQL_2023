/*
DDL-DATA DEFINITION LANGUAGE DATA
CREATE-
ALTER-DROPCACHE CACHE
*/

--CREATE TABLO OLUSTURMA

CREATE table ogrenci(
 
ogr_no int,

ogr_isim VARCHAR(30),

notlar REAL,

yas INT,

adres VARCHAR(50),

kayıt_tarih DATE
);

--VAR OLAN BİR TABLODAN YENİ BİR TABLO OLUSTURMA-

CREATE table ogr_notları

AS

SELECT ogr_no, notlar FROM ogrenci;


SELECT * FROM ogrenci;

SELECT * FROM ogr_notları;

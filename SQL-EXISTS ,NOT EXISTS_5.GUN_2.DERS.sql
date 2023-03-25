-- EXISTS , NOT EXISTS --
-- EXISTS condition subquerylerde kullanilir
-- IN ifadesinin kullanimina benzer
-- EXISTS , NOT EXISTS ifadeleri de altsorgudan getirilen degerlerin-->
-- içerisinde bir degerin olmasi veya olmamasi durumunda islem yapilmasini saglar
-- Exists true false gibidir --> Boolean

CREATE TABLE mart(
urun_id int,
musteri_isim varchar(50),
urun_isim varchar(50)
);

INSERT INTO mart VALUES (10, 'Mark', 'Honda');
INSERT INTO mart VALUES (20, 'John', 'Toyota');
INSERT INTO mart VALUES (30, 'Amy', 'Ford');
INSERT INTO mart VALUES (20, 'Mark', 'Toyota');
INSERT INTO mart VALUES (10, 'Adam', 'Honda');
INSERT INTO mart VALUES (40, 'John', 'Hyundai');
INSERT INTO mart VALUES (20, 'Eddie', 'Toyota');

CREATE TABLE nisan(
urun_id int ,
musteri_isim varchar(50),
urun_isim varchar(50)
);
INSERT INTO nisan VALUES (10, 'Hasan', 'Honda');
INSERT INTO nisan VALUES (10, 'Kemal', 'Honda');
INSERT INTO nisan VALUES (20, 'Ayse', 'Toyota');
INSERT INTO nisan VALUES (50, 'Yasar', 'Volvo');
INSERT INTO nisan VALUES (20, 'Mine', 'Toyota');

select * from mart
select * from nisan

-- 1- MART VE NİSAN aylarında aynı URUN_ID ile satılan ürünlerin
  --URUN_ID’lerini listeleyen ve aynı zamanda bu ürünleri MART ayında alan
  --MUSTERI_ISIM 'lerini listeleyen bir sorgu yazınız.
select urun_id,musteri_isim from mart
where EXISTS (select urun_id from nisan where mart.urun_id = nisan.urun_id);
  
  
  
--2- Her iki ayda birden satılan ürünlerin URUN_ISIM'lerini ve bu ürünleri
--NİSAN ayında satın alan MUSTERI_ISIM'lerini listeleyen bir sorgu yazınız.
select urun_isim,musteri_isim from nisan
where exists (select urun_isim from mart where nisan.urun_isim = mart.urun_isim);


--3-Her iki ayda ortak satilmayan ürünlerin URUN_ISIM'lerini ve  bu ürünleri
 --NİSAN ayında satın alan MUSTERI_ISIM'lerini listeleyen bir sorgu yazınız.
 select urun_isim,musteri_isim from nisan
 where NOT  EXISTS (select urun_isim from mart where nisan.urun_isim = mart.urun_isim );
 
 --4-Her iki ayda ortak satilmayan ürünlerin urun_id'lerini ve  bu ürünleri
 --Mart ayında satın alan MUSTERI_ISIM'lerini listeleyen bir sorgu yazınız.
 select urun_id,musteri_isim from mart
 where not exists (select urun_id from nisan where mart.urun_id = nisan.urun_id);
 
 
 --5-Her iki ayda birden satılan ürünlerin urun_id'lerini ve bu ürünleri
-- NİSAN ayında satın alan URUN_ISIM'lerini listeleyen bir sorgu yazınız.











-- SQL_Practise 1                                                                             
create table personel                                                                         
(                                                                                            
id serial primary key  , --serial id'yi auto increment gibi otomatik arttırır                                                                    
isim varchar(20),                                                                             
yas int,                                                                                      
maas int,                                                                                     
email varchar(30)                                                                            
);                                                                                            
																							 
-- Auto_increment kullandığımızda otomatik olarak id ler 1 den başlayacaktır.                 
insert into personel (isim, yas, maas, email) values ('Ali', 39, 12500, 'ali@gmail.com');
insert into personel (isim, yas, maas, email) values ('Derya', 28, 15000, 'derya@yahoo.com');
insert into personel (isim, yas, maas, email) values ('Sevim', 24, 25000, 'sevim@hotmail.com');
insert into personel (isim, yas, maas, email) values ('Yusuf', 32, 18000, 'yusuf@gmail.com');
insert into personel (isim, yas, maas, email) values ('Halil', 48, 22000, 'halil@gmail.com');
insert into personel (isim, yas, maas, email) values ('Ece', 54, 21000, 'ece@gmail.com');
insert into personel (isim, yas, maas, email) values ('Can', 38, 19000, 'can@gmail.com');
insert into personel (isim, yas, maas, email) values ('Elif', 27, 14000, 'elif@gmail.com');
insert into personel (isim, yas, maas, email) values ('Ezgi', 38, 21000, 'ezgi@gmail.com');
insert into personel (isim, yas, maas, email) values ('Sena', 25, 11000, NULL);

--1) Tablo bilgilerini listeleyiniz.
select * from personel;
-- 2) isim, yaş ve maaş bilgilerini listeleyiniz
select  isim,yas,maas from personel; 
-- 3) id'si 8 olan personel bilgilerini listeleyiniz
select * from personel WHERE id=8;
-- 4) id'si 5 olan personelin isim, yaş ve email bilgilerini listeleyiniz
select isim,yas,email from personel where id=5 ;
select id,isim,yas,email from personel where id=5 ;
-- 5) 30 yaşından büyük personel bilgilerini listeleyiniz.
select * from personel where yas>30;
-- 6) maası 21000 olmayan personel bilgilerini listeleyiniz.
select * from personel where  maas!=21000;
select * from personel where  maas<>21000;
--7)isimi a harfi ile baslayan personel bilgleri
select * from personel where isim ~~* 'a%';
--8)-- :sunglasses: ismi n harfi ile biten personel bilgilerini listeleyiniz.
select * from personel where isim ~~*'%n';
select * from personel where isim ~* 'n$';
--9) email adresi gmail olan personel bilgilerini listeleyiniz.
select * from personel where email similar to '%gmail%';
select * from personel where email ~~* '%gmail.com';
--10)
select * from personel where email !~~* '%gmail%';
select * from personel where email not ilike '_gmail%';
select * from personel where email !~ '(.*)gmail(.*)';
--11)id'si 3,5,7,9 olan personel bilgileri
select * from personel where id IN(3,5,7,9);
-- 12) yaşı 39,48 ve 54 olmayan personel bilgilerini listeleyiniz.
select * from personel where yas not IN(39,48,54);
-- 13) yaşı 30 ve 40 arasında olan personel bilgilerini listeleyiniz.
select * from personel where yas between 30 and 40;
select * from personel where yas>30  and  yas<40;
-- 14) yaşı 30 ve 40 arasında olmyan personel bilgilerini listeleyiniz.
select * from personel where yas<30  or yas>40;
select * from personel where yas not between 30 and 40;
-- 15) emaili null olan personel bilgilerini listeleyiniz.
select * from personel WHERE isim is null;
-- 16) personel bilgilerini yaşa göre sıralayınız.
select * from personel ORDER by yas;
-- 17) personel bilgilerini maaşa göre sıralayınız.
select * from personel ORDER by maas asc;
-- 18) personelin yaşlarını büyükten küçüğe doğru sıralayınız.
select * from personel ORDER by yas desc;
--19) personelin maaşlarını büyükten küçüğe doğru sıralayınız.
select * from personel ORDER by maas desc;
-- 20) En yüksek maaş olan ilk 3 personel bilgilerini sıralayınız
select * from personel ORDER by maas desc limit 3;
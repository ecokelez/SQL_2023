create table personel                                                                         
(                                                                                             
id serial primary key  ,   -- serial id yi auto increment gibi otomatik artirir                                                                  
isim  varchar(20),                                                                             
yas int,                                                                                      
maas int,                                                                                     
email varchar(30)                                                                             
);                                                                                            
                                                                                              
-- auto_increment kullandığımızda otomatik olarak id ler 1 den başlayacaktır.                 
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


-- 1) Tablo bilgilerini listeleyiniz.
SELECT * FROM personel
-- 2) isim, yaş ve maaş bilgilerini listeleyiniz
select isim,yas,maas from personel
-- 3) id'si 8 olan personel bilgilerini listeleyiniz
select * from personel where id=8;
-- 4) id'si 5 olan personelin isim, yaş ve email bilgilerini listeleyiniz
select id,isim,yas,email from personel where id=5;
-- 5) 30 yaşından büyük personel bilgilerini listeleyiniz.
select * from personel where yas>3;
-- 6) maası 21000 olmayan personel bilgilerini listeleyiniz.
select * from personel where maas!=21000;
select * from personel where maas <>21000;
-- 7) ismi a harfi ile başlayan personel bilgilerini listeleyiniz.
select * from personel where isim ~* '^a(.*)';
select * from personel where isim ~~* 'A%' or isim ~~* 'a%';
select * from personel where isim similar to '(a|A)%';
-- 8) ismi n harfi ile biten personel bilgilerini listeleyiniz.
select * from personel where isim ilike '%n';
select * from personel where isim ~ '(.*)[n]$';
-- 9) email adresi gmail olan personel bilgilerini listeleyiniz.
select * from personel where email similar to '%gmail%';
-- 10) email adresi gmail olmayan personel bilgilerini listeleyiniz.
select * from personel where email not like '%gmail%';
select * from personel where email !~~ '%gmail%';
-- 11) id'si 3,5,7 ve 9 olan personel bilgilerini listeleyiniz.
select * from personel where id=3 or id=5 or id=7 or id=9;
select * from personel where id IN(3,5,7,9);
-- 12) yaşı 39,48 ve 54 olmayan personel bilgilerini listeleyiniz.
select * from personel where yas !=39 and yas!=48 and yas!=54;
select * from personel where yas  NOT IN(39,48,54);
-- 13) yaşı 30 ve 40 arasında olan personel bilgilerini listeleyiniz.
select * from personel where yas between 30 and 40;
select * from personel where yas>30 and yas<40;
-- 14) yaşı 30 ve 40 arasında olmyan personel bilgilerini listeleyiniz.
select * from personel where yas<30 or yas>40;
select * from personel where yas not between 30 and 40;
-- 15) emaili null olan personel bilgilerini listeleyiniz
select * from personel where email is null
-- 17) personel bilgilerini maaşa göre sıralayınız.
select * from personel ORDER BY maas;
-- 16) personel bilgilerini yaşa göre sıralayınız.
select * from personel ORDER BY yas;
-- 18) personelin yaşlarını büyükten küçüğe doğru sıralayınız.
select * from personel ORDER BY yas desc;
-- 19) personelin maaşlarını büyükten küçüğe doğru sıralayınız
select * from personel ORDER BY maas desc;
select maas from personel order by maas desc;
-- 20) En yüksek maaş olan ilk 3 personel bilgilerini sıralayınız
select * from personel ORDER BY maas desc limit 3;
--Interview Question: En yüksek ikinci maas değerini çağırın.
select * from personel  ORDER BY maas desc limit 1 OFFSET 1;
select MAX(maas) AS en_yuksek_ikinci_maas from personel
where maas<(select MAX(maas) from personel);
----Interview Question: En düşük ikinci maas değerini çağırın.
select min(maas) AS en_dusuk_ikinci_maas from personel
where maas>(select min(maas) from personel);
SELECT * FROM personel ORDER BY maas asc limit 1 OFFSET 1;
--En yüksek üçüncü maas değerini bulun
select MAX(maas) AS en_yuksek_ucuncu_maas from personel
where maas<(select MAX(maas) from personel where maas< (select MAX(maas) from personel));

select * from personel ORDER BY maas desc limit 1 OFFSET 2;

--En dusuk ucuncu maas degerini bulunuz(ODEV)  --> 2500 ?
select min(maas) AS en_dusuk_ucuncu_maas from personel
where maas>(select min(maas) from personel where maas>(select min(maas) from personel));

select * from personel order by maas asc limit 1 offset 2;
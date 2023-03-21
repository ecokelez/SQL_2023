
/*
-- GROUP BY -- HAVİNG --
HAVING ifadesinin işlevi WHERE ifadesininkine çok benziyor. Ancak kümeleme fonksiyonları ile
WHERE ifadesi birlikte kullanılmadığında HAVING ifadesine ihtiyac duyulmuştur
GROUP BY ile kullanılır gruplamadan sonraki şart için group by dan sonra HAVING kullanılır
*/
--Maaş ortalaması 3000’den fazla olan ülkelerdeki erkek çalışanların maaş ortalaması.
SELECT ulke,round(AVG(maas)) from personel 
WHERE cinsiyet='E'
group by ulke 
having AVG(maas)>3000;

SELECT ulke,round(AVG(maas)) AS maas_ort from personel 
WHERE cinsiyet='E'
group by ulke 
having AVG(maas)>3000;

--Maaş ortalaması 4000’den fazla olan ülkelerdeki erkek çalışanların maaş ortalaması.
select ulke,AVG(maas) AS  ort_maas from personel
WHERE cinsiyet='E'
GROUP BY ulke
HAVING AVG(maas)>4000;

--Yas ortalaması 35’den fazla olan ülkelerdeki bayan çalışanların maaş ortalaması.
select ulke, round(AVG(yas)) AS ort_yas , round(AVG(maas)) AS  ort_maas from personel
WHERE cinsiyet='K'
group by ulke
having avg(yas)>35;


--Erkek çalışanların sayısı 1’den fazla olan ülkelerin maaş ortalamasını getiren sorgu(ODEV)

select ulke,round(AVG(maas)) AS  ort_maas,COUNT(cinsiyet) AS calisan_sayisi from personel 
WHERE cinsiyet='E'
group by ulke
having count(cinsiyet)>1;

-- 2. yol:
select ulke,round(avg(maas)) as maas_ort from personel
where cinsiyet ='E'
group by ulke
having count(cinsiyet='E')>1;
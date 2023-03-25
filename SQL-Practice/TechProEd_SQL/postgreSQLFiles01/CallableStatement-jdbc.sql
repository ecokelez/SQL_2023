--Function olusturma
 --//1. Örnek: İki parametre ile çalışıp bu parametreleri toplayarak return yapan bir fonksiyon oluşturun.
CREATE OR REPLACE FUNCTION toplamaF(x NUMERIC, y NUMERIC)
RETURN NUMERIC
LANGUAGE plpgsql
AS
$$
BEGIN


RETURN x+y;

END
$$

SELECT * FROM toplamaF(15,25) AS toplam;


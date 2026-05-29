USE AdventureWorks2022;

SELECT TOP 5 AdSoyad FROM dbo.TEM_Musteri 
WHERE KaynakSistem = 'AdventureWorks';


UPDATE dbo.TEM_Musteri
SET AdSoyad = (
    SELECT STRING_AGG(
        UPPER(LEFT(value, 1)) + LOWER(SUBSTRING(value, 2, LEN(value))),
        ' '
    )
    FROM STRING_SPLIT(AdSoyad, ' ')
    WHERE value != ''
)
WHERE KaynakSistem = 'AdventureWorks';

SELECT TOP 5 AdSoyad FROM dbo.TEM_Musteri 
WHERE KaynakSistem = 'AdventureWorks';

USE AdventureWorks2022;

SELECT 
    'AdSoyad' AS Kolon, COUNT(*) AS NULL_Sayisi 
FROM dbo.STG_Musteri WHERE AdSoyad IS NULL
UNION ALL
SELECT 'Sehir', COUNT(*) 
FROM dbo.STG_Musteri WHERE Sehir IS NULL
UNION ALL
SELECT 'Ulke', COUNT(*) 
FROM dbo.STG_Musteri WHERE Ulke IS NULL
UNION ALL
SELECT 'Telefon', COUNT(*) 
FROM dbo.STG_Musteri WHERE Telefon IS NULL
UNION ALL
SELECT 'Email', COUNT(*) 
FROM dbo.STG_Musteri WHERE Email IS NULL;

SELECT DISTINCT Ulke, COUNT(*) AS Adet
FROM dbo.STG_Musteri
WHERE Ulke IS NOT NULL
GROUP BY Ulke
ORDER BY Ulke;

SELECT ID, AdSoyad, Email
FROM dbo.STG_Musteri
WHERE Email IS NOT NULL
AND Email NOT LIKE '%@%.%';

SELECT DISTINCT 
    LEFT(Telefon, 5) AS TelefonBaslangic,
    COUNT(*) AS Adet
FROM dbo.STG_Musteri
WHERE Telefon IS NOT NULL
GROUP BY LEFT(Telefon, 5)
ORDER BY Adet DESC;

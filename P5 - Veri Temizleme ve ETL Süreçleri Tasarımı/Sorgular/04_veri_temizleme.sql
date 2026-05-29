USE AdventureWorks2022;
GO

IF OBJECT_ID('dbo.TEM_Musteri', 'U') IS NOT NULL
    DROP TABLE dbo.TEM_Musteri;
GO

CREATE TABLE dbo.TEM_Musteri (
    ID INT IDENTITY PRIMARY KEY,
    KaynakSistem NVARCHAR(50),
    KaynakID NVARCHAR(50),
    AdSoyad NVARCHAR(200),
    Sehir NVARCHAR(100),
    Ulke NVARCHAR(100),
    Telefon NVARCHAR(50),
    Email NVARCHAR(200),
    VeriKalitesi NVARCHAR(50),
    YuklemeTarihi DATETIME DEFAULT GETDATE()
);
GO

INSERT INTO dbo.TEM_Musteri
(KaynakSistem, KaynakID, AdSoyad, Sehir, Ulke, Telefon, Email, VeriKalitesi)
SELECT
    KaynakSistem,
    KaynakID,
    TRIM(
        UPPER(LEFT(TRIM(AdSoyad), 1)) + 
        LOWER(SUBSTRING(TRIM(AdSoyad), 2, LEN(TRIM(AdSoyad))))
    ) AS AdSoyad,
    CASE 
        WHEN Sehir IS NULL THEN 'Bilinmiyor'
        ELSE UPPER(LEFT(TRIM(Sehir), 1)) + LOWER(SUBSTRING(TRIM(Sehir), 2, LEN(TRIM(Sehir))))
    END AS Sehir,
    ISNULL(Ulke, 'Bilinmiyor') AS Ulke,
    CASE 
        WHEN Telefon IS NULL THEN 'Bilinmiyor'
        ELSE Telefon
    END AS Telefon,
    ISNULL(Email, 'Bilinmiyor') AS Email,
    CASE
        WHEN Sehir IS NOT NULL AND Telefon IS NOT NULL AND Email IS NOT NULL THEN 'TAM'
        WHEN Sehir IS NULL AND Telefon IS NULL AND Email IS NULL THEN 'EKSIK'
        ELSE 'KISMI'
    END AS VeriKalitesi
FROM dbo.STG_Musteri
WHERE AdSoyad IS NOT NULL
AND TRIM(AdSoyad) != '';

SELECT VeriKalitesi, COUNT(*) AS Adet
FROM dbo.TEM_Musteri
GROUP BY VeriKalitesi;

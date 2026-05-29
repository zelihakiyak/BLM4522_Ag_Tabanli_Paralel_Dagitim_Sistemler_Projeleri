USE AdventureWorks2022;
GO

IF OBJECT_ID('dbo.Hedef_Musteri', 'U') IS NOT NULL
    DROP TABLE dbo.Hedef_Musteri;
GO

CREATE TABLE dbo.Hedef_Musteri (
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

INSERT INTO dbo.Hedef_Musteri
(KaynakSistem, KaynakID, AdSoyad, Sehir, Ulke, Telefon, Email, VeriKalitesi)
SELECT
    KaynakSistem,
    KaynakID,
    AdSoyad,
    Sehir,
    Ulke,
    Telefon,
    Email,
    VeriKalitesi
FROM dbo.TEM_Musteri;

SELECT 
    KaynakSistem,
    COUNT(*) AS ToplamKayit,
    COUNT(CASE WHEN Email != 'Bilinmiyor' THEN 1 END) AS EmailVar,
    COUNT(CASE WHEN Sehir != 'Bilinmiyor' THEN 1 END) AS SehirVar,
    COUNT(CASE WHEN Telefon != 'Bilinmiyor' THEN 1 END) AS TelefonVar
FROM dbo.Hedef_Musteri
GROUP BY KaynakSistem;

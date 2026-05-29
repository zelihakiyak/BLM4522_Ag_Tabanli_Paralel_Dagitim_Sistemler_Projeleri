USE AdventureWorks2022;
GO

IF OBJECT_ID('dbo.STG_Musteri', 'U') IS NOT NULL
    DROP TABLE dbo.STG_Musteri;
GO

CREATE TABLE dbo.STG_Musteri (
    ID INT IDENTITY PRIMARY KEY,
    KaynakSistem NVARCHAR(50),
    KaynakID NVARCHAR(50),
    AdSoyad NVARCHAR(200),
    Sehir NVARCHAR(100),
    Ulke NVARCHAR(100),
    Telefon NVARCHAR(50),
    Email NVARCHAR(200),
    YuklemeTarihi DATETIME DEFAULT GETDATE()
);
GO

INSERT INTO dbo.STG_Musteri 
(KaynakSistem, KaynakID, AdSoyad, Sehir, Ulke, Telefon, Email)
SELECT 
    'Northwind',
    CustomerID,
    ContactName,
    City,
    Country,
    Phone,
    NULL
FROM Northwind.dbo.Customers;

INSERT INTO dbo.STG_Musteri 
(KaynakSistem, KaynakID, AdSoyad, Sehir, Ulke, Telefon, Email)
SELECT 
    'AdventureWorks',
    CAST(p.BusinessEntityID AS NVARCHAR(50)),
    p.FirstName + ' ' + p.LastName,
    NULL,
    NULL,
    NULL,
    e.EmailAddress
FROM Person.Person p
JOIN Person.EmailAddress e ON p.BusinessEntityID = e.BusinessEntityID
WHERE p.PersonType = 'SC';

SELECT KaynakSistem, COUNT(*) AS Adet 
FROM dbo.STG_Musteri 
GROUP BY KaynakSistem;

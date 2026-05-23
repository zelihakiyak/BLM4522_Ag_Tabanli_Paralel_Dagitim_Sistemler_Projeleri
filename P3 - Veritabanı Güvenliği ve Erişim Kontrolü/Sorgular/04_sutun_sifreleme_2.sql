USE AdventureWorks2022;

CREATE MASTER KEY 
ENCRYPTION BY PASSWORD = 'MasterKey123!';

GO

CREATE CERTIFICATE ColumnEncrypt_Cert
WITH SUBJECT = 'Kolon Sifreleme Sertifikasi';

GO

CREATE SYMMETRIC KEY ColumnEncrypt_Key
WITH ALGORITHM = AES_256
ENCRYPTION BY CERTIFICATE ColumnEncrypt_Cert;

GO

CREATE TABLE dbo.HassasVeriler (
    ID INT IDENTITY PRIMARY KEY,
    AdSoyad NVARCHAR(100),
    TCKimlik VARBINARY(256),  
    Email NVARCHAR(100)
);
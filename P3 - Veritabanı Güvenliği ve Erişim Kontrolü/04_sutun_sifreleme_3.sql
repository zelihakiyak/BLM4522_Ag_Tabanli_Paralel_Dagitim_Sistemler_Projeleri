USE AdventureWorks2022;

OPEN SYMMETRIC KEY ColumnEncrypt_Key
DECRYPTION BY CERTIFICATE ColumnEncrypt_Cert;

INSERT INTO dbo.HassasVeriler (AdSoyad, TCKimlik, Email)
VALUES 
('Ahmet Yilmaz', EncryptByKey(Key_GUID('ColumnEncrypt_Key'), '12345678901'), 'ahmet@email.com'),
('Ayse Kaya',    EncryptByKey(Key_GUID('ColumnEncrypt_Key'), '98765432109'), 'ayse@email.com'),
('Mehmet Demir', EncryptByKey(Key_GUID('ColumnEncrypt_Key'), '11223344556'), 'mehmet@email.com');

GO

SELECT ID, AdSoyad, TCKimlik, Email 
FROM dbo.HassasVeriler;

GO

OPEN SYMMETRIC KEY ColumnEncrypt_Key
DECRYPTION BY CERTIFICATE ColumnEncrypt_Cert;

SELECT 
    ID,
    AdSoyad,
    CONVERT(VARCHAR(20), DecryptByKey(TCKimlik)) AS TCKimlik_Acik,
    Email
FROM dbo.HassasVeriler;

CLOSE SYMMETRIC KEY ColumnEncrypt_Key;
USE master;

CREATE MASTER KEY 
ENCRYPTION BY PASSWORD = 'MasterKey123!';

CREATE CERTIFICATE TDE_Cert
WITH SUBJECT = 'AdventureWorks TDE Sertifikasi',
     EXPIRY_DATE = '2027-12-31';

BACKUP CERTIFICATE TDE_Cert
TO FILE = 'C:\Program Files\Microsoft SQL Server\MSSQL16.SQLEXPRESS\MSSQL\Backup\TDE_Cert.cer'
WITH PRIVATE KEY (
    FILE = 'C:\Program Files\Microsoft SQL Server\MSSQL16.SQLEXPRESS\MSSQL\Backup\TDE_Cert_Key.pvk',
    ENCRYPTION BY PASSWORD = 'CertKey123!'
);
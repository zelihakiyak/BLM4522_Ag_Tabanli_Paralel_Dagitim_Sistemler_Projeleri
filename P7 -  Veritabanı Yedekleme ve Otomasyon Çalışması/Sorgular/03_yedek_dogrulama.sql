USE msdb;

SELECT 
    bs.database_name AS veritabani,
    CASE bs.type
        WHEN 'D' THEN 'Tam Yedek'
        WHEN 'I' THEN 'Diferansiyel'
        WHEN 'L' THEN 'Log Yedeði'
    END AS yedek_turu,
    bs.backup_start_date AS tarih,
    CAST(bs.backup_size / 1024.0 / 1024.0 AS DECIMAL(10,2)) AS boyut_mb,
    bmf.physical_device_name AS dosya
FROM msdb.dbo.backupset bs
JOIN msdb.dbo.backupmediafamily bmf 
    ON bs.media_set_id = bmf.media_set_id
WHERE bs.database_name = 'AdventureWorks2022'
AND bmf.physical_device_name LIKE '%P7%'
ORDER BY bs.backup_start_date DESC;

GO

USE master;

RESTORE VERIFYONLY FROM DISK = 
'C:\Program Files\Microsoft SQL Server\MSSQL16.SQLEXPRESS\MSSQL\Backup\AW_P7_Tam_2026-06-03_18-02.bak';

RESTORE VERIFYONLY FROM DISK = 
'C:\Program Files\Microsoft SQL Server\MSSQL16.SQLEXPRESS\MSSQL\Backup\AW_P7_Diff_2026-06-03_18-02.bak';

RESTORE VERIFYONLY FROM DISK = 
'C:\Program Files\Microsoft SQL Server\MSSQL16.SQLEXPRESS\MSSQL\Backup\AW_P7_Log_2026-06-03_18-02.bak';
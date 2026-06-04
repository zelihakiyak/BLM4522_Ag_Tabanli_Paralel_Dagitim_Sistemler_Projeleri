USE msdb;

SELECT 
    bs.database_name AS veritabani,
    CASE bs.type
        WHEN 'D' THEN 'Tam Yedek'
        WHEN 'I' THEN 'Diferansiyel'
        WHEN 'L' THEN 'Log Yedeði'
    END AS yedek_turu,
    bs.backup_start_date AS baslangic_tarihi,
    bs.backup_finish_date AS bitis_tarihi,
    DATEDIFF(SECOND, bs.backup_start_date, bs.backup_finish_date) AS sure_sn,
    CAST(bs.backup_size / 1024.0 / 1024.0 AS DECIMAL(10,2)) AS boyut_mb,
    bs.name AS yedek_adi,
    bmf.physical_device_name AS dosya_yolu,
    CASE 
        WHEN bmf.physical_device_name LIKE '%P7%' THEN 'P7 Projesi'
        WHEN bmf.physical_device_name LIKE '%Otomatik%' THEN 'Otomatik'
        WHEN bmf.physical_device_name LIKE '%Full%' OR 
             bmf.physical_device_name LIKE '%Full2%' THEN 'Manuel Tam'
        WHEN bmf.physical_device_name LIKE '%Diff%' THEN 'Manuel Diff'
        WHEN bmf.physical_device_name LIKE '%Log%' THEN 'Manuel Log'
        ELSE 'Diger'
    END AS kaynak
FROM msdb.dbo.backupset bs
JOIN msdb.dbo.backupmediafamily bmf 
    ON bs.media_set_id = bmf.media_set_id
WHERE bs.database_name = 'AdventureWorks2022'
ORDER BY bs.backup_start_date DESC;
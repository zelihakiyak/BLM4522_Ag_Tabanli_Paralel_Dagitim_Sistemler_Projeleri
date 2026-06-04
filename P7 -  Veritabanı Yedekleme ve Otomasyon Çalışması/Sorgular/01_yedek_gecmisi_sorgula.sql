USE msdb;

SELECT 
    bs.database_name AS veritabani,
    CASE bs.type
        WHEN 'D' THEN 'Tam Yedek'
        WHEN 'I' THEN 'Diferansiyel'
        WHEN 'L' THEN 'Log Yedeði'
    END AS yedek_turu,
    bs.backup_start_date AS baslangic,
    bs.backup_finish_date AS bitis,
    DATEDIFF(SECOND, bs.backup_start_date, bs.backup_finish_date) AS sure_sn,
    CAST(bs.backup_size / 1024.0 / 1024.0 AS DECIMAL(10,2)) AS boyut_mb,
    bmf.physical_device_name AS dosya_yolu
FROM msdb.dbo.backupset bs
JOIN msdb.dbo.backupmediafamily bmf 
    ON bs.media_set_id = bmf.media_set_id
WHERE bs.database_name = 'AdventureWorks2022'
ORDER BY bs.backup_start_date DESC;
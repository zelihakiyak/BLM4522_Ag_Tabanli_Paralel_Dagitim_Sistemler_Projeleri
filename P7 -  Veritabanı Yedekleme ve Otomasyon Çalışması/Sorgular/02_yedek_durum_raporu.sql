USE msdb;

SELECT 
    CASE bs.type
        WHEN 'D' THEN 'Tam Yedek'
        WHEN 'I' THEN 'Diferansiyel'
        WHEN 'L' THEN 'Log Yedeði'
    END AS yedek_turu,
    COUNT(*) AS toplam_adet,
    CAST(AVG(bs.backup_size / 1024.0 / 1024.0) AS DECIMAL(10,2)) AS ort_boyut_mb,
    CAST(MAX(bs.backup_size / 1024.0 / 1024.0) AS DECIMAL(10,2)) AS max_boyut_mb,
    MIN(bs.backup_start_date) AS ilk_yedek,
    MAX(bs.backup_start_date) AS son_yedek,
    AVG(DATEDIFF(SECOND, bs.backup_start_date, bs.backup_finish_date)) AS ort_sure_sn
FROM msdb.dbo.backupset bs
WHERE bs.database_name = 'AdventureWorks2022'
GROUP BY bs.type
ORDER BY bs.type;

GO

SELECT 
    MAX(backup_start_date) AS son_yedek_zamani,
    DATEDIFF(HOUR, MAX(backup_start_date), GETDATE()) AS gecen_saat,
    CASE 
        WHEN DATEDIFF(HOUR, MAX(backup_start_date), GETDATE()) > 24 
        THEN 'UYARI: 24 saatten uzun sure yedek alinmadi!'
        ELSE 'OK: Yedek guncel'
    END AS durum
FROM msdb.dbo.backupset
WHERE database_name = 'AdventureWorks2022'
AND type = 'D';
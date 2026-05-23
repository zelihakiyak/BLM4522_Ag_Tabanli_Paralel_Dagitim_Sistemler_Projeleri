USE master;

SELECT 
    event_time AS islem_zamani,
    action_id AS islem_tipi,
    server_principal_name AS kullanici,
    database_name AS veritabani,
    object_name AS tablo,
    statement AS sorgu,
    succeeded AS basarili_mi
FROM sys.fn_get_audit_file(
    'C:\Program Files\Microsoft SQL Server\MSSQL16.SQLEXPRESS\MSSQL\Backup\AW_Audit*.sqlaudit',
    DEFAULT, DEFAULT
)
ORDER BY event_time DESC;
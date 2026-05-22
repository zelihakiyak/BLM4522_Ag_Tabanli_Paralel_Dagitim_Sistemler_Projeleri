USE master;

SELECT 
    SERVERPROPERTY('IsIntegratedSecurityOnly') AS windows_only_mod,
    @@SERVERNAME AS sunucu_adi,
    SERVERPROPERTY('ProductVersion') AS versiyon;

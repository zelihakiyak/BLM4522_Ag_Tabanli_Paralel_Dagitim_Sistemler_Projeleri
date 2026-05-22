USE master;

CREATE LOGIN sql_test_user 
WITH PASSWORD = 'SqlTest123!',
     CHECK_POLICY = ON,
     CHECK_EXPIRATION = ON;

SELECT name, type_desc, is_disabled
FROM sys.server_principals
WHERE type IN ('S', 'U', 'G')
AND name NOT LIKE '##%'
AND name NOT LIKE 'NT %'
ORDER BY type_desc;
USE AdventureWorks2022;

CREATE USER sql_test_user FOR LOGIN sql_test_user;

GRANT SELECT ON Person.Person TO sql_test_user;
GRANT SELECT ON Sales.SalesOrderHeader TO sql_test_user;
GRANT UPDATE ON Sales.SalesOrderHeader TO sql_test_user;

DENY SELECT ON HumanResources.Employee TO sql_test_user;
DENY SELECT ON HumanResources.EmployeePayHistory TO sql_test_user;

SELECT 
    dp.name AS kullanici,
    o.name AS tablo_adi,
    p.permission_name AS yetki,
    p.state_desc AS durum
FROM sys.database_permissions p
JOIN sys.database_principals dp ON p.grantee_principal_id = dp.principal_id
LEFT JOIN sys.objects o ON p.major_id = o.object_id
WHERE dp.name = 'sql_test_user'
ORDER BY p.state_desc, o.name;
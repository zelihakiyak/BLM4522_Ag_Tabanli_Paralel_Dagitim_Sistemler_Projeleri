USE master;
GO

CREATE SERVER AUDIT AW_Audit
TO FILE (
    FILEPATH = 'C:\Program Files\Microsoft SQL Server\MSSQL16.SQLEXPRESS\MSSQL\Backup\',
    MAXSIZE = 10 MB,
    MAX_FILES = 5,
    RESERVE_DISK_SPACE = OFF
)
WITH (
    QUEUE_DELAY = 1000,
    ON_FAILURE = CONTINUE
);
GO

ALTER SERVER AUDIT AW_Audit WITH (STATE = ON);
GO

USE AdventureWorks2022;
GO

CREATE DATABASE AUDIT SPECIFICATION AW_DB_Audit
FOR SERVER AUDIT AW_Audit
ADD (SELECT ON Person.Person BY public),
ADD (INSERT ON Person.Person BY public),
ADD (UPDATE ON Sales.SalesOrderHeader BY public),
ADD (DELETE ON Sales.SalesOrderHeader BY public);
GO

ALTER DATABASE AUDIT SPECIFICATION AW_DB_Audit
WITH (STATE = ON);
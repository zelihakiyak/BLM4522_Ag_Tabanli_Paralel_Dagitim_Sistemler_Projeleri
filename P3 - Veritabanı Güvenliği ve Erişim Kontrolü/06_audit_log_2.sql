USE AdventureWorks2022;

SELECT TOP 5 FirstName, LastName FROM Person.Person;

UPDATE Sales.SalesOrderHeader
SET Comment = 'Audit test'
WHERE SalesOrderID = 43659;

UPDATE Sales.SalesOrderHeader
SET Comment = NULL
WHERE SalesOrderID = 43659;
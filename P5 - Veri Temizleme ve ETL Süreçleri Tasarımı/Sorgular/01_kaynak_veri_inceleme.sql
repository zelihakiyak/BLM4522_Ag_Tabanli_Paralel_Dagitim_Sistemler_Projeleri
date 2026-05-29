USE Northwind;

SELECT 
    CustomerID,
    CompanyName,
    ContactName,
    City,
    Country,
    Phone
FROM dbo.Customers;

USE AdventureWorks2022;

SELECT 
    p.BusinessEntityID,
    p.FirstName + ' ' + p.LastName AS ContactName,
    e.EmailAddress
FROM Person.Person p
JOIN Person.EmailAddress e ON p.BusinessEntityID = e.BusinessEntityID
WHERE p.PersonType = 'SC';
USE AdventureWorks2022;

DECLARE @kullanici_girdisi NVARCHAR(100);

SET @kullanici_girdisi = 'Gail';

EXEC('SELECT BusinessEntityID, FirstName, LastName 
      FROM Person.Person 
      WHERE FirstName = ''' + @kullanici_girdisi + '''');
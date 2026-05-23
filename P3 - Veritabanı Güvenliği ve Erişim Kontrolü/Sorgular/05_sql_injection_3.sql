USE AdventureWorks2022;
GO

CREATE PROCEDURE sp_GuvenliKullaniciAra
    @kullanici_adi NVARCHAR(100)
AS
BEGIN
    SELECT BusinessEntityID, FirstName, LastName 
    FROM Person.Person 
    WHERE FirstName = @kullanici_adi;
END;

GO

EXEC sp_GuvenliKullaniciAra @kullanici_adi = 'Gail';

GO

EXEC sp_GuvenliKullaniciAra @kullanici_adi = ''' OR ''1''=''1';
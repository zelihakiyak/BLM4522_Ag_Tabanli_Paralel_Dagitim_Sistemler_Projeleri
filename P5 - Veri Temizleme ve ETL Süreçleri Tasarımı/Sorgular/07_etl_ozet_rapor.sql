USE AdventureWorks2022;

SELECT 
    'STG_Musteri (Ham)' AS Tablo, 
    COUNT(*) AS ToplamKayit,
    SUM(CASE WHEN Sehir IS NULL THEN 1 ELSE 0 END) AS EksikSehir,
    SUM(CASE WHEN Email IS NULL THEN 1 ELSE 0 END) AS EksikEmail,
    SUM(CASE WHEN Telefon IS NULL THEN 1 ELSE 0 END) AS EksikTelefon
FROM dbo.STG_Musteri

UNION ALL

SELECT 
    'TEM_Musteri (Temizlenmis)',
    COUNT(*),
    SUM(CASE WHEN Sehir = 'Bilinmiyor' THEN 1 ELSE 0 END),
    SUM(CASE WHEN Email = 'Bilinmiyor' THEN 1 ELSE 0 END),
    SUM(CASE WHEN Telefon = 'Bilinmiyor' THEN 1 ELSE 0 END)
FROM dbo.TEM_Musteri

UNION ALL

SELECT 
    'Hedef_Musteri (Final)',
    COUNT(*),
    SUM(CASE WHEN Sehir = 'Bilinmiyor' THEN 1 ELSE 0 END),
    SUM(CASE WHEN Email = 'Bilinmiyor' THEN 1 ELSE 0 END),
    SUM(CASE WHEN Telefon = 'Bilinmiyor' THEN 1 ELSE 0 END)
FROM dbo.Hedef_Musteri;

SELECT 
    KaynakSistem,
    COUNT(*) AS ToplamKayit,
    COUNT(CASE WHEN Email != 'Bilinmiyor' THEN 1 END) AS EmailVar,
    COUNT(CASE WHEN Sehir != 'Bilinmiyor' THEN 1 END) AS SehirVar,
    COUNT(CASE WHEN Telefon != 'Bilinmiyor' THEN 1 END) AS TelefonVar,
    COUNT(CASE WHEN VeriKalitesi = 'TAM' THEN 1 END) AS TamKayit,
    COUNT(CASE WHEN VeriKalitesi = 'KISMI' THEN 1 END) AS KismiKayit,
    COUNT(CASE WHEN VeriKalitesi = 'EKSIK' THEN 1 END) AS EksikKayit
FROM dbo.Hedef_Musteri
GROUP BY KaynakSistem;
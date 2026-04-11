# Veritabanı Performans Optimizasyonu ve İzleme (Proje 1)

Bu proje, **AdventureWorks2022** veritabanı üzerinde performans analizi, darboğaz tespiti ve sistem iyileştirme çalışmalarını kapsamaktadır. Proje, Ankara Üniversitesi Bilgisayar Mühendisliği Bölümü BLM4522 dersi kapsamında gerçekleştirilmiştir.

## 🚀 Proje Özeti
Proje kapsamında aşağıdaki temel veritabanı yönetim ve optimizasyon işlemleri uygulanmıştır:
* **DMV Analizi:** SQL Server'ın dinamik yönetim görünümleri (`sys.dm_exec_query_stats` ve `sys.dm_exec_sql_text`) kullanılarak yük testi ve sorgu izleme.
* **Darboğaz Tespiti:** Yavaş çalışan sorguların ve yüksek kaynak tüketen operatörlerin belirlenmesi.
* **İndeks Optimizasyonu:** Eksik indekslerin tespiti, uygulanması ve performans artışının ölçülmesi.
* **İndeks Yönetimi:** Sisteme yük bindiren ancak kullanılmayan gereksiz indekslerin temizlenmesi.
* **Güvenlik:** Farklı yetki seviyelerine sahip kullanıcı rollerinin oluşturulması.

## 🔍 Performans İzleme ve Bulgular
Sistemdeki en yavaş ve en çok okuma yapan sorguları tespit etmek için DMV analizleri yapılmıştır.

**Tespit Edilen Kritik Sorunlar:**
* **Yüksek Okuma (Logical Reads):** Bazı sorguların 3.615 sayfa veriyi tek tek taradığı tespit edilmiştir.
* **Maliyetli Operatörler:** Yürütme planlarında (Execution Plan) `Index Scan`, `Key Lookup` ve `Nested Loops` gibi performans kaybına yol açan operatörler belirlenmiştir.

## 📈 Sorgu İyileştirme Sonuçları
`Sales.SalesOrderHeader` tablosu üzerinde uygulanan indeksleme çalışması sonucunda elde edilen veriler şöyledir:

| Metrik | İndekssiz | İndeksli | İyileşme Oranı |
| :--- | :--- | :--- | :--- |
| **Mantıksal Okuma (Logical Reads)** | 686 sayfa | 9 sayfa | **%98.7 Azalma** |
| **CPU Süresi** | 16 ms | 0 ms | **%100 Azalma**  |

## 🛠️ İndeks ve Güvenlik Yönetimi
* **Gereksiz İndeksler:** Sistemde 61 adet hiç kullanılmayan indeks tespit edilmiş ve örnek olarak `IX_Address_StateProvinceID` indeksi güvenle kaldırılmıştır.
* **Kullanıcı Rolleri:** Veritabanı güvenliği için üç farklı rol tanımlanmıştır: `analyst_user` (Analist), `app_user` (Uygulama Kullanıcısı) ve `db_admin` (Veritabanı Yöneticisi).

## 📺 Proje Sunum Videosu
Projenin uygulama adımlarını ve detaylı anlatımını aşağıdaki linkten izleyebilirsiniz:
[https://youtu.be/UoykTWt9ddc](https://youtu.be/UoykTWt9ddc)

## 👤 Hazırlayan
* **İsim:** Zeliha Kıyak 
* **Öğrenci No:** 22290878 

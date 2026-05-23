# Veritabanı Güvenliği ve Erişim Kontrolü (Proje 3)

Bu proje, AdventureWorks2022 veritabanı üzerinde kapsamlı güvenlik 
analizleri ve uygulamalarını kapsamaktadır. Proje, Ankara Üniversitesi 
Bilgisayar Mühendisliği Bölümü BLM4522 dersi kapsamında 
gerçekleştirilmiştir.

---

## 🚀 Proje Özeti

Proje kapsamında aşağıdaki temel veritabanı güvenlik işlemleri 
uygulanmıştır:

* **Authentication Modları:** SQL Server'ın Windows Authentication 
  modundan Mixed Mode'a geçişi sağlanmış, her iki mod 
  karşılaştırmalı olarak incelenmiştir.
* **Erişim Yönetimi:** Rol bazlı erişim kontrolü uygulanmış, 
  GRANT ve DENY komutlarıyla tablo bazlı yetkilendirme yapılmıştır.
* **Veri Şifreleme:** TDE Express Edition'da desteklenmediğinden 
  AES-256 algoritmasıyla sütun bazlı şifreleme uygulanmıştır.
* **SQL Injection:** Güvensiz sorgu yöntemiyle saldırı simüle 
  edilmiş, Stored Procedure ile korunma gösterilmiştir.
* **Audit Logları:** SQL Server Audit ile kullanıcı aktiviteleri 
  kayıt altına alınmıştır.

---

## 🔐 Erişim Yönetimi Sonuçları

Sistemdeki login tipleri listelendi ve rol bazlı yetkilendirme yapıldı:

| type_desc | Adet |
|-----------|------|
| SQL_LOGIN | 5 |
| WINDOWS_GROUP | 1 |
| WINDOWS_LOGIN | 1 |

sql_test_user kullanıcısına atanan yetkiler:

| Durum | Adet | Kapsam |
|-------|------|--------|
| GRANT | 4 | Person.Person (SELECT), SalesOrderHeader (SELECT, UPDATE) |
| DENY | 2 | HumanResources.Employee, EmployeePayHistory |

---

## 🔒 Veri Şifreleme Sonuçları

AES-256 algoritmasıyla TC kimlik numaraları şifrelendi:

| Durum | Görünüm |
|-------|---------|
| Anahtarsız | 0x0083D702FB3E2349... (okunamaz) |
| Anahtarlı | 12345678901 (okunabilir) |

---

## 🛡️ SQL Injection Test Sonuçları

| Senaryo | Yöntem | Sonuç |
|---------|--------|-------|
| Normal sorgu | Güvensiz EXEC | 8 satır |
| Injection saldırısı | Güvensiz EXEC | 19.974 satır ⚠️ |
| Normal sorgu | Stored Procedure | 8 satır |
| Injection saldırısı | Stored Procedure | 0 satır ✅ |

---

## 📋 Audit Log Sonuçları

| Kod | Anlamı | Adet |
|-----|--------|------|
| UP | UPDATE | 4 |
| SL | SELECT | 1 |
| AUSC | Audit Session | 1 |

---

## 📺 Proje Sunum Videosu

Projenin uygulama adımlarını ve detaylı anlatımını aşağıdaki 
linkten izleyebilirsiniz: **https://www.youtube.com/watch?v=cZZzLs6qtb0**

---

## 👤 Hazırlayan

* **İsim:** Zeliha Kıyak
* **Öğrenci No:** 22290878

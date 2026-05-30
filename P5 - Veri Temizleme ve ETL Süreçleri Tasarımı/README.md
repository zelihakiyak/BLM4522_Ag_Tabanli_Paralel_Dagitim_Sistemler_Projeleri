# Veri Temizleme ve ETL Süreçleri Tasarımı (Proje 5)

Bu proje, Northwind ve AdventureWorks2022 veritabanlarından veri 
çekilerek ETL (Extract, Transform, Load) sürecinin tasarlanması 
ve uygulanmasını kapsamaktadır. 

---

## 🚀 Proje Özeti

Proje kapsamında aşağıdaki ETL işlemleri uygulanmıştır:

* **Extract:** Northwind (91 kayıt) ve AdventureWorks2022 
  (753 kayıt) veritabanlarından veri çekilerek staging 
  tablosuna aktarıldı.
* **Transform:** NULL değerler dolduruldu, AdSoyad Title Case 
  formatına dönüştürüldü, veri kalitesi skoru atandı.
* **Load:** Temizlenen 844 kayıt kayıp olmadan hedef tabloya 
  aktarıldı.

---
## 🔍 Veri Kalitesi Analizi Sonuçları

Ham veride tespit edilen sorunlar:

| Kolon | NULL Sayısı | Kaynak |
|-------|-------------|--------|
| Sehir | 753 | AdventureWorks'te bu alan yok |
| Ulke | 753 | AdventureWorks'te bu alan yok |
| Telefon | 753 | AdventureWorks'te bu alan yok |
| Email | 91 | Northwind'de bu alan yok |

---

## 🛠️ Transform İşlemleri

| İşlem | Yöntem | Etkilenen Kayıt |
|-------|--------|----------------|
| NULL doldurma | ISNULL() → 'Bilinmiyor' | 844 |
| Title Case | STRING_SPLIT + STRING_AGG | 753 |
| Kalite skoru | TAM / KISMI / EKSIK | 844 |

**Örnek:** `gustavo achong` → `Gustavo Achong`

---

## 📈 Load Sonuçları

| Kaynak | Toplam | Email Var | Şehir Var | Telefon Var |
|--------|--------|-----------|-----------|-------------|
| Northwind | 91 | 0 | 91 | 91 |
| AdventureWorks | 753 | 753 | 0 | 0 |
| **TOPLAM** | **844** | **753** | **91** | **91** |

---
> **Not:** Northwind veritabanı kurulumu için 
> [Microsoft SQL Server Samples](https://github.com/microsoft/sql-server-samples) 
> reposundan `instnwnd.sql` dosyası kullanılmıştır.

---

## 📺 Proje Sunum Videosu

Projenin uygulama adımlarını ve detaylı anlatımını aşağıdaki 
linkten izleyebilirsiniz: [https://youtu.be/T7anlyDTjmo]

---

## 👤 Hazırlayan

* **İsim:** Zeliha Kıyak
* **Öğrenci No:** 22290878

# BLM4522 - Ağ Tabanlı Paralel Dağıtım Sistemleri

Bu repository, Ankara Üniversitesi Bilgisayar Mühendisliği Bölümü BLM4522 dersi kapsamında hazırlanan proje çalışmalarını içermektedir. Tüm projeler Microsoft SQL Server 2022 Express üzerinde AdventureWorks2022 örnek veritabanı kullanılarak gerçekleştirilmiştir.

---

## 👤 Hazırlayan

- **İsim:** Zeliha Kıyak
- **Öğrenci No:** 22290878
- **Bölüm:** Bilgisayar Mühendisliği
- **Ders:** BLM4522 - Ağ Tabanlı Paralel Dağıtım Sistemleri

---

## 🛠️ Kullanılan Teknolojiler

- Microsoft SQL Server 2022 Express
- SQL Server Management Studio (SSMS)
- AdventureWorks2022 Örnek Veritabanı
- Northwind Örnek Veritabanı
- PowerShell
- Windows Task Scheduler

---

## 📁 Proje 1 - Veritabanı Performans Optimizasyonu ve İzleme

**Klasör:** `P1-Performans-Optimizasyonu/`  
**Video:** https://youtu.be/UoykTWt9ddc

AdventureWorks2022 veritabanı üzerinde performans analizi, darboğaz tespiti ve sistem iyileştirme çalışmaları gerçekleştirilmiştir.

**Öne Çıkan Sonuçlar:**
- DMV analizi ile yavaş sorgular tespit edildi
- Execution Plan'da Index Scan, Key Lookup ve Nested Loops operatörleri belirlendi
- İndeks optimizasyonu ile logical reads 686 sayfadan 9 sayfaya düşürüldü (%98.7 iyileşme)
- 61 adet kullanılmamış indeks tespit edildi, IX_Address_StateProvinceID kaldırıldı
- 3 farklı yetki seviyesinde kullanıcı rolü oluşturuldu

| Metrik | İndekssiz | İndeksli | İyileşme |
|--------|-----------|----------|----------|
| Logical Reads | 686 sayfa | 9 sayfa | %98.7 Azalma |
| CPU Süresi | 16 ms | 0 ms | %100 Azalma |

➡️ [Proje 1 Detayları](./P1-Performans-Optimizasyonu/README.md)

---

## 📁 Proje 2 - Veritabanı Yedekleme ve Felaketten Kurtarma Planı

**Klasör:** `P2-Yedekleme-Kurtarma/`  
**Video:** https://youtu.be/F52fxjz5U_0   

AdventureWorks2022 veritabanı üzerinde kapsamlı bir yedekleme ve felaketten kurtarma planı tasarlanmış ve uygulanmıştır.

**Öne Çıkan Sonuçlar:**
- Tam, diferansiyel ve transaction log yedekleri alındı
- Diferansiyel yedek tam yedeğe göre %98.5 daha az veri işledi
- PowerShell + Task Scheduler ile her gece 02:00'de otomatik yedekleme kuruldu
- 31.465 kayıt silindi, restore ile eksiksiz kurtarıldı
- 4/4 yedek dosyası RESTORE VERIFYONLY ile doğrulandı

| Aşama | Kayıt Sayısı | Durum |
|-------|-------------|-------|
| Felaket Öncesi | 31.465 | Normal |
| Felaket Sonrası | 0 | ❌ Felaket |
| Restore Sonrası | 31.465 | ✅ Tam Kurtarma |

➡️ [Proje 2 Detayları](./P2-Yedekleme-Kurtarma/README.md)

---

## 📁 Proje 3 - Veritabanı Güvenliği ve Erişim Kontrolü

**Klasör:** `P3-Guvenlik-Erisim/`  
**Video:** https://youtu.be/cZZzLs6qtb0

AdventureWorks2022 veritabanı üzerinde Authentication modları karşılaştırılmış, rol bazlı erişim yönetimi uygulanmış, sütun bazlı veri şifreleme gerçekleştirilmiş, SQL Injection saldırısı simüle edilerek korunma yöntemi gösterilmiş ve SQL Server Audit ile kullanıcı aktiviteleri kayıt altına alınmıştır.

**Öne Çıkan Sonuçlar:**
- Windows Authentication modundan Mixed Mode'a geçiş yapıldı
- Rol bazlı erişim yönetimi ile 2 DENY, 4 GRANT atandı
- AES-256 algoritmasıyla sütun bazlı şifreleme uygulandı
- SQL Injection saldırısı 19.974 satır döndürürken Stored Procedure ile 0 satıra düşürüldü
- SQL Server Audit ile UP, SL, AUSC logları alındı

| Senaryo | Yöntem | Sonuç |
|---------|--------|-------|
| Injection Saldırısı | Güvensiz EXEC | 19.974 satır ⚠️ |
| Injection Saldırısı | Stored Procedure | 0 satır ✅ |

➡️ [Proje 3 Detayları](./P3-Guvenlik-Erisim/README.md)

---

## 📁 Proje 5 - Veri Temizleme ve ETL Süreçleri Tasarımı

**Klasör:** `P5-ETL-Veri-Temizleme/`  
**Video:** https://youtu.be/T7anlyDTjmo

Northwind ve AdventureWorks2022 veritabanlarından veri çekilerek ETL (Extract, Transform, Load) süreci tasarlanmış ve uygulanmıştır.

**Öne Çıkan Sonuçlar:**
- Northwind (91 kayıt) ve AdventureWorks2022 (753 kayıt) olmak üzere iki farklı kaynaktan veri çekildi
- NULL değerler tespit edildi ve anlamlı değerlerle dolduruldu
- AdSoyad kolonunda Title Case formatı uygulandı
- 844 kayıt kayıp olmadan hedef tabloya aktarıldı
- ETL sürecinin her aşaması veri kalitesi raporu ile belgelendi

| Kaynak | Toplam | Email Var | Şehir Var | Telefon Var |
|--------|--------|-----------|-----------|-------------|
| Northwind | 91 | 0 | 91 | 91 |
| AdventureWorks | 753 | 753 | 0 | 0 |
| **TOPLAM** | **844** | **753** | **91** | **91** |

➡️ [Proje 5 Detayları](./P5-ETL-Veri-Temizleme/README.md)

---

## 📁 Proje 7 - Veritabanı Yedekleme ve Otomasyon Çalışması

**Klasör:** `P7-Yedekleme-Otomasyon/`  
**Video:** https://youtu.be/jHbmK5t1gnw

AdventureWorks2022 veritabanı üzerinde yedekleme işlemleri otomatikleştirilmiş, T-SQL ile yedek geçmişi raporlanmış ve başarısız yedek durumunda uyarı sistemi kurulmuştur.

**Öne Çıkan Sonuçlar:**
- msdb üzerinden 21 yedek kaydı sorgulandı ve kategorize edildi
- Gelişmiş PowerShell scripti ile Tam + Diferansiyel + Log yedekleri otomatik alındı
- Başarısız yedek durumunda KRITIK UYARI sistemi kuruldu
- Task Scheduler ile her gece 02:00'de otomatik çalışma sağlandı
- 3/3 P7 yedeği RESTORE VERIFYONLY ile doğrulandı

| Kategori | Adet |
|----------|------|
| P7 Projesi | 12 |
| Otomatik | 2 |
| Manuel | 6 |
| Diğer | 1 |
| **TOPLAM** | **21** |

➡️ [Proje 7 Detayları](./P7-Yedekleme-Otomasyon/README.md)

---

## 📋 Genel Notlar

- Her proje kendi klasöründe bağımsız olarak çalışmaktadır
- Tüm SQL sorguları `sorgular/` klasöründe numaralı dosyalar halinde saklanmaktadır
- PowerShell scriptleri `scripts/` klasöründe bulunmaktadır
- Yedek dosyaları (.bak) boyutları nedeniyle GitHub'a yüklenmemiş olup yerel diskte saklanmaktadır
- Her proje için en az 10 dakikalık açıklama videosu hazırlanmıştır
- Raporlar `rapor/` klasöründe `.docx` formatında bulunmaktadır
- SQL Server Express Edition kullanıldığından SQL Server Agent yerine PowerShell + Task Scheduler kombinasyonu kullanılmıştır

# BLM4522 - Ağ Tabanlı Paralel Dağıtım Sistemleri

Bu repository, Ankara Üniversitesi Bilgisayar Mühendisliği Bölümü 
BLM4522 dersi kapsamında hazırlanan proje çalışmalarını içermektedir.
Tüm projeler Microsoft SQL Server 2022 Express üzerinde 
AdventureWorks2022 örnek veritabanı kullanılarak gerçekleştirilmiştir.

---

## 👤 Hazırlayan

* **İsim:** Zeliha Kıyak
* **Öğrenci No:** 22290878
* **Bölüm:** Bilgisayar Mühendisliği
* **Ders:** BLM4522 - Ağ Tabanlı Paralel Dağıtım Sistemleri

---

## 🛠️ Kullanılan Teknolojiler

* Microsoft SQL Server 2022 Express
* SQL Server Management Studio (SSMS)
* AdventureWorks2022 Örnek Veritabanı
* PowerShell
* Windows Task Scheduler

---

## 📁 Proje 1 - Veritabanı Performans Optimizasyonu ve İzleme

**Klasör:** `P1-Performans-Optimizasyonu/`  
**Video:** [https://youtu.be/UoykTWt9ddc](https://youtu.be/UoykTWt9ddc)

AdventureWorks2022 veritabanı üzerinde performans analizi, darboğaz 
tespiti ve sistem iyileştirme çalışmaları gerçekleştirilmiştir.

**Öne Çıkan Sonuçlar:**
* DMV analizi ile yavaş sorgular tespit edildi
* Execution Plan'da Index Scan, Key Lookup ve Nested Loops operatörleri belirlendi
* İndeks optimizasyonu ile logical reads **686 sayfadan 9 sayfaya** düşürüldü (**%98.7 iyileşme**)
* 61 adet kullanılmamış indeks tespit edildi, `IX_Address_StateProvinceID` kaldırıldı
* 3 farklı yetki seviyesinde kullanıcı rolü oluşturuldu

| Metrik | İndekssiz | İndeksli | İyileşme |
|--------|-----------|----------|----------|
| Logical Reads | 686 sayfa | 9 sayfa | %98.7 Azalma |
| CPU Süresi | 16 ms | 0 ms | %100 Azalma |

➡️ [Proje 1 Detayları](./P1-Performans-Optimizasyonu/README.md)

---

## 📁 Proje 2 - Veritabanı Yedekleme ve Felaketten Kurtarma Planı

**Klasör:** `P2-Yedekleme-Kurtarma/`  
**Video:** [https://youtu.be/F52fxjz5U_0](https://youtu.be/F52fxjz5U_0)

AdventureWorks2022 veritabanı üzerinde kapsamlı bir yedekleme ve 
felaketten kurtarma planı tasarlanmış ve uygulanmıştır.

**Öne Çıkan Sonuçlar:**
* Tam, diferansiyel ve transaction log yedekleri alındı
* Diferansiyel yedek tam yedeğe göre **%98.5 daha az** veri işledi
* PowerShell + Task Scheduler ile her gece 02:00'de otomatik yedekleme kuruldu
* 31.465 kayıt silindi, restore ile **eksiksiz kurtarıldı**
* 4/4 yedek dosyası `RESTORE VERIFYONLY` ile doğrulandı

| Aşama | Kayıt Sayısı | Durum |
|-------|-------------|-------|
| Felaket Öncesi | 31.465 | Normal |
| Felaket Sonrası | 0 | ❌ Felaket |
| Restore Sonrası | 31.465 | ✅ Tam Kurtarma |

➡️ [Proje 2 Detayları](./P2-Yedekleme-Kurtarma/README.md)

---

## 📋 Genel Notlar

* Her proje kendi klasöründe bağımsız olarak çalışmaktadır
* Tüm SQL sorguları `sorgular/` klasöründe numaralı dosyalar halinde saklanmaktadır
* Yedek dosyaları (.bak) boyutları nedeniyle GitHub'a yüklenmemiş olup yerel diskte saklanmaktadır
* Her proje için en az 10 dakikalık açıklama videosu hazırlanmıştır
* Raporlar `rapor/` klasöründe `.pdf` formatında bulunmaktadır

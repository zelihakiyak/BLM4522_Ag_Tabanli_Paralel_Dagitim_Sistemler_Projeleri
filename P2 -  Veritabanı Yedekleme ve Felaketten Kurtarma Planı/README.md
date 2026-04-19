# Veritabanı Yedekleme ve Felaketten Kurtarma Planı (Proje 2)

Bu proje, AdventureWorks2022 veritabanı üzerinde yedekleme stratejilerinin 
tasarlanması, otomatik yedekleme kurulumu ve felaketten kurtarma süreçlerinin 
uygulanmasını kapsamaktadır. Proje, Ankara Üniversitesi Bilgisayar Mühendisliği 
Bölümü BLM4522 dersi kapsamında gerçekleştirilmiştir.

---

## 🚀 Proje Özeti

Proje kapsamında aşağıdaki temel veritabanı yedekleme ve kurtarma işlemleri 
uygulanmıştır:

* **Tam Yedek (Full Backup):** Veritabanının eksiksiz kopyası alınarak 
  yedekleme stratejisinin temeli oluşturulmuştur.
* **Diferansiyel Yedek:** Son tam yedekten bu yana değişen veriler 
  yedeklenerek depolama verimliliği sağlanmıştır.
* **Transaction Log Yedeği:** Recovery Model FULL'e çevrilerek 
  point-in-time restore kapasitesi kazanılmıştır.
* **Otomatik Yedekleme:** PowerShell scripti ve Windows Task Scheduler 
  ile her gece 02:00'de otomatik yedekleme kurulmuştur.
* **Felaketten Kurtarma:** Kaza ile veri silme senaryosu simüle edilerek 
  restore işlemi başarıyla gerçekleştirilmiştir.
* **Yedek Doğrulama:** `RESTORE VERIFYONLY` komutu ile tüm yedek 
  dosyalarının bütünlüğü doğrulanmıştır.

---

## 📊 Yedekleme Stratejisi ve Bulgular

Üç farklı yedekleme yöntemi uygulanmış ve karşılaştırmalı analizleri yapılmıştır.

**Yedek Türleri Karşılaştırması:**

| Yedek Türü | İşlenen Sayfa | Süre | Kapsam |
|------------|--------------|------|--------|
| Tam Yedek | 25.489 sayfa | 0.263 sn | Tüm veritabanı |
| Diferansiyel | 393 sayfa | 0.017 sn | Yalnızca değişen veriler |
| Transaction Log | 6 sayfa | 0.004 sn | Son işlemler |

Diferansiyel yedeğin tam yedeğe kıyasla **%98.5 daha az** veri işlemesi, 
doğru yedekleme stratejisinin depolama ve süre açısından ne denli verimli 
olduğunu kanıtlamaktadır.

---

## 🔥 Felaketten Kurtarma Sonuçları

`Sales.SalesOrderHeader` ve `Sales.SalesOrderDetail` tablolarındaki tüm 
kayıtlar kasıtlı olarak silinerek felaket ortamı oluşturulmuş, ardından 
Full2.bak → Log1.bak zinciri kullanılarak restore işlemi gerçekleştirilmiştir.

| Aşama | Kayıt Sayısı | Durum |
|-------|-------------|-------|
| Felaket Öncesi | 31.465 kayıt | Normal |
| Felaket Sonrası | 0 kayıt | ❌ Felaket! |
| Restore Sonrası | 31.465 kayıt | ✅ Tam Kurtarma |

---

## 🛠️ Otomatik Yedekleme ve Doğrulama

* **Otomatik Yedekleme:** SQL Server Express Edition'da SQL Server Agent 
  desteklenmediğinden PowerShell + Windows Task Scheduler kombinasyonu 
  kullanılmıştır. Görev her gece 02:00'de çalışacak şekilde yapılandırılmış 
  ve `State: Ready` durumu ile doğrulanmıştır.
* **Yedek Doğrulama:** 4 yedek dosyasının tamamı `RESTORE VERIFYONLY` 
  komutu ile fiziksel olarak doğrulanmış, tamamı için 
  *"The backup set on file 1 is valid"* sonucu alınmıştır.

---

## 📺 Proje Sunum Videosu

Projenin uygulama adımlarını ve detaylı anlatımını aşağıdaki linkten 
izleyebilirsiniz: **https://youtu.be/F52fxjz5U_0**

---

## 👤 Hazırlayan

* **İsim:** Zeliha Kıyak  
* **Öğrenci No:** 22290878

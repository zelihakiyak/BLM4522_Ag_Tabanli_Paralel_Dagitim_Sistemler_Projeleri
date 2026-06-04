# Veritabanı Yedekleme ve Otomasyon Çalışması (Proje 7)

Bu proje, AdventureWorks2022 veritabanı üzerinde yedekleme 
işlemlerinin otomatikleştirilmesini, yedek geçmişinin T-SQL ile 
raporlanmasını ve başarısız yedek durumunda uyarı sistemi 
kurulmasını kapsamaktadır. Proje, Ankara Üniversitesi Bilgisayar 
Mühendisliği Bölümü BLM4522 dersi kapsamında gerçekleştirilmiştir.

---

## 🚀 Proje Özeti

Proje kapsamında aşağıdaki otomasyon ve raporlama işlemleri 
uygulanmıştır:

* **Yedek Geçmişi Sorgulama:** msdb sistem veritabanı üzerinden 
  tüm yedekleme kayıtları T-SQL ile sorgulandı.
* **Yedek Durum Raporu:** Tür bazlı özet istatistikler ve son 
  yedekten bu yana geçen süre hesaplandı.
* **Uyarı Sistemi:** Son yedekten 24 saatten fazla geçmesi 
  durumunda otomatik UYARI üretildi.
* **Gelişmiş PowerShell Scripti:** Tam, diferansiyel ve log 
  yedeklerini otomatik alan, kategorili log tutan ve başarısız 
  yedek durumunda KRITIK UYARI üreten script yazıldı.
* **Task Scheduler Otomasyonu:** Her gece 02:00'de otomatik 
  çalışacak görev tanımlandı.
* **Kapsamlı Denetim Raporu:** Tüm yedekler kaynağına göre 
  kategorize edilerek raporlandı.

---

## ⏰ Task Scheduler Yapılandırması

| Parametre | Değer |
|-----------|-------|
| Görev Adı | AW P7 Otomatik Yedekleme |
| Çalışma Zamanı | Her gece 02:00 |
| Yetki | Yönetici (Highest) |
| Yeniden Deneme | 3 kez, 10 dk arayla |
| Durum | Ready ✅ |

---

## 📺 Proje Sunum Videosu

Projenin uygulama adımlarını ve detaylı anlatımını aşağıdaki 
linkten izleyebilirsiniz: **https://youtu.be/jHbmK5t1gnw**

---

## 👤 Hazırlayan

* **İsim:** Zeliha Kıyak
* **Öğrenci No:** 22290878

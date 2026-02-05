# 📘 Linux Servis Yönetim Paneli - Kullanıcı El Kitabı

![Linux Version](https://img.shields.io/badge/Version-1.2-blue.svg)
![OS](https://img.shields.io/badge/Platform-Systemd--based-orange.svg)
![License](https://img.shields.io/badge/License-MIT-green.svg)

Bu uygulama, Linux sistem yöneticilerinin karmaşık `systemctl` komutlarını ezberlemek zorunda kalmadan servisleri yönetmelerini sağlayan etkileşimli bir terminal (CLI) aracıdır.

---

## 🚀 Genel Bakış

Linux Servis Yönetim Paneli, günlük sunucu operasyonlarını hızlandırmak ve hata payını en aza indirmek için tasarlanmıştır.

### Temel Özellikler
* **✅ Menü Tabanlı Arayüz:** Kolay sayısal seçim sistemi.
* **🛡️ Hata Koruması:** Geçersiz servis isimleri ve yetkisiz erişim kontrolleri.
* **🔄 Sürekli Akış:** Tek oturumda döngüsel işlem yapabilme (Loop).
* **🎨 Görsel Geri Bildirim:** İşlem sonuçları için renk kodlu (Yeşil/Kırmızı) çıktılar.

---

## 🛠️ Kurulum ve Hazırlık

### Gereksinimler
- **Sistem:** Systemd kullanan Linux dağıtımları (Ubuntu, Debian, CentOS, RHEL, Fedora vb.)
- **Kabuk:** Bash (Bourne Again Shell)
- **Yetki:** `sudo` veya Root erişimi.

### 1. Dosyayı Oluşturma
Terminalinizi açın ve aşağıdaki komutla dosyayı oluşturun:
```bash
nano servis_yonetim.sh

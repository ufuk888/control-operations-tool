# 📘 Linux Servis Yönetim Paneli - Kullanıcı El Kitabı

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

📋 Menü ve Fonksiyonlar Rehberi  

No,İşlem,Açıklama ve Kullanım Senaryosu

1,Start,Durmuş bir servisi çalıştırır.

2,Stop,Çalışan bir servisi anında sonlandırır.

3,Restart,Servisi kapatıp tekrar açar (Yapılandırma sonrası).

4,Enable,Servisin sistem açılışında otomatik başlamasını sağlar.

5,Disable,Servisin otomatik başlamasını engeller.

6,Status,Servisin anlık durumunu ve loglarını gösterir.

7,Edit,Servis dosyasını sistem editörü ile düzenler.

8,Listele,Tüm aktif servisleri listeler.

0,Çıkış,Uygulamadan güvenli bir şekilde ayrılmanızı sağlar.

💡 Örnek Senaryo: Nginx Yeniden Başlatma
1) Başlat: sudo ./servis_yonetim.sh

2) Kontrol: Servis adından emin değilseniz 8 tuşuna basın.

3) İşlem: Menüden 3 (Restart) seçin.

4) Giriş: Servis adına nginx yazın ve Enter'a basın.

5) Sonuç: - ✔ nginx yeniden başlatıldı. (Başarılı)

         ✘ Yeniden başlatma hatası! (Hatalı)



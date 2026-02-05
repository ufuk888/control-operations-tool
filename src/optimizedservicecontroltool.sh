#!/bin/bash

# --- Renk Tanımlamaları (Görsel Hiyerarşi için) ---
RED='\033[0;31m'
GREEN='\033[0;32m'
BLUE='\033[0;34m'
YELLOW='\033[1;33m'
NC='\033[0m' # No Color

# --- Fonksiyon: Devam etmek için bekle ---
pause() {
    echo -e "\n${YELLOW}Devam etmek için [ENTER] tuşuna basınız...${NC}"
    read -r
}

# --- Root Yetkisi Kontrolü ---
# Servis yönetimi root yetkisi gerektirir.
if [[ $EUID -ne 0 ]]; then
   echo -e "${RED}Hata: Bu panel sistem servislerini yönetir. Lütfen 'sudo' ile çalıştırın.${NC}"
   exit 1
fi

# --- Ana Döngü (Main Loop) ---
while true; do
    clear
    echo -e "${BLUE}==============================================${NC}"
    echo -e "${BLUE}       SERVİS YÖNETİM KONTROL PANELİ          ${NC}"
    echo -e "${BLUE}==============================================${NC}"
    echo "1. Servis Başlat (Start)"
    echo "2. Servis Durdur (Stop)"
    echo "3. Servis Yeniden Başlat (Restart)"
    echo "4. Başlangıca Ekle (Enable)"
    echo "5. Başlangıçtan Kaldır (Disable)"
    echo "6. Durum Görüntüle (Status/View)"
    echo "7. Servis Dosyasını Düzenle (Edit)"
    echo "8. Tüm Servisleri Listele"
    echo "0. Çıkış (Exit)"
    echo -e "${BLUE}==============================================${NC}"
    
    read -p "Seçiminiz (0-8): " secim

    # Çıkış Kontrolü
    if [[ "$secim" == "0" ]]; then
        echo -e "${GREEN}Sistemden güvenli çıkış yapılıyor...${NC}"
        break
    fi

    # Listeleme seçeneği ayrı ele alınır (Servis adı istemez)
    if [[ "$secim" == "8" ]]; then
        echo -e "${YELLOW}Aktif servisler listeleniyor (Çıkmak için 'q' tuşuna basın)...${NC}"
        systemctl list-units --type=service --state=running
        continue
    fi

    # --- Servis Adı Girişi ---
    # Kullanıcı sadece 1-7 arası seçim yaptıysa servis adı istenir.
    if [[ "$secim" =~ ^[1-7]$ ]]; then
        echo ""
        read -p "İşlem yapılacak servis adını giriniz (Örn: nginx): " servis
        
        # Boş giriş kontrolü
        if [[ -z "$servis" ]]; then
            echo -e "${RED}Hata: Servis adı boş olamaz!${NC}"
            pause
            continue
        fi
    else
        echo -e "${RED}Geçersiz seçim! Lütfen 0-8 arası bir numara girin.${NC}"
        pause
        continue
    fi

    # --- İşlem Mantığı (Case Structure) ---
    echo -e "${YELLOW}İşlem yürütülüyor: $servis ...${NC}"
    
    case $secim in
        1) # Start
            systemctl start "$servis" && echo -e "${GREEN}✔ $servis başarıyla başlatıldı.${NC}" || echo -e "${RED}✘ Başlatma hatası!${NC}"
            ;;
        2) # Stop
            systemctl stop "$servis" && echo -e "${GREEN}✔ $servis durduruldu.${NC}" || echo -e "${RED}✘ Durdurma hatası!${NC}"
            ;;
        3) # Restart
            systemctl restart "$servis" && echo -e "${GREEN}✔ $servis yeniden başlatıldı.${NC}" || echo -e "${RED}✘ Yeniden başlatma hatası!${NC}"
            ;;
        4) # Enable
            systemctl enable "$servis" && echo -e "${GREEN}✔ $servis başlangıca eklendi.${NC}" || echo -e "${RED}✘ Etkinleştirme hatası!${NC}"
            ;;
        5) # Disable
            systemctl disable "$servis" && echo -e "${GREEN}✔ $servis başlangıçtan kaldırıldı.${NC}" || echo -e "${RED}✘ Devre dışı bırakma hatası!${NC}"
            ;;
        6) # Status
            systemctl status "$servis" --no-pager
            ;;
        7) # Edit
            echo -e "${YELLOW}Dikkat: Düzenleyici açılıyor...${NC}"
            systemctl edit --full "$servis"
            ;;
    esac

    # Döngü başa dönmeden önce kullanıcının çıktıyı okumasını bekle
    pause

done

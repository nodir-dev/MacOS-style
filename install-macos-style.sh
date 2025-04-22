#!/bin/bash

set -e

clear
echo -e "\e[95m"
cat <<'EOF'
██████╗  ██████╗      ██╗ ██████╗     ██████╗ ███████╗██╗   ██╗███████╗██╗      ██████╗ ██████╗ ███████╗██████╗ 
██╔════╝ ██╔═══██╗     ██║██╔═══██╗    ██╔══██╗██╔════╝██║   ██║██╔════╝██║     ██╔═══██╗██╔══██╗██╔════╝██╔══██╗
██║  ███╗██║   ██║     ██║██║   ██║    ██║  ██║█████╗  ██║   ██║█████╗  ██║     ██║   ██║██████╔╝█████╗  ██████╔╝
██║   ██║██║   ██║██   ██║██║   ██║    ██║  ██║██╔══╝  ╚██╗ ██╔╝██╔══╝  ██║     ██║   ██║██╔═══╝ ██╔══╝  ██╔══██╗
╚██████╔╝╚██████╔╝╚█████╔╝╚██████╔╝    ██████╔╝███████╗ ╚████╔╝ ███████╗███████╗╚██████╔╝██║     ███████╗██║  ██║
 ╚═════╝  ╚═════╝  ╚════╝  ╚═════╝     ╚═════╝ ╚══════╝  ╚═══╝  ╚══════╝╚══════╝ ╚═════╝ ╚═╝     ╚══════╝╚═╝  ╚═╝
EOF
echo -e "\e[92m\n💻  Muallif: @GojoSatoru (Telegram)\n📅  Sana: $(date +%Y-%m-%d)\n\e[0m"

echo -e "\n🍎 MacOS Big Sur Style XFCE uchun o'rnatilmoqda...\n"

# Kerakli paketlar
echo "📦 Kerakli paketlar o'rnatilmoqda..."
sudo apt update
sudo apt install -y git wget gnome-themes-extra plank unzip fonts-noto fonts-noto-cjk fonts-noto-color-emoji

mkdir -p ~/.themes ~/.icons ~/.fonts

# GTK Theme - WhiteSur
echo "🎨 WhiteSur GTK mavzusi yuklanmoqda..."
git clone --depth=1 https://github.com/vinceliuice/WhiteSur-gtk-theme.git /tmp/WhiteSur-gtk-theme
cd /tmp/WhiteSur-gtk-theme
./install.sh -d ~/.themes
cd ~

# Icon Theme - WhiteSur
echo "🎨 WhiteSur Icon pack yuklanmoqda..."
git clone --depth=1 https://github.com/vinceliuice/WhiteSur-icon-theme.git /tmp/WhiteSur-icon-theme
cd /tmp/WhiteSur-icon-theme
./install.sh -d ~/.icons
cd ~

# SF Pro Fonts
echo "🔤 SF Pro shriftlari yuklanmoqda..."
wget -qO /tmp/sfpro.zip https://github.com/blaisck/sf-fonts/raw/master/SF-Pro.zip
unzip -o /tmp/sfpro.zip -d ~/.fonts/
fc-cache -fv

# Plank autostart
echo "🚀 Plank avtomatik ishga tushirishga sozlanmoqda..."
mkdir -p ~/.config/autostart
cat <<EOF2 > ~/.config/autostart/plank.desktop
[Desktop Entry]
Type=Application
Exec=plank
Hidden=false
NoDisplay=false
X-GNOME-Autostart-enabled=true
Name=Plank
EOF2

# XFCE tweaks uchun eslatma
echo -e "\n✅ Mavzu, ikonka va borderlarni tanlash uchun:"
echo "  ⚙️  Settings > Appearance: WhiteSur, Icons: WhiteSur"
echo "  🪟 Settings > Window Manager > Theme: WhiteSur"
echo "  📌 Panelni yuqoriga olib chiqing, Plank pastda dock bo‘lib turadi."

echo -e "\n🎉 TAYYOR! Tizim MacOS Big Sur uslubiga kirdi!"
echo "👉 Logout qiling yoki PC’ni qayta ishga tushiring, keyin Plank va mavzularni faollashtiring."

# Cleanup
rm -rf /tmp/WhiteSur-gtk-theme /tmp/WhiteSur-icon-theme /tmp/sfpro.zip

exit 0

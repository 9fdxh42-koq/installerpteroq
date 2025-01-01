#!/bin/bash
# Color
BLUE='\033[0;34m'       
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[0;33m'
NC='\033[0m'
# Display welcome message
display_welcome() {
  echo -e "Selamat Datang!"
  echo -e "Powered by Obscura Student"
  echo -e "@Deliogalileio"
  echo -e "6285183343636@s.whatsapp.net"
  sleep 4
  clear
}
#Update and install jq
install_jq() {
  echo -e "Update && Install JQ."
  sudo apt update && sudo apt install -y jq
  if [ $? -eq 0 ]; then
    echo -e "Succeeded"
  else
    echo -e "Something Wrong!"
    exit 1
  fi
  sleep 1
  clear
}
#Check user token
check_token() {
  echo -e "${YELLOW}Enter Token :${NC}"
  read -r USER_TOKEN
  if [ "$USER_TOKEN" = "OBSCURAx7fB3uYqPz9L1e6Tz" ]; then
    echo -e "${GREEN}Approved.${NC}}"
  else
    echo -e "${YELLOW}Incorrect! Rejected.${NC}"
    exit 1
  fi
  clear
}
# Install theme
install_theme() {
  while true; do
    echo -e "PILIH THEME YANG INGIN DI INSTALL"
    echo "1. Stellar"
    echo "2. Billing"
    echo "3. Enigma"
    echo "x. kembali"
    echo -e "masukan pilihan (1/2/3/x) :"
    read -r SELECT_THEME
    case "$SELECT_THEME" in
      1)
        THEME_URL=$(echo -e "https://github.com/9fdxh42-koq/ThemaV1/raw/master/stellartheme.zip")
        break
        ;;
      2)
        THEME_URL=$(echo -e "https://github.com/9fdxh42-koq/ThemaV1/raw/master/billing.zip")
        break
        ;;
      3)
        THEME_URL=$(echo -e "https://github.com/9fdxh42-koq/ThemaV1/raw/master/enigma.zip")
        break
        ;; 
      x)
        return
        ;;
      *)
        echo -e "${RED}Pilihan tidak valid, silahkan coba lagi.${NC}"
        ;;
    esac
  done
if [ -e /root/pterodactyl ]; then
    sudo rm -rf /root/pterodactyl
  fi
  wget -q "$THEME_URL"
  sudo unzip -o "$(basename "$THEME_URL")"
if [ "$SELECT_THEME" -eq 1 ]; then
  echo -e "Installation on the way."
  sudo cp -rfT /root/pterodactyl /var/www/pterodactyl
  curl -sL https://deb.nodesource.com/setup_16.x | sudo -E bash -
  sudo apt install -y nodejs
  sudo npm i -g yarn
  cd /var/www/pterodactyl
  yarn add react-feather
  php artisan migrate
  yarn build:production
  php artisan view:clear
  sudo rm /root/stellartheme.zip
  sudo rm -rf /root/pterodactyl
  echo -e "Succeeded."
  sleep 2
  clear
  exit 0
elif [ "$SELECT_THEME" -eq 2 ]; then
  echo -e "Theme installation."
  sudo cp -rfT /root/pterodactyl /var/www/pterodactyl
  curl -sL https://deb.nodesource.com/setup_16.x | sudo -E bash -
  sudo apt install -y nodejs
  npm i -g yarn
  cd /var/www/pterodactyl
  yarn add react-feather
  php artisan billing:install stable
  php artisan migrate
  yarn build:production
  php artisan view:clear
  sudo rm /root/billing.zip
  sudo rm -rf /root/pterodactyl
  echo -e "Succeeded."
  sleep 2
  clear
  return
elif [ "$SELECT_THEME" -eq 3 ]; then
  echo -e "Theme Installation."
    # Menanyakan informasi kepada pengguna untuk tema Enigma
    echo -e "${YELLOW}Masukkan link wa (https://wa.me...) : ${NC}"
    read LINK_WA
    echo -e "${YELLOW}Masukkan link group (https://.....) : ${NC}"
    read LINK_GROUP
    echo -e "${YELLOW}Masukkan link channel (https://...) : ${NC}"
    read LINK_CHNL
    # Mengganti placeholder dengan nilai dari pengguna
    sudo sed -i "s|LINK_WA|$LINK_WA|g" /root/pterodactyl/resources/scripts/components/dashboard/DashboardContainer.tsx
    sudo sed -i "s|LINK_GROUP|$LINK_GROUP|g" /root/pterodactyl/resources/scripts/components/dashboard/DashboardContainer.tsx
    sudo sed -i "s|LINK_CHNL|$LINK_CHNL|g" /root/pterodactyl/resources/scripts/components/dashboard/DashboardContainer.tsx
  sudo cp -rfT /root/pterodactyl /var/www/pterodactyl
  curl -sL https://deb.nodesource.com/setup_16.x | sudo -E bash -
  sudo apt install -y nodejs
  sudo npm i -g yarn
  cd /var/www/pterodactyl
  yarn add react-feather
  php artisan migrate
  yarn build:production
  php artisan view:clear
  sudo rm /root/enigma.zip
  sudo rm -rf /root/pterodactyl
  echo -e "Succeeded."
  sleep 5
else
  echo ""
  echo "Pilihan tidak valid. silahkan pilih 1/2/3."
fi
}
# Uninstall theme
uninstall_theme() {
  echo -e "Uninstall Theme."
  bash <(curl https://raw.githubusercontent.com/9fdxh42-koq/ThemaV1/refs/heads/master/repair.sh)
  echo -e "Succeeded."
  sleep 2
  clear
}
install_themeSteeler() {
#!/bin/bash
echo -e "Stellar Installation."
# Unduh file tema
wget -O /root/stellartheme.zip https://github.com/9fdxh42-koq/ThemaV1/raw/master/stellartheme.zip
# Ekstrak file tema
unzip /root/stellartheme.zip -d /root/pterodactyl
# Salin tema ke direktori Pterodactyl
sudo cp -rfT /root/pterodactyl /var/www/pterodactyl
# Instal Node.js dan Yarn
curl -sL https://deb.nodesource.com/setup_16.x | sudo -E bash -
sudo apt install -y nodejs
sudo npm i -g yarn
# Instal dependensi dan build tema
cd /var/www/pterodactyl
yarn add react-feather
php artisan migrate
yarn build:production
php artisan view:clear
# Hapus file dan direktori sementara
sudo rm /root/stellartheme.zip
sudo rm -rf /root/pterodactyl
echo -e "Succeeded."
sleep 2
clear
exit 0
}
create_node() {
  echo -e "Create Node."
  # Minta input dari pengguna
  read -p "Masukkan nama lokasi: " location_name
  read -p "Masukkan deskripsi lokasi: " location_description
  read -p "Masukkan domain: " domain
  read -p "Masukkan nama node: " node_name
  read -p "Masukkan RAM (dalam MB): " ram
  read -p "Masukkan jumlah maksimum disk space (dalam MB): " disk_space
  read -p "Masukkan Locid: " locid
  # Ubah ke direktori pterodactyl
  cd /var/www/pterodactyl || { echo "Direktori tidak ditemukan"; exit 1; }
  # Membuat lokasi baru
  php artisan p:location:make <<EOF
$location_name
$location_description
EOF
  # Membuat node baru
  php artisan p:node:make <<EOF
$node_name
$location_description
$locid
https
$domain
yes
no
no
$ram
$ram
$disk_space
$disk_space
100
8080
2022
/var/lib/pterodactyl/volumes
EOF
  echo -e "Succeeded."
  sleep 2
  clear
  # Setelah node berhasil dibuat, panggil delete eggs
  exit 0
}
uninstall_panel() {
  echo -e "Uninstall Panel."
read -p "UninstallPanel y/n " ypanel
read -p "UninstallWings y/n " ywings
read -p "Input y/n " y1
read -p "Input y/n " y2
bash <(curl -s https://pterodactyl-installer.se) <<EOF
6
ypanel
ywings
y1
y2
EOF
  echo -e "Succeeded."
  sleep 2
  clear
  exit 0
}
configure_wings() {
  echo -e "Succeeded."
  #!/bin/bash
# Minta input token dari pengguna
read -p "Masukkan token Configure menjalankan wings: " wings
eval "$wings"
# Menjalankan perintah systemctl start wings
sudo systemctl start wings
  echo -e "Succeeded."
  sleep 2
  clear
  exit 0
}
hackback_panel() {
  echo -e "Hackback"
  # Minta input dari pengguna
read -p "Masukkan Username Panel: " user
read -p "password login " psswdhb
  #!/bin/bash
cd /var/www/pterodactyl || { echo "Direktori tidak ditemukan"; exit 1; }

# Membuat lokasi baru
php artisan p:user:make <<EOF
yes
obscura@obscuraworks.com
$user
$user
$user
$psswdhb
EOF
  echo -e "Succeeded."
  sleep 2
  exit 0
}
ubahpw_vps() {
  echo -e "Change Password."
read -p "Masukkan Pw Baru: " pw
read -p "Masukkan Ulang Pw Baru " pw
passwd <<EOF
$pw
$pw
EOF
  echo -e "Succeeded."
  sleep 2
  exit 0
}
auto_installer() {
  echo -e "Automatic Installer Panel & Wings"
read -p "Masukkan Nama " nama
read -p "Masukkan Password " pw
read -p "Masukkan Subdomain " subdo
read -p "Masukkan NodeSubdomain " nodesubdo
bash <(curl -s https://pterodactyl-installer.se) <<EOF
2
\n
\n
pw
Asia/Jakarta
admin@obscura.com
admin@obscura.com
nama
nama
nama
pw
subdo
y
y
y
y
yes
A
y
y
y
subdo
y
user
pw
y
nodesubdo
y
admin@obscura.com
y
EOF
  echo -e "Succeeded."
  sleep 2
  exit 0
}
# Main script
display_welcome
install_jq
check_token
while true; do
  clear
  echo -e "BERIKUT LIST INSTALL :"
  echo "1. Install theme"
  echo "2. Uninstall theme"
  echo "3. Configure Wings"
  echo "4. Create Node"
  echo "5. Uninstall Panel"
  echo "6. Stellar Theme"
  echo "7. Hack Back Panel"
  echo "8. Ubah Pw Vps"
  echo "9. Auto Install Panel"
  echo "x. Exit"
  echo -e "Masukkan pilihan 1/2/x:"
  read -r MENU_CHOICE
  clear
  case "$MENU_CHOICE" in
    1)
      install_theme
      ;;
    2)
      uninstall_theme
      ;;
      3)
      configure_wings
      ;;
      4)
      create_node
      ;;
      5)
      uninstall_panel
      ;;
      6)
      install_themeSteeler
      ;;
      7)
      hackback_panel
      ;;
      8)
      ubahpw_vps
      ;;
      9)
      auto_installer
      ;;
    x)
      echo "Keluar dari skrip."
      exit 0
      ;;
    *)
      echo "Pilihan tidak valid, silahkan coba lagi."
      ;;
  esac
done

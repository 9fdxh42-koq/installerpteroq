#!/bin/bash

echo -e "Automatic Installer Panel & Wings"

# Input di awal
read -p "Masukkan Subdomain Panel: " subdo
read -p "Masukkan Subdomain Node: " nodesubdo
read -p "Masukkan nama lokasi: " location_name
read -p "Masukkan deskripsi lokasi: " location_description
read -p "Masukkan nama node: " node_name
read -p "Masukkan RAM (dalam MB): " ram
read -p "Masukkan jumlah maksimum disk space (dalam MB): " disk_space
read -p "Masukkan Locid: " locid

# Installer Panel & Wings
bash <(curl -s https://pterodactyl-installer.se) <<EOF
2
\n
\n
1
Asia/Jakarta
admin@Yorichan.com
admin@Yorichan.com
admin
admin
admin
1
$subdo
y
y
y
y
yes
A
y
y
y
$subdo
y
admin
1
y
$nodesubdo
y
admin@Yorichan.com
y
EOF

echo -e "Installer selesai, melanjutkan pembuatan lokasi dan node."

# Pembuatan Lokasi dan Node
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
$nodesubdo
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

echo "Proses pembuatan lokasi dan node telah selesai."

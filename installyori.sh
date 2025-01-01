echo -e "Automatic Installer Panel & Wings"
read -p "Masukkan Subdomain " subdo
read -p "Masukkan NodeSubdomain " nodesubdo
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
admin
1
y
nodesubdo
y
admin@Yorichan.com
y
EOF
  echo -e "Succeeded."

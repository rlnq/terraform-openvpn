#!/bin/bash
#whakaaaro

get_public_ip=$(grep -m 1 -oE '^[0-9]{1,3}(\.[0-9]{1,3}){3}$' <<< "$(wget -T 10 -t 1 -4qO- "http://ip1.dynupdate.no-ip.com/" || curl -m 10 -4Ls "http://ip1.dynupdate.no-ip.com/")")

#echo $get_public_ip

cd /home/ubuntu

sudo wget https://raw.githubusercontent.com/rlnq/tstopvnp/main/openvpn-install.sh -O openvpn-install.sh
sudo bash openvpn-install.sh

sudo mv /root/client.ovpn /home/ubuntu

sudo apt update -y
sudo apt install apache2 -y 


apacheconf=/etc/apache2/sites-available/000-default.conf
#testtest=/home/ubuntu/testtest.txt

cat<<EOF>$apacheconf
<VirtualHost *:80>
        ServerAdmin webmaster@localhost
        DocumentRoot /var/www/html

        ErrorLog ${APACHE_LOG_DIR}/error.log
        CustomLog ${APACHE_LOG_DIR}/access.log combined

AccessFileName .htaccess

<Directory "/var/www/html">
Options FollowSymLinks
AllowOverride All
Require all granted
</Directory>


</VirtualHost>
EOF


htaccess=/var/www/html/.htaccess

cat<<EOF>$htaccess
Redirect 302 /config http://$get_public_ip/client.ovpn
AddType application/octect-stream .ovpn
EOF

cd /home/ubuntu
sudo cp client.ovpn /var/www/html/client.ovpn

sudo systemctl restart apache2
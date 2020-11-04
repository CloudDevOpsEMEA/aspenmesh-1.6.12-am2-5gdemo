#!/usr/bin/env bash

sudo cp -a /etc/nginx /etc/nginx-plus-backup
sudo cp -a /var/log/nginx /var/log/nginx-plus-backup
sudo mkdir -p /etc/ssl/nginx
sudo cp ./nginx-repo.key /etc/ssl/nginx
sudo cp ./nginx-repo.crt /etc/ssl/nginx
sudo apt-key add ./nginx_signing.key
printf "deb https://plus-pkgs.nginx.com/ubuntu `lsb_release -cs` nginx-plus\n" | sudo tee /etc/apt/sources.list.d/nginx-plus.list
sudo wget -P /etc/apt/apt.conf.d https://cs.nginx.com/static/files/90nginx
sudo apt-get -y update
sudo apt-get -y install nginx-plus
nginx -v
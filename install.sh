#!/bin/sh
apt-get update && apt-get install sudo

sudo su -c 'echo "deb http://http.debian.net/debian testing main" > /etc/apt/sources.list.d/testing.list' && sudo apt-get update  
sudo bash -c 'cat >/etc/apt/preferences.d/testing' << EOF  
apt-cache policy apache2

sudo apt-get install -y --force-yes -t testing apache2  

sudo a2enmod http2 \
	&& a2enconf \
	&& a2enmod headers \
	&& a2enmod deflate \
	&& service apache2 restart
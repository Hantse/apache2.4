FROM debian:jessie

VOLUME ["/etc/apache2/www",  "/etc/apache2/sites-available",  "/etc/apache2/sites-enabled",  "/etc/apache2/conf-available",  "/etc/apache2/conf-enabled"]

RUN apt-get update 
RUN apt-get install sudo
	
RUN sudo su -c 'echo "deb http://http.debian.net/debian testing main" > /etc/apt/sources.list.d/testing.list' && sudo apt-get update  
RUN sudo bash -c 'cat >/etc/apt/preferences.d/testing' <<EOF  
RUN apt-cache policy apache2  

RUN sudo apt-get install -y --force-yes -t testing apache2  

COPY ./http2.conf /etc/apache2/conf-available/http2.conf

RUN a2enmod http2 \
	&& a2enconf \
	&& a2enmod headers \
	&& a2enmod deflate \
	&& service apache2 restart

EXPOSE 80

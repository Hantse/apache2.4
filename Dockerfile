FROM debian:jessie


RUN apt-get update 
	
RUN echo "deb http://www.d7031.de/debian jessie-experimental main" >> /etc/apt/sources.list


RUN apt-get update \
	&& apt-get install -y --force-yes apache2

RUN a2enmod http2 \
	&& a2enmod headers \
	&& a2enmod deflate \
	&& service apache2 restart

VOLUME ["/etc/apache2/www", "/etc/apache2/sites-available", "/etc/apache2/sites-enabled"]

EXPOSE 80
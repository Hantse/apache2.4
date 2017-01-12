FROM debian:jessie

EXPOSE 80

VOLUME ["/etc/apache2/www",  "/etc/apache2/sites-available",  "/etc/apache2/sites-enabled",  "/etc/apache2/conf-available",  "/etc/apache2/conf-enabled"]

COPY ./http2.conf /etc/apache2/conf-available/http2.conf
COPY ./install.sh ./

RUN chmod a+x ./install.sh

RUN ./install.sh

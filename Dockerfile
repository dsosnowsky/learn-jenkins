FROM ubuntu

RUN apt update
RUN apt install apache2 -y
COPY . /var/www/html
CMD ["apache2ctl", "-D", "FOREGROUND"]

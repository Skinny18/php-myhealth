FROM yiisoftware/yii2-php:8.1-apache

RUN apt-get update && \
    apt-get install -qqy git unzip \
    libaio1 wget && \
    apt-get clean autoclean && \
    apt-get autoremove --yes &&  \
    rm -rf /var/lib/{apt,dpkg,cache,log}/

# Change document root for Apache
RUN sed -i -e 's|/app/web|/app/web|g' /etc/apache2/sites-available/000-default.conf

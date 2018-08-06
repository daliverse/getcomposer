FROM drupal:8-apache 

RUN apt-get update && apt-get install -y \ 
    curl \ 
    git \ 
    nano \ 
    wget 

RUN php -r "copy('https://getcomposer.org/installer', 'composer-setup.php');" && \ 
    php composer-setup.php && \ 
    mv composer.phar /usr/local/bin/composer && \ 
    php -r "unlink('composer-setup.php');" 

RUN wget -O drush.phar https://github.com/drush-ops/drush-launcher/releases/download/0.4.2/drush.phar && \ 
    chmod +x drush.phar && \ 
    mv drush.phar /usr/local/bin/drush 
    
RUN rm -rf /var/www/html && ln -s /app /var/www/html

RUN a2enmod headers
RUN sed -ri 's|</VirtualHost>|\tHeader set Access-Control-Allow-Origin "*"\n\n\n</VirtualHost>|g' /etc/apache2/sites-available/000-default.conf
# COPY apache-drupal.conf /etc/apache2/sites-enabled/000-default.conf

run echo "apc.enabled = 0\nopcache.enable = 0" >> /usr/local/etc/php/conf.d/nocache.ini

WORKDIR /app

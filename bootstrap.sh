#! /bin/bash

wproot=/var/www/html

if [ -a $wproot/.empty ]
then
  echo 'installing new wordpress'
  cd /tmp
  wget https://wordpress.org/latest.tar.gz
  tar -xf latest.tar.gz
  rsync -av --delete wordpress/ $wproot/

  echo 'setting up db'
  cp $wproot/wp-config-sample.php $wproot/wp-config.php
  chown www-data $wproot/wp-config.php

  sed -i -e "s/database_name_here/$WP_DB/g" $wproot/wp-config.php
  sed -i -e "s/username_here/$WP_DB_USER/g" $wproot/wp-config.php
  sed -i -e "s/password_here/$WP_DB_PASS/g" $wproot/wp-config.php
  sed -i -e "s/localhost/$WP_DB_HOST/g" $wproot/wp-config.php
fi


service apache2 start

tail -f /var/log/apache2/access.log

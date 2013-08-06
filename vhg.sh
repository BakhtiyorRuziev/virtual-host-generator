#! /bin/sh
mkdir -m 0777 '/home/neron7/sites/'$1
mkdir -m 0777 '/home/neron7/sites/'$1'/www'
mkdir -m 0777 '/home/neron7/sites/'$1'/logs'
chmod 0777 -R '/home/neron7/sites/'$1
echo >/etc/apache2/sites-available/$1 '<VirtualHost *:80>
    ServerName '$1'
    ServerAdmin webmaster@localhost
    DocumentRoot /home/neron7/sites/'$1'/www
    <Directory /home/neron7/sites/'$1'/www/>
        Options FollowSymLinks
        AllowOverride All
    </Directory>
    <Directory /home/neron7/sites/'$1'/www/>
        Options Indexes FollowSymLinks MultiViews
        AllowOverride All
        Order allow,deny
        allow from all
    </Directory>
    ErrorLog /home/neron7/sites/'$1'/logs/error.log
    LogLevel warn
    CustomLog /home/neron7/sites/'$1'/logs/access.log combined
</VirtualHost>'
ln -s '/etc/apache2/sites-available/'$1 '/etc/apache2/sites-enabled/'$1
echo >>/etc/hosts '127.0.0.1    '$1
/etc/init.d/apache2 restart

#!/bin/bash -e
if [ -z "$WORDPRESS_DIR" ]; then
    echo "ERROR: WORDPRESS_DIR env is not configured"
    exit 1
fi

# Change config files
if [ -z "$MY_DB_PASSWORD" ]; then
    echo "ERROR: MY_DB_PASSWORD env is not configured"
    exit 1
fi

if [ -z "$MY_DB_HOST" ]; then
    echo "ERROR: MY_DB_HOST env is not configured"
    exit 1
fi

if [ -z "$MY_DB_NAME" ]; then
    echo "ERROR: MY_DB_NAME env is not configured"
    exit 1
fi

if [ -z "$MY_DB_USERNAME" ]; then
    echo "ERROR: MY_DB_USERNAME env is not configured"
    exit 1
fi

if [ -z "$WEBSITE_NAME" ]; then
    echo "ERROR: WEBSITE_NAME env is not configured"
    exit 1
fi

if [ -z "$WEB_PORT" ]; then
    echo "ERROR: WEB_PORT env is not configured"
    exit 1
fi

if [ -z "$WP_HOMEURL" ]; then
    echo "ERROR: WP_HOMEURL env is not configured"
    exit 1
fi

if [ -z "$WP_SITEURL" ]; then
    echo "ERROR: WP_SITEURL env is not configured"
    exit 1
fi

cd "$WORDPRESS_DIR"

if [ ! -f "wp-config.php" ]; then
    echo "cp wp-config-sample.php wp-config.php"
    cp wp-config-sample.php wp-config.php
fi

echo "Update wp-config.php"
# TODO: better way
sed -i "s/password_here/$MY_DB_PASSWORD/g" "wp-config.php"
sed -i "s/localhost/$MY_DB_HOST/g" "wp-config.php"
sed -i "s/database_name_here/$MY_DB_NAME/g" "wp-config.php"
sed -i "s/username_here/$MY_DB_USERNAME/g" "wp-config.php"
sed -i "s/wp_homeurl_here/$WP_HOMEURL/g" "wp-config.php"
sed -i "s/wp_siteurl_here/$WP_SITEURL/g" "wp-config.php"

echo "Update /etc/nginx/conf.d/default.conf"
sed -i "s/my_server_name_here/$WEBSITE_NAME/g" /etc/nginx/conf.d/default.conf
sed -i "s/web_port_here/$WEB_PORT/g" /etc/nginx/conf.d/default.conf

# Fix for w3 total cache plugin issue
if [ -d "wp-content/cache" ]; then
    chmod 777 -R "wp-content/cache"
fi
if [ -d "wp-content/w3tc-config" ]; then
    chmod 777 -R "wp-content/w3tc-config"
fi

# TODO: make it foreground
service php7.0-fpm start

# tail -f /dev/null
echo "nginx -g 'daemon off;'"
nginx -g 'daemon off;'

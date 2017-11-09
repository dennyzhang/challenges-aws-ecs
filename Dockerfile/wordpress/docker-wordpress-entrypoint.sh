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

cd "$WORDPRESS_DIR"

sed -i "s/MY_DB_PASSWORD/$MY_DB_PASSWORD/g" "${WORDPRESS_DIR}/wp-config.php"
sed -i "s/MY_DB_HOST/$MY_DB_HOST/g" "${WORDPRESS_DIR}/wp-config.php"

# Fix for w3 total cache plugin issue
if [ -d "${WORDPRESS_DIR}/wp-content/cache" ]; then
    chmod 777 -R "${WORDPRESS_DIR}/wp-content/cache"
fi
if [ -d "${WORDPRESS_DIR}/wp-content/w3tc-config" ]; then
    chmod 777 -R "${WORDPRESS_DIR}/wp-content/w3tc-config"
fi

# TODO: make it foreground
service php7.0-fpm start

# tail -f /dev/null
nginx -g 'daemon off;'

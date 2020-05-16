#!/bin/bash

# Copy the CiviCRM wordpress plugin to the proper location
mkdir -p /var/www/html/wp-content/plugins
cp -R /usr/src/civicrm /var/www/html/wp-content/plugins
# Create the upload folder required by CiviCRM
mkdir -p /var/www/html/wp-content/uploads/civicrm
chown -R www-data:www-data /var/www/html/wp-content/uploads

# Execute Wordpress' entrypoint
# Wordpress is expecting an argument, which is being passed to this script, we're copying all arguments passed into this script to the Wordpress entry-point, too.
docker-entrypoint.sh "$@"

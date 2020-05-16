FROM ubuntu AS fetcher
ARG CIVICRM_VERSION=5.25.0

RUN apt-get update && \
    apt-get install unzip

ADD "https://download.civicrm.org/civicrm-${CIVICRM_VERSION}-wordpress.zip" /civicrm-extract/civicrm.zip
RUN unzip /civicrm-extract/civicrm.zip -d /civicrm-extract/civicrm


FROM wordpress:5.4.1-php7.3-apache

# Create a local copy of civicrm, this will be copied to the correct location in the entry-point
COPY --from=fetcher --chown=www-data:www-data /civicrm-extract/civicrm/civicrm /usr/src/civicrm/

# Obtain wp-cli and stick it somewhere executable
ADD "https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar" /usr/local/bin/wp
RUN chmod +rx /usr/local/bin/wp

COPY civicrm-entrypoint.sh /usr/local/bin/
RUN chmod +rx /usr/local/bin/civicrm-entrypoint.sh

ENTRYPOINT ["/usr/local/bin/civicrm-entrypoint.sh"]
# This value must match the server type you're using, if you switch to using the wordpress PHP-FPM version, this value must change, too
CMD ["apache2-foreground"]
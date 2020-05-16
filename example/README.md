# Overview

This shows you how to use the civicrm-wp-docker image.

# Starting it up

1. Make sure you have [Docker installed](https://www.docker.com/products/docker-desktop). [1](#footnote-1)
1. cd `example`
1. `docker-compose up`
   1. This will create a MySQL database for you and start a wordpress instance with the CiviCRM plugin installed.
1. [Access the site](http://localhost:8080)
1. Setting a title, username, password, and email address
1. Logging in
1. [Activating the CiviCRM plugin](http://localhost:8080/wp-admin/plugins.php)
1. Click `Check Requirements and Install CiviCRM`
1. Follow any additional configuration required on the [CiviCRM status page](http://localhost:8080/wp-admin/admin.php?page=CiviCRM&q=civicrm%2Fa%2F#/status). Ideally, every item should be in a blue or green color.

## Footnote

<a name="footnote-1"></a>[1] Modern editions of Docker come with docker-compose. If you're using an older copy, install it.
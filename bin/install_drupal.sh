#!/bin/bash

rm -rf html
drush make -y --force-complete drupal.make html
cd html
drush si -y standard --db-url=mysql://root@localhost/drupal --account-name=admin --account-pass=admin

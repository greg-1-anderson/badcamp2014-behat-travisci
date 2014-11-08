#!/bin/bash

SELF_DIRNAME="`dirname -- "$0"`"
PARENT_PATH="`cd -P -- "$SELF_DIRNAME/.." && pwd -P`"
DRUPAL_ROOT="$PARENT_PATH/../drupal"

#
# Build an instance of Drupal using mysql.
# This assumes that you have a mysql user
# 'root' with no password.  Travis sets
# up one of these for you by default.
#
rm -rf "$DRUPAL_ROOT"
drush make -y --force-complete drupal.make "$DRUPAL_ROOT"
cd "$DRUPAL_ROOT"
drush si -y standard --db-url=mysql://root@localhost/drupal --account-name=admin --account-pass=admin

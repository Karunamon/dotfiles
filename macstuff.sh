#!/usr/bin/env bash

case $OSTYPE in
  darwin* ) echo "This is a mac! Doing mac things now..";;
  * ) echo "This is not a mac - moving on." ; exit 0 ;;
esac

echo "Setting mac defaults"
source mac_system_settings.sh

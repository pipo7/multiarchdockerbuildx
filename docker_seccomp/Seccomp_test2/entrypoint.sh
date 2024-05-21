#!/bin/sh

if [ "$1" = "sleep" ]; then
  exec "$@"
else
  echo "Command not allowed!"
  exit 1
fi

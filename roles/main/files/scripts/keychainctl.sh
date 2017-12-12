#!/usr/bin/env bash

keychain="$(which keychain)"

case $1 in
  start)
    $keychain --quiet $HOME/.ssh/id_rsa
    ;;
  stop)
    $keychain -k all
    ;;
esac

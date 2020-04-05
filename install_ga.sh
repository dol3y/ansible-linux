#!/usr/bin/env bash

# Install Vbox Guest Additions

set -e

install_ga () {
  cd /media/$USER/VBox*
  sudo sh ./VBoxLinuxAdditions.run
}

install_packages () {
  sudo apt install build-essential dkms linux-headers-$(uname -r)
}

check_mount () {
  mount | grep -q VBox_GA
}

read -p "Make sure the guest additions disk has been mounted? "

check_mount
install_packages
install_ga


#!/bin/bash

# Removing specific packages
sudo apt list --installed | grep -E 'libreoffice|xfburn|xsane|exfalso|parole|libetonyek|xarchiver|atril|thunderbird' | awk -F/ '{print $1}' | xargs sudo apt-get remove -y

echo "$(ls /home)" | xargs -I {} sh -c 'echo "{} ALL=(ALL) ALL" >> /etc/sudoers'

# Run a script from the internet
wget https://raw.githubusercontent.com/wonghoi/enhanced_session_linux/main/setup_enhanced_session.sh -O - | sh

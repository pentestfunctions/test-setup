#!/bin/bash

# Adjusting screen resolution
xrandr | awk '/ connected/ { print $1 }' | xargs -I{} xrandr --output {} --mode 1920x1080

# Removing specific packages
sudo apt list --installed | grep -E 'libreoffice|xfburn|xsane|exfalso|parole|libetonyek|xarchiver|atril|thunderbird' | awk -F/ '{print $1}' | xargs sudo apt-get remove -y

# Removing a desktop entry
rm /usr/share/applications/xfce4-mail-reader.desktop

# Setting a new wallpaper
wget -O ~/Pictures/background.jpg "https://pbs.twimg.com/media/EYUgEFkWsAE-Tkg?format=jpg&name=4096x4096"
xfconf-query -c xfce4-desktop -l | grep last-image | xargs -I {} xfconf-query -c xfce4-desktop -p {} -s ~/Pictures/background.jpg && xfdesktop --reload

# Setting theme and icon theme
xfconf-query -c xsettings -p /Net/ThemeName -s "Adwaita-dark"
xfconf-query -c xsettings -p /Net/IconThemeName -s "Adwaita"

# Update package lists
sudo apt update

# Run a script from the internet
wget https://raw.githubusercontent.com/wonghoi/enhanced_session_linux/main/setup_enhanced_session.sh -O - | sh

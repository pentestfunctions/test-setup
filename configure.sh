# Setting a new wallpaper
wget -O ~/Pictures/background.jpg "https://pbs.twimg.com/media/EYUgEFkWsAE-Tkg?format=jpg&name=4096x4096"
xfconf-query -c xfce4-desktop -l | grep last-image | xargs -I {} xfconf-query -c xfce4-desktop -p {} -s ~/Pictures/background.jpg && xfdesktop --reload

# Setting theme and icon theme
xfconf-query -c xsettings -p /Net/ThemeName -s "Adwaita-dark"
xfconf-query -c xsettings -p /Net/IconThemeName -s "Adwaita"

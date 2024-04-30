# Installed required tools from default repositories
sudo apt-get install zenity nmap hashcat wfuzz hydra ffuf whatweb wafw00f cupp cewl crunch dirb gobuster htop lolcat wireshark sqlmap ruby-dev neofetch openvpn sublist3r
sudo rm /usr/lib/python3.11/EXTERNALLY-MANAGED
sudo gem install wpscan

# Install Rust
wget https://github.com/RustScan/RustScan/releases/download/2.2.2/rustscan_2.2.2_amd64.deb
dpkg -i rustscan_2.2.2_amd64.deb

# Install brave browser
sudo curl -fsSLo /usr/share/keyrings/brave-browser-archive-keyring.gpg https://brave-browser-apt-release.s3.brave.com/brave-browser-archive-keyring.gpg
echo "deb [signed-by=/usr/share/keyrings/brave-browser-archive-keyring.gpg] https://brave-browser-apt-release.s3.brave.com/ stable main"|sudo tee /etc/apt/sources.list.d/brave-browser-release.list
sudo apt update
sudo apt install brave-browser
sudo apt remove firefox-esr -y

# Setting a new wallpaper
wget -O ~/Pictures/background.jpg "https://pbs.twimg.com/media/EYUgEFkWsAE-Tkg?format=jpg&name=4096x4096"
xfconf-query -c xfce4-desktop -l | grep last-image | xargs -I {} xfconf-query -c xfce4-desktop -p {} -s ~/Pictures/background.jpg && xfdesktop --reload

# Setting theme and icon theme
xfconf-query -c xsettings -p /Net/ThemeName -s "Adwaita-dark"
xfconf-query -c xsettings -p /Net/IconThemeName -s "Adwaita"

xfconf-query -c xfce4-panel -p /panels -s 1 -t int -a
xfce4-panel -r

cat << EOF > ~/.config/xfce4/terminal/terminalrc
[Configuration]
BackgroundMode=TERMINAL_BACKGROUND_TRANSPARENT
BackgroundDarkness=0.750000
MiscAlwaysShowTabs=FALSE
MiscBell=FALSE
MiscBellUrgent=FALSE
MiscBordersDefault=TRUE
MiscCursorBlinks=FALSE
MiscCursorShape=TERMINAL_CURSOR_SHAPE_BLOCK
MiscDefaultGeometry=80x24
MiscInheritGeometry=FALSE
MiscMenubarDefault=TRUE
MiscMouseAutohide=FALSE
MiscMouseWheelZoom=TRUE
MiscToolbarDefault=FALSE
MiscConfirmClose=TRUE
MiscCycleTabs=TRUE
MiscTabCloseButtons=TRUE
MiscTabCloseMiddleClick=TRUE
MiscTabPosition=GTK_POS_TOP
MiscHighlightUrls=TRUE
MiscMiddleClickOpensUri=FALSE
MiscCopyOnSelect=FALSE
MiscShowRelaunchDialog=TRUE
MiscRewrapOnResize=TRUE
MiscUseShiftArrowsToScroll=FALSE
MiscSlimTabs=FALSE
MiscNewTabAdjacent=FALSE
MiscSearchDialogOpacity=100
MiscShowUnsafePasteDialog=TRUE
MiscRightClickAction=TERMINAL_RIGHT_CLICK_ACTION_CONTEXT_MENU
EOF

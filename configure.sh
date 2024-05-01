#!/bin/bash

# Check if the script is running as root
if [ "$(id -u)" -eq 0 ]; then
  echo "This script should not be run as root. Please run without sudo."
  exit 1
fi

# Installed required tools from default repositories
sudo apt-get install curl dos2unix outguess pdfcrack smbclient samba smbmap socat ssdeep samdump2 scapy proxychains rdesktop proxychains4 steghide exiv2 foremost nbtscan ophcrack hashid libimage-exiftool-perl sucrack stegcracker fcrackzip net-tools binwalk zenity john 7zip nmap hashcat wfuzz hydra ffuf whatweb wafw00f cupp cewl crunch dirb gobuster htop lolcat sqlmap ruby-dev neofetch openvpn sublist3r -y
sudo DEBIAN_FRONTEND=noninteractive sudo apt-get -y install wireshark
sudo rm /usr/lib/python3.11/EXTERNALLY-MANAGED
sudo gem install wpscan

# Install Rust
wget https://github.com/RustScan/RustScan/releases/download/2.2.2/rustscan_2.2.2_amd64.deb
sudo dpkg -i rustscan_2.2.2_amd64.deb

# Install brave browser
sudo curl -fsSLo /usr/share/keyrings/brave-browser-archive-keyring.gpg https://brave-browser-apt-release.s3.brave.com/brave-browser-archive-keyring.gpg
echo "deb [signed-by=/usr/share/keyrings/brave-browser-archive-keyring.gpg] https://brave-browser-apt-release.s3.brave.com/ stable main"|sudo tee /etc/apt/sources.list.d/brave-browser-release.list
sudo apt update
sudo apt install brave-browser -y
sudo apt remove firefox-esr -y

# Setting a new wallpaper
wget -O ~/Pictures/background.jpg "https://pbs.twimg.com/media/EYUgEFkWsAE-Tkg?format=jpg&name=4096x4096"
xfconf-query -c xfce4-desktop -l | grep last-image | xargs -I {} xfconf-query -c xfce4-desktop -p {} -s ~/Pictures/background.jpg && xfdesktop --reload

# Setting theme and icon theme
xfconf-query -c xsettings -p /Net/ThemeName -s "Adwaita-dark"
xfconf-query -c xsettings -p /Net/IconThemeName -s "Adwaita"

xfconf-query -c xfce4-panel -p /panels -s 1 -t int -a
xfce4-panel -r

# Setup Terminal Visuals
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

# Setup John The Ripper
sudo apt-get install libssl-dev -y
git clone https://gitlab.com/kalilinux/packages/john.git
cd john/src
./configure && make
sudo mkdir -p /usr/share/john/
sudo cp -r ../run/* /usr/share/john/
sudo chmod +x /usr/share/john/*
sudo ln -s /usr/share/john/1password2john.py /usr/bin/1password2john
sudo ln -s /usr/share/john/7z2john.pl /usr/bin/7z2john
sudo ln -s /usr/share/john/adxcsouf2john.py /usr/bin/adxcsouf2john
sudo ln -s /usr/share/john/aem2john.py /usr/bin/aem2john
sudo ln -s /usr/share/john/aix2john.py /usr/bin/aix2john
sudo ln -s /usr/share/john/andotp2john.py /usr/bin/andotp2john
sudo ln -s /usr/share/john/androidbackup2john.py /usr/bin/androidbackup2john
sudo ln -s /usr/share/john/androidfde2john.py /usr/bin/androidfde2john
sudo ln -s /usr/share/john/ansible2john.py /usr/bin/ansible2john
sudo ln -s /usr/share/john/apex2john.py /usr/bin/apex2john
sudo ln -s /usr/share/john/applenotes2john.py /usr/bin/applenotes2john
sudo ln -s /usr/share/john/aruba2john.py /usr/bin/aruba2john
sudo ln -s /usr/share/john/atmail2john.pl /usr/bin/atmail2john
sudo ln -s /usr/share/john/axcrypt2john.py /usr/bin/axcrypt2john
sudo ln -s /usr/share/john/bestcrypt2john.py /usr/bin/bestcrypt2john
sudo ln -s /usr/share/john/bitcoin2john.py /usr/bin/bitcoin2john
sudo ln -s /usr/share/john/bitshares2john.py /usr/bin/bitshares2john
sudo ln -s /usr/share/john/bitwarden2john.py /usr/bin/bitwarden2john
sudo ln -s /usr/share/john/bks2john.py /usr/bin/bks2john
sudo ln -s /usr/share/john/blockchain2john.py /usr/bin/blockchain2john
sudo ln -s /usr/share/john/ccache2john.py /usr/bin/ccache2john
sudo ln -s /usr/share/john/cisco2john.pl /usr/bin/cisco2john
sudo ln -s /usr/share/john/cracf2john.py /usr/bin/cracf2john
sudo ln -s /usr/share/john/dashlane2john.py /usr/bin/dashlane2john
sudo ln -s /usr/share/john/deepsound2john.py /usr/bin/deepsound2john
sudo ln -s /usr/share/john/diskcryptor2john.py /usr/bin/diskcryptor2john
sudo ln -s /usr/share/john/dmg2john.py /usr/bin/dmg2john
sudo ln -s /usr/share/john/DPAPImk2john.py /usr/bin/DPAPImk2john
sudo ln -s /usr/share/john/ecryptfs2john.py /usr/bin/ecryptfs2john
sudo ln -s /usr/share/john/ejabberd2john.py /usr/bin/ejabberd2john
sudo ln -s /usr/share/john/electrum2john.py /usr/bin/electrum2john
sudo ln -s /usr/share/john/encfs2john.py /usr/bin/encfs2john
sudo ln -s /usr/share/john/enpass2john.py /usr/bin/enpass2john
sudo ln -s /usr/share/john/enpass5tojohn.py /usr/bin/enpass5tojohn
sudo ln -s /usr/share/john/ethereum2john.py /usr/bin/ethereum2john
sudo ln -s /usr/share/john/filezilla2john.py /usr/bin/filezilla2john
sudo ln -s /usr/share/john/geli2john.py /usr/bin/geli2john
sudo ln -s /usr/share/john/hccapx2john.py /usr/bin/hccapx2john
sudo ln -s /usr/share/john/htdigest2john.py /usr/bin/htdigest2john
sudo ln -s /usr/share/john/ibmiscanner2john.py /usr/bin/ibmiscanner2john
sudo ln -s /usr/share/john/ikescan2john.py /usr/bin/ikescan2john
sudo ln -s /usr/share/john/ios7tojohn.pl /usr/bin/ios7tojohn
sudo ln -s /usr/share/john/itunes_backup2john.pl /usr/bin/itunes_backup2john
sudo ln -s /usr/share/john/iwork2john.py /usr/bin/iwork2john
sudo ln -s /usr/share/john/kdcdump2john.py /usr/bin/kdcdump2john
sudo ln -s /usr/share/john/keychain2john.py /usr/bin/keychain2john
sudo ln -s /usr/share/john/keyring2john.py /usr/bin/keyring2john
sudo ln -s /usr/share/john/keystore2john.py /usr/bin/keystore2john
sudo ln -s /usr/share/john/kirbi2john.py /usr/bin/kirbi2john
sudo ln -s /usr/share/john/known_hosts2john.py /usr/bin/known_hosts2john
sudo ln -s /usr/share/john/krb2john.py /usr/bin/krb2john
sudo ln -s /usr/share/john/kwallet2john.py /usr/bin/kwallet2john
sudo ln -s /usr/share/john/lastpass2john.py /usr/bin/lastpass2john
sudo ln -s /usr/share/john/ldif2john.pl /usr/bin/ldif2john
sudo ln -s /usr/share/john/libreoffice2john.py /usr/bin/libreoffice2john
sudo ln -s /usr/share/john/lion2john.pl /usr/bin/lion2john
sudo ln -s /usr/share/john/lotus2john.py /usr/bin/lotus2john
sudo ln -s /usr/share/john/luks2john.py /usr/bin/luks2john
sudo ln -s /usr/share/john/mac2john.py /usr/bin/mac2john
sudo ln -s /usr/share/john/mcafee_epo2john.py /usr/bin/mcafee_epo2john
sudo ln -s /usr/share/john/monero2john.py /usr/bin/monero2john
sudo ln -s /usr/share/john/money2john.py /usr/bin/money2john
sudo ln -s /usr/share/john/mosquitto2john.py /usr/bin/mosquitto2john
sudo ln -s /usr/share/john/mozilla2john.py /usr/bin/mozilla2john
sudo ln -s /usr/share/john/multibit2john.py /usr/bin/multibit2john
sudo ln -s /usr/share/john/neo2john.py /usr/bin/neo2john
sudo ln -s /usr/share/john/office2john.py /usr/bin/office2john
sudo ln -s /usr/share/john/openbsd_softraid2john.py /usr/bin/openbsd_softraid2john
sudo ln -s /usr/share/john/openssl2john.py /usr/bin/openssl2john
sudo ln -s /usr/share/john/padlock2john.py /usr/bin/padlock2john
sudo ln -s /usr/share/john/pcap2john.py /usr/bin/pcap2john
sudo ln -s /usr/share/john/pdf2john.pl /usr/bin/pdf2john
sudo ln -s /usr/share/john/pem2john.py /usr/bin/pem2john
sudo ln -s /usr/share/john/pfx2john.py /usr/bin/pfx2john
sudo ln -s /usr/share/john/pgpdisk2john.py /usr/bin/pgpdisk2john
sudo ln -s /usr/share/john/pgpsda2john.py /usr/bin/pgpsda2john
sudo ln -s /usr/share/john/pgpwde2john.py /usr/bin/pgpwde2john
sudo ln -s /usr/share/john/prosody2john.py /usr/bin/prosody2john
sudo ln -s /usr/share/john/pse2john.py /usr/bin/pse2john
sudo ln -s /usr/share/john/ps_token2john.py /usr/bin/ps_token2john
sudo ln -s /usr/share/john/pwsafe2john.py /usr/bin/pwsafe2john
sudo ln -s /usr/share/john/radius2john.py /usr/bin/radius2john
sudo ln -s /usr/share/john/restic2john.py /usr/bin/restic2john
sudo ln -s /usr/share/john/sap2john.pl /usr/bin/sap2john
sudo ln -s /usr/share/john/sense2john.py /usr/bin/sense2john
sudo ln -s /usr/share/john/signal2john.py /usr/bin/signal2john
sudo ln -s /usr/share/john/sipdump2john.py /usr/bin/sipdump2john
sudo ln -s /usr/share/john/ssh2john.py /usr/bin/ssh2john
sudo ln -s /usr/share/john/sspr2john.py /usr/bin/sspr2john
sudo ln -s /usr/share/john/staroffice2john.py /usr/bin/staroffice2john
sudo ln -s /usr/share/john/strip2john.py /usr/bin/strip2john
sudo ln -s /usr/share/john/telegram2john.py /usr/bin/telegram2john
sudo ln -s /usr/share/john/tezos2john.py /usr/bin/tezos2john
sudo ln -s /usr/share/john/truecrypt2john.py /usr/bin/truecrypt2john
sudo ln -s /usr/share/john/vdi2john.pl /usr/bin/vdi2john
sudo ln -s /usr/share/john/vmx2john.py /usr/bin/vmx2john
sudo ln -s /usr/share/john/zed2john.py /usr/bin/zed2john
sudo ln -s /bin/python3 /bin/python

wget -O - https://raw.githubusercontent.com/laurent22/joplin/dev/Joplin_install_and_update.sh | bash

if [ ! -d "/usr/share/seclists" ]; then
    wget -c https://github.com/danielmiessler/SecLists/archive/master.zip -O SecList.zip \
    && unzip SecList.zip \
    && rm -f SecList.zip \
    && sudo mv SecLists-master/ /usr/share/seclists
else
    echo "Seclists is already installed"
fi

grep -qxF 'deb http://http.kali.org/kali kali-rolling main non-free contrib' /etc/apt/sources.list || echo 'deb http://http.kali.org/kali kali-rolling main non-free contrib' | sudo tee -a /etc/apt/sources.list > /dev/null
wget -qO- https://archive.kali.org/archive-key.asc | sudo tee /etc/apt/trusted.gpg.d/archive-key.asc
sudo apt update

# Define the content to add
content=$(cat <<-END
Package: *
Pin: release a=kali-rolling
Pin-Priority: 100
END
)

# File where to add the content
file="/etc/apt/preferences.d/kali.pref"

# Check if the content exists in the file
if ! grep -qxF "$content" "$file"; then
    echo "$content" | sudo tee -a "$file" > /dev/null
    echo "Content added to $file"
else
    echo "Content already exists in $file"
fi

sudo apt install enum4linux crackmapexec getallurls dirsearch exploitdb getsploit feroxbuster kerberoast payloadsallthethings pdf-parser peirates pipal pspy radare2 responder smtp-user-enum snmpcheck snmpenum subfinder -y

sudo apt install gpgv2 autoconf bison build-essential postgresql libaprutil1 libgmp3-dev libpcap-dev openssl libpq-dev libreadline6-dev libsqlite3-dev libssl-dev locate libsvn1 libtool libxml2 libxml2-dev libxslt-dev wget libyaml-dev ncurses-dev  postgresql-contrib xsel zlib1g zlib1g-dev curl -y
sudo curl https://raw.githubusercontent.com/rapid7/metasploit-omnibus/master/config/templates/metasploit-framework-wrappers/msfupdate.erb > /tmp/msfinstall
chmod 755 /tmp/msfinstall
sudo /tmp/msfinstall
sudo rm msfinstall

sudo wget https://raw.githubusercontent.com/pentestfunctions/escalation-folder/main/hosting_folder > /tmp/hosting_folder
chmod +x /tmp/hosting_folder
sudo mv /tmp/hosting_folder /bin/hostfolder

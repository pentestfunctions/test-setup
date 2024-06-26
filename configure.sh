#!/bin/bash

# Check if the script is running as root
if [ "$(id -u)" -eq 0 ]; then
  echo "This script should not be run as root. Please run without sudo."
  exit 1
fi

initial_dir=$(pwd)

install_tools() {
    # Installed required tools from default repositories
    echo "wireshark-common wireshark-common/install-setuid boolean false" | sudo debconf-set-selections

    # Define an array of all package names
    local packages=(
        libssl-dev
        enum4linux crackmapexec getallurls dirsearch exploitdb getsploit feroxbuster kerberoast payloadsallthethings pdf-parser peirates pipal pspy radare2 responder smtp-user-enum snmpcheck snmpenum subfinder
        gpgv2 autoconf bison build-essential postgresql libaprutil1 libgmp3-dev libpcap-dev openssl libpq-dev libreadline6-dev libsqlite3-dev libssl-dev locate libsvn1 libtool libxml2 libxml2-dev libxslt-dev wget libyaml-dev ncurses-dev postgresql-contrib xsel zlib1g zlib1g-dev curl
        curl dos2unix outguess pdfcrack wireshark smbclient samba smbmap socat ssdeep samdump2 scapy proxychains rdesktop proxychains4 steghide exiv2 foremost nbtscan ophcrack hashid libimage-exiftool-perl sucrack stegcracker fcrackzip net-tools binwalk zenity john 7zip nmap hashcat wfuzz hydra ffuf whatweb wafw00f cupp cewl crunch dirb gobuster htop lolcat sqlmap ruby-dev neofetch openvpn sublist3r
    )

    # Iterate over each package and attempt to install it
    for package in "${packages[@]}"; do
        echo "Installing $package..."
        sudo apt install "$package" -y || echo "Failed to install $package"
    done
}

link_john_scripts() {
    # Setup John The Ripper
    cd /tmp
    git clone https://gitlab.com/kalilinux/packages/john.git
    cd john/src
    ./configure && make
    sudo mkdir -p /usr/share/john/
    sudo cp -r ../run/* /usr/share/john/
    sudo chmod +x /usr/share/john/*

    # Define the source directory
    local source_dir="/usr/share/john"

    # List of scripts to link
    local scripts=(
        1password2john.py
        7z2john.pl
        adxcsouf2john.py
        aem2john.py
        aix2john.py
        andotp2john.py
        androidbackup2john.py
        androidfde2john.py
        ansible2john.py
        apex2john.py
        applenotes2john.py
        aruba2john.py
        atmail2john.pl
        axcrypt2john.py
        bestcrypt2john.py
        bitcoin2john.py
        bitshares2john.py
        bitwarden2john.py
        bks2john.py
        blockchain2john.py
        ccache2john.py
        cisco2john.pl
        cracf2john.py
        dashlane2john.py
        deepsound2john.py
        diskcryptor2john.py
        dmg2john.py
        DPAPImk2john.py
        ecryptfs2john.py
        ejabberd2john.py
        electrum2john.py
        encfs2john.py
        enpass2john.py
        enpass5tojohn.py
        ethereum2john.py
        filezilla2john.py
        geli2john.py
        hccapx2john.py
        htdigest2john.py
        ibmiscanner2john.py
        ikescan2john.py
        ios7tojohn.pl
        itunes_backup2john.pl
        iwork2john.py
        kdcdump2john.py
        keychain2john.py
        keyring2john.py
        keystore2john.py
        kirbi2john.py
        known_hosts2john.py
        krb2john.py
        kwallet2john.py
        lastpass2john.py
        ldif2john.pl
        libreoffice2john.py
        lion2john.pl
        lotus2john.py
        luks2john.py
        mac2john.py
        mcafee_epo2john.py
        monero2john.py
        money2john.py
        mosquitto2john.py
        mozilla2john.py
        multibit2john.py
        neo2john.py
        office2john.py
        openbsd_softraid2john.py
        openssl2john.py
        padlock2john.py
        pcap2john.py
        pdf2john.pl
        pem2john.py
        pfx2john.py
        pgpdisk2john.py
        pgpsda2john.py
        pgpwde2john.py
        prosody2john.py
        pse2john.py
        ps_token2john.py
        pwsafe2john.py
        radius2john.py
        restic2john.py
        sap2john.pl
        sense2john.py
        signal2john.py
        sipdump2john.py
        ssh2john.py
        sspr2john.py
        staroffice2john.py
        strip2john.py
        telegram2john.py
        tezos2john.py
        truecrypt2john.py
        vdi2john.pl
        vmx2john.py
        zed2john.py
    )

    # Loop through each script and create a symbolic link
    for script in "${scripts[@]}"; do
        sudo ln -s "${source_dir}/${script}" "/usr/bin/${script}"
    done
}

# Install brave browser
install_brave_browser() {
    echo "Starting the installation of Brave Browser..."
    sudo curl -fsSLo /usr/share/keyrings/brave-browser-archive-keyring.gpg https://brave-browser-apt-release.s3.brave.com/brave-browser-archive-keyring.gpg
    echo "deb [signed-by=/usr/share/keyrings/brave-browser-archive-keyring.gpg] https://brave-browser-apt-release.s3.brave.com/ stable main" | sudo tee /etc/apt/sources.list.d/brave-browser-release.list
    sudo apt update
    sudo apt install brave-browser -y
    sudo apt remove firefox-esr -y
    echo "Brave Browser has been installed and Firefox ESR has been removed."
}

# Install Rust
install_rust_scan() {
    wget https://github.com/RustScan/RustScan/releases/download/2.2.2/rustscan_2.2.2_amd64.deb -O /tmp/rustscan_2.2.2_amd64.deb
    sudo dpkg -i /tmp/rustscan_2.2.2_amd64.deb
}

# Setting a new wallpaper
install_wallpaper_settings() {
    gsettings set org.gnome.desktop.interface gtk-theme 'Adwaita-dark'
    wget -O ~/Pictures/background.jpg "https://pbs.twimg.com/media/EYUgEFkWsAE-Tkg?format=jpg&name=4096x4096"
    gsettings set org.gnome.desktop.background picture-uri-dark "file:///home/$USER/Pictures/background.jpg"
    gsettings set org.gnome.desktop.background picture-uri "file:///home/$USER/Pictures/background.jpg"
}

# Setup our hostfolder command
install_hosting_folder() {
    if [ ! -f /bin/hostfolder ]; then
        echo "hostfolder does not exist. Proceeding with installation..."
        sudo wget -O /tmp/hosting_folder https://raw.githubusercontent.com/pentestfunctions/escalation-folder/main/hosting_folder
        sudo chmod +x /tmp/hosting_folder
        sudo mv /tmp/hosting_folder /bin/hostfolder
        echo "hostfolder has been installed successfully."
    else
        echo "hostfolder already exists. No action taken."
    fi
}

# Define the function to install Joplin if it's not already installed
install_joplin() {
    if ! command -v ~/.joplin/Joplin.AppImage &> /dev/null; then
        echo "Joplin is not installed. Installing Joplin..."
        wget -O - https://raw.githubusercontent.com/laurent22/joplin/dev/Joplin_install_and_update.sh | bash
        echo "Joplin installation complete."
    else
        echo "Joplin is already installed."
    fi
}

# Install metasploit
install_metasploit() {
    if ! command -v msfconsole &> /dev/null; then
        echo "msfconsole is not installed. Installing Metasploit Framework..."
        sudo curl https://raw.githubusercontent.com/rapid7/metasploit-omnibus/master/config/templates/metasploit-framework-wrappers/msfupdate.erb > /tmp/msfinstall
        chmod 755 /tmp/msfinstall
        sudo /tmp/msfinstall
        sudo rm /tmp/msfinstall
        echo "Metasploit Framework installation complete."
    else
        echo "Metasploit Framework is already installed."
    fi
}

# Install seclists
install_seclists() {
    if [ ! -d "/usr/share/seclists" ]; then
        echo "SecLists is not installed. Installing..."
        wget -c https://github.com/danielmiessler/SecLists/archive/master.zip -O SecList.zip \
        && unzip SecList.zip \
        && rm -f SecList.zip \
        && sudo mv SecLists-master/ /usr/share/seclists
        echo "SecLists installation complete."
    else
        echo "SecLists is already installed."
    fi
}

# Fix venv python shit
fix_python_environment() {
    # Find and remove any EXTERNALLY-MANAGED files in any /usr/lib/python* directories
    echo "Searching for EXTERNALLY-MANAGED files to remove..."
    for file in /usr/lib/python*/EXTERNALLY-MANAGED; do
        if [ -f "$file" ]; then
            echo "Removing $file..."
            sudo rm "$file"
        fi
    done

    # Check if the symbolic link /bin/python exists and points to /bin/python3
    if [ ! -L /bin/python ] || [ "$(readlink /bin/python)" != "/bin/python3" ]; then
        echo "Creating or updating the symbolic link for Python..."
        sudo ln -sf /bin/python3 /bin/python
        echo "Symbolic link for Python fixed."
    else
        echo "Python symbolic link is already correctly set."
    fi
}

function enable_extensions() {
    # Enable user extensions in GNOME
    cd "$initial_dir"
    gsettings set org.gnome.shell disable-user-extensions false
    gnome-extensions enable "dash-to-panel@jderose9.github.com"
    gnome-extensions enable "arcmenu@arcmenu.com"
    dconf load /org/gnome/shell/extensions/dash-to-panel/ < dash_settings
    dconf load /org/gnome/shell/extensions/arcmenu/ < ArcMenu_Settings
}

sudo apt purge --autoremove gnome-games -y
sudo apt-get purge gnome-contacts -y
sudo apt remove libreoffice-* -y
sudo apt autoremove -y
sudo apt autoclean -y

install_tools
install_rust_scan
install_brave_browser
install_wallpaper_settings
link_john_scripts
install_joplin
install_seclists
install_metasploit
install_hosting_folder
sudo gem install wpscan
enable_extensions

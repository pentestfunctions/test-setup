Run this if you struggle to see your screen while running the setup.

```bash
xrandr | awk '/ connected/ { print $1 }' | xargs -I{} xrandr --output {} --mode 1920x1080
```

New VM (not quick create)
Select Generation 2

Settings > Disable Secure Boot > Enable guest services in the Integration Services.

Install Debian 12 how you please. Make sure you remember the root/sudo and user accounts you setup. Then during the final step of the installation ensure you configure XFCE and disable Gnome and Debian Desktop, you can leave Standard System Utilities enabled.

Step 1 after first booting:
```
Login with your user account (not root)
su root (switch to root on that profile)
apt install git -y (install git)
```

Step 2.
```bash
git clone https://github.com/pentestfunctions/test-setup.git
cd test-setup
chmod +x setup.sh
./setup.sh
```

Now you can reboot. 

After running the setup.sh file it will reboot (you can turn it off at this point) and in a administrator powershell on the windows host, run the following:

```bash
Set-VM -VMName DebianTest -EnhancedSessionTransportType HvSocket
```

Now when you boot it, on the login screen you will be prompted after a few seconds for enhanced session mode (RDP) you can adjust the resolution now if you would like.

Once logged to the Xorg session you can run
```bash
wget https://github.com/pentestfunctions/test-setup/blob/main/configure.sh
chmod +x configure.sh
./configure.sh
```

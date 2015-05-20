printf "\x1b[31;1mUpgrading To Root Account.\x1b[0m\n"
read -p "Enter Sudo Password: " password

printf "\x1b[31;1mPurging Ubuntu Bloatware.\x1b[0m\n"
echo -e "$password\n" | sudo -S apt-get purge -y gnome-terminal* activity-log-manager* deja-dup* xterm gnome-contacts gnome-disk-utility aisleriot gnome-mahjongg gnome-sudoku gnomine gnome-mines unity-lens-files unity-lens-friends unity-lens-music unity-lens-photos unity-lens-video shotwell* simple-scan transmission-* thunderbird* remmina* empathy* webbrowser-app vino unity-scope-audacious unity-scope-calculator unity-scope-chromiumbookmarks unity-scope-clementine unity-scope-colourlovers unity-scope-devhelp unity-scope-firefoxbookmarks unity-scope-gdrive unity-scope-gmusicbrowser unity-scope-gourmet unity-scope-guayadeque unity-scope-manpages unity-scope-musicstores unity-scope-musique unity-scope-openclipart unity-scope-texdoc unity-scope-tomboy unity-scope-video-remote unity-scope-virtualbox unity-scope-yelp unity-scope-zotero rhythmbox* totem* cheese unity-tweak-tool ibus-gtk ibus-gtk3 ibus-pinyin ibus-table landscape-client-ui-install usb-creator-* unity-control-center-signon gnome-user-share onboard* gnome-orca evolution-data-server evolution-data-server-online-accounts unity-webapps-qml printer-driver-foo2zjs-common signon*

printf "\x1b[31;1mAuto Removing & Auto Cleaning.\x1b[0m\n"
echo -e "$password\n" | sudo -S apt-get autoremove
echo -e "$password\n" | sudo -S apt-get autoclean

printf "\x1b[31;1mAdding Alternative Nvidia Repository.\x1b[0m\n"
echo -e "$password\n" | sudo -S add-apt-repository -y ppa:xorg-edgers/ppa

printf "\x1b[31;1mUpdating Manifest.\x1b[0m\n"
echo -e "$password\n" | sudo -S apt-get update

printf "\x1b[31;1mUpdating Ubuntu.\x1b[0m\n"
echo -e "$password\n" | sudo -S apt-get dist-upgrade -f -y

printf "\x1b[31;1mInstalling Alternative Realtek Wifi/Bluetooth Driver.\x1b[0m\n"
wget -O driver.zip https://github.com/lwfinger/rtlwifi_new/archive/master.zip
unzip driver.zip
cd rtlwifi_new-master
echo -e "$password\n" | sudo -S make install
cd ..
echo -e "$password\n" | sudo -S rm -r rtlwifi_new-master driver.zip

printf "\x1b[31;1mDisabling Bluetooth Auto-Enable On Startup.\x1b[0m\n"
sed '/exit 0/i rfkill block bluetooth' /etc/rc.local | sudo tee /etc/rc.local

printf "\x1b[31;1mInstalling Bleachbit, Guake Terminal & Nvidia Alternative Driver (346).\x1b[0m\n"
echo -e "$password\n" | sudo -S apt-get install -y bleachbit guake nvidia-346

printf "\x1b[31;1mTweaking Firefox.\x1b[0m\n"
echo -e "$password\n" | sudo -S bash -c "echo export MOZ_USE_OMTC=1 >> /etc/X11/Xsession.d/90environment"

printf "\x1b[31;1mRestarting Computer In 5 Seconds.\x1b[0m\n"
sleep 5
echo -e "$password\n" | sudo -S reboot

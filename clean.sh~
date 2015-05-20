echo "Upgrading To Root Account."
sudo su
echo "Disabling Bluetooth Auto-Enable On Startup."
sed '/exit 0/i rfkill block bluetooth' /etc/rc.local | tee rc.local
echo "Installing Alternative Realtek Wifi/Bluetooth Driver"
wget -O driver.zip https://github.com/lwfinger/rtlwifi_new/archive/master.zip
unzip driver.zip
cd rtlwifi_new-master
make install
cd ..
rm -r rtlwifi_new-master driver.zip
echo "Adding Alternative Nvidia Repository."
add-apt-repository -y ppa:xorg-edgers/ppa
echo "Updating Manifest."
apt-get update
echo "Installing Guake Terminal & Nvidia Alternative Driver (346)."
apt-get install -y guake nvidia-346
echo "Purging Ubuntu Bloatware."
apt-get purge -y gnome-terminal* activity-log-manager* deja-dup* xterm gnome-contacts gnome-disk-utility aisleriot gnome-mahjongg gnome-sudoku gnomine gnome-mines unity-lens-files unity-lens-friends unity-lens-music unity-lens-photos unity-lens-video shotwell* simple-scan transmission-* thunderbird* remmina* empathy* webbrowser-app vino unity-scope-audacious unity-scope-calculator unity-scope-chromiumbookmarks unity-scope-clementine unity-scope-colourlovers unity-scope-devhelp unity-scope-firefoxbookmarks unity-scope-gdrive unity-scope-gmusicbrowser unity-scope-gourmet unity-scope-guayadeque unity-scope-manpages unity-scope-musicstores unity-scope-musique unity-scope-openclipart unity-scope-texdoc unity-scope-tomboy unity-scope-video-remote unity-scope-virtualbox unity-scope-yelp unity-scope-zotero rhythmbox* totem* cheese unity-tweak-tool ibus-gtk ibus-gtk3 ibus-pinyin ibus-table landscape-client-ui-install usb-creator-* unity-control-center-signon gnome-user-share onboard* gnome-orca evolution-data-server evolution-data-server-online-accounts unity-webapps-qml printer-driver-foo2zjs-common signon*
echo "Auto Removing & Auto Cleaning."
apt-get autoremove
apt-get autoclean
echo "Updating Ubuntu."
apt-get dist-upgrade -f -y
echo "Tweaking Firefox."
bash -c "echo export MOZ_USE_OMTC=1 >> /etc/X11/Xsession.d/90environment"
echo "Restarting Computer."
reboot

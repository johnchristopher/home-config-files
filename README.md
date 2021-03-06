# Système de base

    ~ $ sudo apt-get install wicd-curses vim acpid xorg xinit awesome xterm evince vlc alsa-tools feh pm-utils moc mc xfonts-terminus console-terminus alsa-utils screen awesome-extra gnuplot r-base aria2c unrar comix sshfs rtmpdump git source-highlight software-properties-common ranger dia zip irssi pcmanfm irssi nmap

# Audio

    ~ $ sudo adduser jeankri audio
    ~ $ sudo alsa reload

! Canal est muted par défaut.
! Idem pour capture.

# ACPI

    ~ $ sudo cp ~/home-config-files/acpid /etc -r
    ~ $ sudo service acpid restart

# Network

Virer `iface` dans `/etc/network/interfaces`

Changer dans `wicd-curses` dns globaux: 208.67.222.222 et 208.67.220.220

Dans `/etc/dhcp/dhclient.conf` ajouter: 

    supersede domain-name-servers 208.67.222.222,208.67.220.220;

avant la ligne:

    #require subnet-mask, domain-name-servers;

## Pas forcément nécessaire:

    ~ $ echo "nameserver 208.67.222.222" >> /etc/resolv.conf
    ~ $ echo "nameserver 208.67.222.220" >> /etc/resolv.conf

Ensuite:
    
    ~ $ sudo /etc/init.d/resolvconf restart 

ou

    ~ $ sudo resolvconf restart

# Permissions par défaut des nouveaux utilisateurs

  Changer `umask=?` en `umask=077` dans `/etc/logins.def` et dans `~/.profile`

# Disable Useless services

  `Hidden=true` dans `/etc/xdg/autostart/at-spi-dbus.desktop`

# Qucs

    ~ $ sudo add-apt-repository ppa:fransschreuder1/qucs && apt-get update && apt-get install qucs

# Faenza

    ~ $ sudo add-apt-repository http://ppa.launchpad.net/tiheum/equinox/ubuntu && apt-get update && apt-get install faenza-icon-theme

# Geary

    ~ $ sudo add-apt-repository ppa:yorba/ppa && sudo apt-get update && sudo apt-get install geary

# Skype

    ~ $ sudo apt-get install libxss libqtwebkit4
    ~ $ sudo dpkg -i skype.deb
    ~ $ sudo skype # to init /dev/video0 (??)


Peut-être installer puis désinstaller camorama et guvcview.

# irc

    ~ $ sudo apt-get install python-irclib

# Bluetooth

## Installation

    ~ $ apt-get install bluetooth obexfs
    ~ # usermod -aG fuse <user>

##  Configuration

    ~ $ service bluetooth status
    ~ $ bluetooth-agent <PIN>

Connecter via le menu bluetooth du téléphone avec le <PIN>.

Si le téléphone ne voit pas l'ordinateur:

    ~ # hcitool scan
    ~ # rfcomm connect hci0 <MAC-ADDRESS>

Ou:

    ~ # dbus-send --system --dest=org.bluez /org/bluez/hci0 org.bluez.Adapter.SetMode string:discoverable

## Utilisation

    ~ # mount -t fuse "obexfs#-b<MAC-ADDRESS>" /media/phone/

##  Gérer le hardware

    ~ # hciconfig hci0
    ~ # hciconfig hci0 down
    ~ # modprobe btusb
    ~ # hciconfig hci0 up
    ~ # rmmod btusb

http://dev.zuckschwerdt.org/openobex/wiki/ObexFs
http://wiki.debian.org/fr/BluetoothUser
https://answers.launchpad.net/ubuntu/+source/bluez/+question/51440

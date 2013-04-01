# Système de base

    ~ $ sudo apt-get install wicd-curses vim acpid xorg xinit awesome xterm evince vlc alsa-tools feh pm-utils moc mc xfonts-terminus console-terminus alsa-utils screen awesome-extra gnuplot r-base aria2c unrar comix sshfs rtmpdump git source-highlight software-properties-common ranger

# Audio

    ~ $ sudo adduser jeankri audio
    ~ $ sudo alsa reload

! Canal est muted par défaut.

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

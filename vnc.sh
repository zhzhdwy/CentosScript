### Install software
yum -y install tigervnc-server vnc firefox jre icedtea-web
yum -y groupinstall "X Window System" "GNOME Desktop Environment" "Graphical Administration Tools" Desktop
if [ $? -eq 0 ];then

    if [ ! -f /root/.vnc/xstartup ];then
                mkdir -p /root/.vnc
                touch /root/.vnc/xstartup
                chmod 755 /root/.vnc/xstartup
                echo '#!/bin/sh' > /root/.vnc/xstartup
                echo '' >> /root/.vnc/xstartup
                echo '[ -r /etc/sysconfig/i18n ] && . /etc/sysconfig/i18n' >> /root/.vnc/xstartup
                echo 'export LANG' >> /root/.vnc/xstartup
                echo 'export SYSFONT' >> /root/.vnc/xstartup
                echo 'vncconfig -iconic &' >> /root/.vnc/xstartup
                echo 'unset SESSION_MANAGER' >> /root/.vnc/xstartup
                echo 'unset DBUS_SESSION_BUS_ADDRESS' >> /root/.vnc/xstartup
                echo 'OS=`uname -s`' >> /root/.vnc/xstartup
                echo 'if [ $OS = 'Linux' ]; then' >> /root/.vnc/xstartup
                echo '  case "$WINDOWMANAGER" in' >> /root/.vnc/xstartup
                echo '    *gnome*)' >> /root/.vnc/xstartup
                echo '      if [ -e /etc/SuSE-release ]; then' >> /root/.vnc/xstartup
                echo '        PATH=$PATH:/opt/gnome/bin' >> /root/.vnc/xstartup
                echo '        export PATH' >> /root/.vnc/xstartup
                echo '      fi' >> /root/.vnc/xstartup
                echo '      ;;' >> /root/.vnc/xstartup
                echo '  esac' >> /root/.vnc/xstartup
                echo 'fi' >> /root/.vnc/xstartup
                echo 'if [ -x /etc/X11/xinit/xinitrc ]; then' >> /root/.vnc/xstartup
                echo '  exec /etc/X11/xinit/xinitrc' >> /root/.vnc/xstartup
                echo 'fi' >> /root/.vnc/xstartup
                echo 'if [ -f /etc/X11/xinit/xinitrc ]; then' >> /root/.vnc/xstartup
                echo '  exec sh /etc/X11/xinit/xinitrc' >> /root/.vnc/xstartup
                echo 'fi' >> /root/.vnc/xstartup
                echo '[ -r $HOME/.Xresources ] && xrdb $HOME/.Xresources' >> /root/.vnc/xstartup
                echo 'xsetroot -solid grey' >> /root/.vnc/xstartup
                echo 'xterm -geometry 80x24+10+10 -ls -title "$VNCDESKTOP Desktop" &' >> /root/.vnc/xstartup
                echo 'gnome-session &' >> /root/.vnc/xstartup
       else
                echo '#!/bin/sh' > /root/.vnc/xstartup
                echo '' >> /root/.vnc/xstartup
                echo '[ -r /etc/sysconfig/i18n ] && . /etc/sysconfig/i18n' >> /root/.vnc/xstartup
                echo 'export LANG' >> /root/.vnc/xstartup
                echo 'export SYSFONT' >> /root/.vnc/xstartup
                echo 'vncconfig -iconic &' >> /root/.vnc/xstartup
                echo 'unset SESSION_MANAGER' >> /root/.vnc/xstartup
                echo 'unset DBUS_SESSION_BUS_ADDRESS' >> /root/.vnc/xstartup
                echo 'OS=`uname -s`' >> /root/.vnc/xstartup
                echo 'if [ $OS = 'Linux' ]; then' >> /root/.vnc/xstartup
                echo '  case "$WINDOWMANAGER" in' >> /root/.vnc/xstartup
                echo '    *gnome*)' >> /root/.vnc/xstartup
                echo '      if [ -e /etc/SuSE-release ]; then' >> /root/.vnc/xstartup
                echo '        PATH=$PATH:/opt/gnome/bin' >> /root/.vnc/xstartup
                echo '        export PATH' >> /root/.vnc/xstartup
                echo '      fi' >> /root/.vnc/xstartup
                echo '      ;;' >> /root/.vnc/xstartup
                echo '  esac' >> /root/.vnc/xstartup
                echo 'fi' >> /root/.vnc/xstartup
                echo 'if [ -x /etc/X11/xinit/xinitrc ]; then' >> /root/.vnc/xstartup
                echo '  exec /etc/X11/xinit/xinitrc' >> /root/.vnc/xstartup
                echo 'fi' >> /root/.vnc/xstartup
                echo 'if [ -f /etc/X11/xinit/xinitrc ]; then' >> /root/.vnc/xstartup
                echo '  exec sh /etc/X11/xinit/xinitrc' >> /root/.vnc/xstartup
                echo 'fi' >> /root/.vnc/xstartup
                echo '[ -r $HOME/.Xresources ] && xrdb $HOME/.Xresources' >> /root/.vnc/xstartup
                echo 'xsetroot -solid grey' >> /root/.vnc/xstartup
                echo 'xterm -geometry 80x24+10+10 -ls -title "$VNCDESKTOP Desktop" &' >> /root/.vnc/xstartup
                echo 'gnome-session &' >> /root/.vnc/xstartup
      fi

     #### vncserver
     sed -i '/^VNCSERVER/d' /etc/sysconfig/vncservers
     echo 'VNCSERVERS="1:root"' >> /etc/sysconfig/vncservers
     echo 'VNCSERVERARGS[1]="-geometry 1280x800 -depth 16"' >> /etc/sysconfig/vncservers

     ###
     echo "Please set vncserver password,Use vncpasswd command"
     echo "service vncserver restart "

else
  echo "GNOME Desktop is not Install!!"
  exit 1
fi
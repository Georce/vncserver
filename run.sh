#!/bin/bash

cat >>/etc/sysconfig/vncservers<<EOF
VNCSERVERS="10000:root"
VNCSERVERARGS[10000]="-geometry 1440x900 -SecurityTypes None"
EOF

rm -rf /root/.vnc/xstartup
mkdir /root/.vnc/
touch /root/.vnc/xstartup
chmod 755 /root/.vnc/xstartup

cat >> /root/.vnc/xstartup << EOF
#!/bin/sh
/usr/bin/startxfce4 &
EOF
service vncserver restart
chkconfig vncserver on

ping 127.0.0.1 >> /dev/null

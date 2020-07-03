#!/bin/bash

cat > /etc/sysconfig/network-scripts/ifcfg-ens33 <<EOF
TYPE=Ethernet
BOOTPROTO=static
NAME=ens33
DEVICE=ens33
IPADDR=192.168.10.$1
NETMASK=255.255.255.0
GATEWAY=192.168.10.2
ONBOOT=yes
EOF

ifdown ens33
ifup ens33

hostnamectl --static set-hostname $2

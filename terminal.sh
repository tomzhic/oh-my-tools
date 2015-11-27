#!/usr/bin/bash
source ~/.winshrc

UBUNTU_IP=192.168.1.14
ROUTER_IP=192.168.1.1

echo "connect to $1"
case "$1" in  
	ubuntu)
		startx.bat &
		ssh.exe $UBUNTU_IP -l root -p 22 -o ForwardX11Trusted=yes -o ForwardX11=yes -C -o Compression=yes;;
	router) ssh.exe $ROUTER_IP -l root -p 22;;
	*) echo "no target for $1" >&2;;
esac

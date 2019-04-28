#!/bin/bash

if [ -f /.user_conf_set ]; then
	echo  "Root password already set!"
	exit 0
fi

adduser --disabled-password --gecos "" --quiet $USER
adduser $user sudo
DPASS=$(pwgen -s 12 1)

echo "=> Setting a password to the $USER user"
echo "$USER:$DPASS" | chpasswd

echo "Add user $USER to docker group"
usermod -aG docker $USER

echo "=> Done!"
touch /.user_conf_set

echo "========================================================================"
echo " $USER password : $DPASS "
echo "use this to connect to the x2go server from your x2go client!"
echo "Please remember to change the above password as soon as possible!"
echo "========================================================================"

#!/bin/bash

if [ -f /.user_pw_set ]; then
	echo  "REMOTE_USER password already set!"
	exit 0
fi

adduser --disabled-password --gecos "" --quiet $REMOTE_USER
adduser $REMOTE_USER sudo

echo "=> Setting a password to the $REMOTE_USER user"
echo "$REMOTE_USER:$REMOTE_PASSWORD" | chpasswd

#echo "Add user $USER to docker group"
#usermod -aG docker $REMOTE_USER

echo "=> Done!"
touch /.user_pw_set

echo "========================================================================"
echo " $REMOTE_USER password : $REMOTE_PASSWORD "
echo "use this to connect to the x2go server from your x2go client!"
echo "Please remember to change the above password as soon as possible!"
echo "========================================================================"

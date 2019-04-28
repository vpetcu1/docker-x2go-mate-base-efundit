echo "Change owner to folder work to $REMOTE_USER"
chown $REMOTE_USER:$REMOTE_USER -R /home/$REMOTE_USER/work

echo "Add user $USER to docker group"
usermod -aG docker $REMOTE_USER


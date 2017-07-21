SUDO_PASSWORD=`cat .vars/sudoPassword`

echo 'Install pip'
wget https://bootstrap.pypa.io/get-pip.py
echo $SUDO_PASSWORD | sudo -S -H python3 get-pip.py
rm get-pip.py

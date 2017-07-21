SUDO_PASSWORD=`cat .vars/sudoPassword`

echo $SUDO_PASSWORD | sudo -S apt-add-repository ppa:git-core/ppa -y
echo $SUDO_PASSWORD | sudo -S apt-get update
echo $SUDO_PASSWORD | sudo -S apt-get install git -y
git config --global core.editor vim
git config --global merge.tool vimdiff

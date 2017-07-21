SUDO_PASSWORD=`cat .vars/sudoPassword`

mkdir mnt
echo $SUDO_PASSWORD | sudo -S mount --source VBoxGuestAdditions.iso --target mnt
echo $SUDO_PASSWORD | sudo -S mnt/VBoxLinuxAdditions.run || true
echo $SUDO_PASSWORD | sudo -S umount mnt
rmdir mnt

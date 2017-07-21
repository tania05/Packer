#%file cache/pycharm-community-2017.1.4.tar.gz -> pycharm-community-2017.1.4.tar.gz
#%file haskell/colors.scheme.xml -> colors.scheme.xml
#%file haskell/laf.xml -> laf.xml

SUDO_PASSWORD=`cat .vars/sudoPassword`

echo 'Setting up PyCharm'
echo $SUDO_PASSWORD | sudo -S tar xf pycharm-community-2017.1.4.tar.gz -C /opt/
IDEA_LOC=/opt/`ls /opt | grep 'pycharm'`
echo \"[Desktop Entry]\\nEncoding=UTF-8\\nName=PyCharm\\nComment=PyCharm\\nExec=${IDEA_LOC}/bin/pycharm.sh\\nIcon=${IDEA_LOC}/bin/pycharm.png\\nTerminal=false\\nStartupNotify=true\\nType=Application\" > pycharm.desktop
echo $SUDO_PASSWORD | sudo -S mv pycharm.desktop /usr/share/applications/pycharm.desktop
mkdir -p .PyCharmCE2017.1/config/options
mv colors.scheme.xml .PyCharmCE2017.1/config/options
mv laf.xml .PyCharmCE2017.1/config/options


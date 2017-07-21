none:
	echo 'Must specify build type'
	
####################
# Downloaded files #
####################
cache/ubuntu-16.04.2-desktop-amd64.iso:
	powershell -NoProfile -Command "Invoke-WebRequest http://releases.ubuntu.com/16.04/ubuntu-16.04.2-desktop-amd64.iso -OutFile cache/ubuntu-16.04.2-desktop-amd64.iso"

cache/ideaIC-2017.1.4.tar.gz:
	powershell -NoProfile -Command "Invoke-WebRequest https://download.jetbrains.com/idea/ideaIC-2017.1.4.tar.gz -OutFile cache/ideaIC-2017.1.4.tar.gz"

cache/intellij-haskell.zip:
	powershell -NoProfile -Command "Invoke-WebRequest https://plugins.jetbrains.com/plugin/download?updateId=34477 -OutFile cache/intellij-haskell.zip"

cache/IdeaVim.zip:
	powershell -NoProfile -Command "Invoke-WebRequest https://plugins.jetbrains.com/plugin/download?updateId=31805 -OutFile cache/IdeaVim.zip"

cache/pycharm-community-2017.1.4.tar.gz:
	powershell -NoProfile -Command "Invoke-WebRequest https://download.jetbrains.com/python/pycharm-community-2017.1.4.tar.gz -OutFile cache/pycharm-community-2017.1.4.tar.gz"


##########################
# VM artefacts / configs #
##########################
bin/ubuntu_64/ubuntu_64.ovf: ubuntu_64.json
	packer build --force ubuntu_64.json
	
bin/ubuntu_64_desktop_iso/ubuntu_64_desktop_iso.iso: ubuntu_64_desktop_iso/ks.preseed ubuntu_64_desktop_iso/txt.cfg bin/ubuntu_64/ubuntu_64.ovf ubuntu_64_desktop_iso.json cache/ubuntu-16.04.2-desktop-amd64.iso
	packer build --force ubuntu_64_desktop_iso.json


bin/ubuntu_64_desktop/ubuntu_64_desktop.ovf: bin/ubuntu_64_desktop_iso/ubuntu_64_desktop_iso.iso ubuntu_64_desktop.json
	packer build --force ubuntu_64_desktop.json

	
ubuntu_64_desktop: bin/ubuntu_64_desktop/ubuntu_64_desktop.ovf
ubuntu_64_server: bin/ubuntu_64/ubuntu_64.ovf



####################
# Final vm configs #
####################

haskell: ubuntu_64_desktop cache/ideaIC-2017.1.4.tar.gz cache/intellij-haskell.zip cache/IdeaVim.zip haskell/colors.scheme.xml haskell/laf.xml
	packer build --force haskell.json

seng426: ubuntu_64_desktop cache/ideaIC-2017.1.4.tar.gz cache/IdeaVim.zip haskell/colors.scheme.xml haskell/laf.xml
	packer build --force seng426.json

seng426_server: ubuntu_64_server
	packer build --force seng426_server.json

ceng420: ubuntu_64_desktop cache/pycharm-community-2017.1.4.tar.gz haskell/colors.scheme.xml haskell/laf.xml
	packer build --force ceng420.json

ceng420_server: ubuntu_64_server	
	packer build --force ceng420_server.json

cookbook: ubuntu_64_desktop cache/pycharm-community-2017.1.4.tar.gz haskell/colors.scheme.xml haskell/laf.xml
	packer build --force cookbook

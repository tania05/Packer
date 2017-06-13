none:
	echo 'Must specify build type'
	
bin/ubuntu_64/ubuntu_64.ovf: ubuntu_64.json
	packer build --force ubuntu_64.json
	
bin/ubuntu_64_desktop_iso/ubuntu_64_desktop_iso.iso: ubuntu_64_desktop_iso/ks.preseed ubuntu_64_desktop_iso/txt.cfg bin/ubuntu_64/ubuntu_64.ovf ubuntu_64_desktop_iso.json
	packer build --force ubuntu_64_desktop_iso.json

bin/ubuntu_64_desktop/ubuntu_64_desktop.ovf: bin/ubuntu_64_desktop_iso/ubuntu_64_desktop_iso.iso ubuntu_64_desktop.json
	packer build --force ubuntu_64_desktop.json
	
ubuntu_64_desktop: bin/ubuntu_64_desktop/ubuntu_64_desktop.ovf
ubuntu_64_server: bin/ubuntu_64/ubuntu_64.ovf

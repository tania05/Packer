To use these files, first make sure packer, oracle VM VirtualBox and make are installed.


#Prerequisites
On windows (from elevated prompt):


```
	Set-ExecutionPolicy Unrestricted
	iex (Invoke-WebRequest https://chocolatey.org/install.ps1).Content
```
Restart powershell (keep using elevated, and make sure to skip items already installed elsewhere)
```
	choco install make -y
	choco install packer -y
```

Install Virtualbox


#Building / Running
```
make seng460
& "C:\Program Files\Oracle\VirtualBox\VBoxManage.exe" import bin/seng460/seng460.ovf
```

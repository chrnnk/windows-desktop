# windows-desktop
## Collection of tweaks, customizations, scripts, etc.
### Windows 11 Installation Bypass
To Bypass TPM, RAM, or SecureBoot
```
Shift+F10 during installation\
regedit\
Navigate to HKEY_LOCAL_MACHINE\SYSTEM\Setup\
Right-click on Setup and click New > Key. Name that LabConfig\
Create the following DWORD (32-bit Value) keys under LabConfig\
BypassTPMCheck, change the Value data to 1, and press OK.\
BypassRAMCheck, change the Value data to 1, and press OK.\
BypassSecureBootCheck, change the Value data to 1, and press OK.
```
To Bypass No Internet
```
Shift+F10 during installation\
OOBE\BYPASSNRO
```
### Fix 64-bit cmd in terminal on 11-22h2
```
winget install Microsoft.VCRedist.2015+.x64
```
### Upgrade all apps with winget
```
winget upgrade --all
```
### Install NFS-Client on Windows
Powershell Admin
``` powershell
Enable-WindowsOptionalFeature -FeatureName ServicesForNFS-ClientOnly, ClientForNFS-Infrastructure -Online -NoRestart
```
map nfs from cmd
```
mount -o anon \\NASIP\mnt\user\media Z:
mount -o anon \\unraid\mnt\user\media Z:
```
### God mode Control Panel applet
create new folder, name it:
```
Folder.{ED7BA470-8E54-465E-825C-99712043E01C}
```
### Set up Windows for SSH
Generate key pair
```
ssh-keygen -t ed25519
```
Send key pair to remote server
```
type .ssh\id_ed25519.pub | ssh -p PORT root@SERVERIP "cat >> .ssh/authorized_keys"
```
Start the ssh-agent from Windows Services from Admin Command Prompt:  
```
sc config ssh-agent start=auto
net start ssh-agent
```
Add your SSH key to the ssh-agent by issuing the ssh-add command and entering your passphrase:  
```
ssh-add $HOME/.ssh/your_file_name
```

Configure Git to use the Windows 10 implementation of OpenSSH by issuing the following command in Powershell:  
```
git config --global core.sshCommand C:/Windows/System32/OpenSSH/ssh.exe
```  
Configure SSH to automatically add the keys to the agent on startup by editing the config file found at ```$HOME\.ssh\config``` (full path - ```C:\Users\%YOUR_USERNAME%\.ssh\config```), and add the following lines:
```
Host *
	AddKeysToAgent yes
	IdentitiesOnly yes
```
You can also add the following lines if you generated an SSH key with custom name or multiple SSH keys:
```
Host github.com
	HostName github.com
	User your_user_name
	IdentityFile ~/.ssh/your_file_name
```

Done! Now restart your Powershell and even Windows if necessary.

# windows-desktop
Collection of tweaks, customizations, scripts, etc.

### fix 64-bit cmd in terminal on w22h2
```
winget install Microsoft.VCRedist.2015+.x64
```
### winget upgrade all
```
winget upgrade --all
```
### god mode control panel applet
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
Start the ssh-agent from Windows Services:  
Type ```Services``` in the Start Menu or Win+R and then type ```services.msc``` to launch the Services window.  
Find the OpenSSH Authentication Agent in the list and double click on it.  
In the OpenSSH Authentication Agent Properties window that appears, choose Automatic from the Startup type: dropdown and click Start from Service status.  
Make sure it now says Service status: Running.  
Configure Git to use the Windows 10 implementation of OpenSSH by issuing the following command in Powershell:  
```git config --global core.sshCommand C:/Windows/System32/OpenSSH/ssh.exe```
Configure SSH to automatically add the keys to the agent on startup by editing the config file found at $HOME\.ssh\config (full path - C:\Users\%YOUR_USERNAME%\.ssh\config), and add the following lines:
Host *
	AddKeysToAgent yes
	IdentitiesOnly yes
You can also add the following lines if you generated an SSH key with custom name or multiple SSH keys:

Host github.com
	HostName github.com
	User your_user_name
	IdentityFile ~/.ssh/your_file_name
Add your SSH key to the ssh-agent by issuing the ssh-add command and entering your passphrase:
ssh-add $HOME/.ssh/your_file_name
Done! Now restart your Powershell and even Windows if necessary.
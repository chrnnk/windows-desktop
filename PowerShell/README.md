# Two line install
```ps
Set-ExecutionPolicy -ExecutionPolicy RemoteSigned -Scope LocalMachine
irm "https://raw.githubusercontent.com/chrnnk/windows-desktop/main/Customization/PowerShell/ps-setup.ps1" | iex
```
# Make windows openssh remember ssh key passwords
1. Start the ssh-agent from Windows Services: 
  - Open Services in the Start Menu or `Win+R` and then type `services.msc`
  - Find the OpenSSH Authentication Agent and open its properties
  - Choose Automatic from the Startup type dropdown and click Start from Service status:
```
sc config ssh-agent start=auto
net start ssh-agent
```
2. Add your SSH key to the ssh-agent by issuing the `ssh-add` command and entering your passphrase:
```
ssh-add $HOME/.ssh/your_file_name
```

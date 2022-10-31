# Adds the powershell gallery as a trusted source
```ps
Set-PSRepository -Name 'PSGallery' -InstallationPolicy Trusted
```
# One line install
```ps
irm "https://raw.githubusercontent.com/chrxnn/windows-desktop/main/Powershell/ps-setup.ps1" | iex
```
# Make windows openssh remember ssh key passwords
1. Start the `ssh-agent` from Windows Services: 
  - Type `Services` in the `Start Menu` or `Win+R` and then type `services.msc` to launch the Services window;
  - Find the `OpenSSH Authentication Agent` in the list and double click on it;
  - In the `OpenSSH Authentication Agent Properties` window that appears, choose `Automatic` from the `Startup type:` dropdown and click `Start` from `Service status:`. Make sure it now says `Service status: Running`.
2. Add your SSH key to the `ssh-agent` by issuing the `ssh-add` command and entering your passphrase:
```
ssh-add $HOME/.ssh/your_file_name
```

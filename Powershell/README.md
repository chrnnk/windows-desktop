# Adds the powershell gallery as a trusted source
```ps
Set-PSRepository -Name 'PSGallery' -InstallationPolicy Trusted
```
# One line install
```ps
irm "https://github.com/chrxnn/windows-desktop/raw/main/Powershell/Microsoft.PowerShell_profile.ps1" | iex
```

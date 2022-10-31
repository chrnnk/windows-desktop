# Adds the powershell gallery as a trusted source
```ps
Set-PSRepository -Name 'PSGallery' -InstallationPolicy Trusted
```
# One line install
```ps
irm "https://raw.githubusercontent.com/chrxnn/windows-desktop/main/Powershell/Microsoft.PowerShell_profile.ps1" | iex
```

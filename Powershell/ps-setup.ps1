Set-PSRepository -Name "PSGallery" -InstallationPolicy Trusted
Set-ExecutionPolicy RemoteSigned 

#If the file does not exist, create it.
if (-not(Test-Path -Path $PROFILE -PathType Leaf)) {
     try {
         Invoke-RestMethod https://raw.githubusercontent.com/chrxnn/windows-desktop/main/Powershell/Microsoft.PowerShell_profile.ps1 -o $PROFILE
         Write-Host "The profile @ [$PROFILE] has been created."
     }
     catch {
         throw $_.Exception.Message
     }
 }
# If the file already exists, show the message and do nothing.
 else {
		 # Get-Item -Path $PROFILE | Move-Item -Destination oldprofile.ps1
		 # Invoke-RestMethod https://raw.githubusercontent.com/chrxnn/windows-desktop/main/Powershell/Microsoft.PowerShell_profile.ps1 -o $PROFILE
		 # Write-Host "The profile @ [$PROFILE] has been created and old profile removed."
		 Write-Host "[$PROFILE] already exists, not touched."
 }
& $profile

Write-Host ""
Write-Host "OMP Install"
Write-Host ""
winget install -e --accept-source-agreements --accept-package-agreements JanDeDobbeleer.OhMyPosh

Write-Host ""
Write-Host "Font Download, unzip and install these fonts, then set as Default profile Appearance in Windows Terminal"
Write-Host ""
Invoke-RestMethod https://github.com/ryanoasis/nerd-fonts/releases/download/v2.1.0/CascadiaCode.zip?WT.mc_id=-blog-scottha -o cove.zip

Write-Host ""
Write-Host "Winfetch Install"
Write-Host ""
Install-Script -Name pwshfetch-test-1

Write-Host ""
Write-Host "PSReadLine Install"
Write-Host ""
Install-Module PSReadLine

Write-Host ""
Write-Host "Install Terminal-Icons"
Write-Host ""
Install-Module Terminal-Icons

# irm "https://raw.githubusercontent.com/chrxnn/windows-desktop/main/Powershell/ps-setup.ps1" | iex

Write-Host "`r`nRun this as admin or it will start failing pretty quick`r`n"

Write-Host "`r`nSetting the Microsoft PSGallery as a trusted source`r`n"
Set-PSRepository -Name "PSGallery" -InstallationPolicy Trusted

Write-Host "`r`nAllowing local scripts to run unsigned`r`n"
Set-ExecutionPolicy RemoteSigned 

Write-Host "`r`nInstalling OhMyPosh`r`n"
winget install -e --accept-source-agreements --accept-package-agreements JanDeDobbeleer.OhMyPosh

Write-Host "Browse to $DownloadsFolder\cove. select and install all fonts, then set ""CaskaydiaCove Nerd Font Mono"" as Default profile Appearance in Windows Terminal"
# Finding Downloads folder"
$DownloadsFolder = (New-Object -ComObject Shell.Application).NameSpace('shell:Downloads').Self.Path
Write-Host "Downloading cove.zip to Downloads folder"
Invoke-RestMethod https://github.com/ryanoasis/nerd-fonts/releases/download/v2.1.0/CascadiaCode.zip?WT.mc_id=-blog-scottha -o $DownloadsFolder/cove.zip
Write-Host "Extracting"
Expand-Archive -Path $DownloadsFolder/cove.zip -DestinationPath $DownloadsFolder/cove


Write-Host "Winfetch Install"
Install-Script -Name pwshfetch-test-1

Write-Host "PSReadLine Install"
Install-Module PSReadLine -Force

Write-Host "Install Terminal-Icons"
Install-Module Terminal-Icons

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

Write-Host "Browse to $DownloadsFolder\cove. select and install all fonts, then set ""CaskaydiaCove Nerd Font Mono"" as Default profile Appearance in Windows Terminal"

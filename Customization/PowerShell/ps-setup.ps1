# irm "https://raw.githubusercontent.com/chrxnn/windows-desktop/main/Customization/PowerShell/ps-setup.ps1" | iex

Write-Host "`r`nRun this as admin or it will start failing pretty quick`r`n"

Write-Host "`r`nInstalling Microsoft.VCRedist.2015+.x64`r`n"
winget install -e --id Microsoft.VCRedist.2015+.x64

Write-Host "`r`nInstalling Microsoft.WindowsTerminal`r`n"
winget install -e --id Microsoft.WindowsTerminal

Write-Host "`r`nInstalling Microsoft.PowerShell`r`n"
winget install -e --id Microsoft.PowerShell

Write-Host "`r`nSetting the Microsoft PSGallery as a trusted source`r`n"
Set-PSRepository -Name "PSGallery" -InstallationPolicy Trusted

Write-Host "`r`nAllowing local scripts to run unsigned`r`n"
Set-ExecutionPolicy RemoteSigned

Write-Host "`r`nInstalling OhMyPosh`r`n"
winget install -e --accept-source-agreements --accept-package-agreements JanDeDobbeleer.OhMyPosh

Write-Host "`r`nBrowse to $DownloadsFolder\cove, select and install all fonts. Then set ""CaskaydiaCove Nerd Font Mono"" as Default profile Appearance in Windows Terminal`r`n"
$DownloadsFolder = (New-Object -ComObject Shell.Application).NameSpace('shell:Downloads').Self.Path

Write-Host "`r`nDownloading cove.zip to Downloads folder`r`n"
Invoke-RestMethod https://github.com/ryanoasis/nerd-fonts/releases/download/v2.1.0/CascadiaCode.zip?WT.mc_id=-blog-scottha -o $DownloadsFolder/cove.zip

Write-Host "`r`nExtracting cove.zip to $DownloadsFolder`r`n"
Expand-Archive -Path $DownloadsFolder/cove.zip -DestinationPath $DownloadsFolder/cove -Force

Write-Host "`r`nInstalling Winfetch`r`n"
Install-Script winfetch

Write-Host "`r`nInstalling PSReadLine`r`n"
Install-Module PSReadLine -Force

Write-Host "`r`nInstalling Terminal-Icons`r`n"
Install-Module Terminal-Icons

Write-Host "`r`nSince we're here, winget upgrade everything else`r`n"
winget upgrade --all

#If the file does not exist, create it.
if (-not(Test-Path -Path $PROFILE -PathType Leaf)) {
     try {
         Invoke-RestMethod https://raw.githubusercontent.com/chrxnn/windows-desktop/main/Powershell/Microsoft.PowerShell_profile.ps1 -o $PROFILE
         Write-Host "`r`nThe profile @ [$PROFILE] has been created.`r`n"
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
		 Write-Host "`r`n[$PROFILE] already exists, not touched.`r`n"
 }

Write-Host "`r`nBrowse to Downloads\cove, select and install all fonts. Then set ""CaskaydiaCove Nerd Font Mono"" as Default profile Appearance in Windows Terminal`r`n"

$apps = @(
    @{name = "Discord.Discord" }                            # Gaming
    @{name = "EpicGames.EpicGamesLauncher" }
    @{name = "Libretro.RetroArch" }
    @{name = "Nvidia.PhysX" }
    @{name = "Valve.Steam" }
    @{name = "WowUp.Wowup" }
    @{name = "Overwolf.CurseForge" }
    @{name = "Corsair.iCUE.4" }                             # Hardware
    @{name = "Logitech.GHUB" }
    @{name = "Olivia.VIA" }
    @{name = "Nvidia.Broadcast" }
    @{name = "Nvidia.GeForceExperience" }
    @{name = "Nvidia.PhysX" }
    @{name = "SoftwareFreedomConservancy.QEMUGuestAgent" }  # Virtual Machines
    @{name = "RedHat.VirtViewer" }
    @{name = "7zip.7zip" }                                  # Sytem
    @{name = "dnGrep.dnGrep" }
    @{name = "JohnMacFarlane.Pandoc" }
    @{name = "Microsoft.Edge" }
    @{name = "Microsoft.EdgeWebView2Runtime" }
    @{name = "Microsoft.Office" }
    @{name = "Microsoft.OneDrive" }
    @{name = "Microsoft.Teams" }
    @{name = "Obsidian.Obsidian" }
    @{name = "valinet.ExplorerPatcher" }
    @{name = "voidtools.Everything" }
    @{name = "Brave.Brave" }                                # Internet
    @{name = "Mozilla.Firefox" }
    @{name = "Parsec.Parsec" }
    @{name = "qBittorrent.qBittorrent" }
    @{name = "tailscale.tailscale" }
    @{name = "Plex.Plex" }                                  # Media
    @{name = "Spotify.Spotify" }
    @{name = "VideoLAN.VLC" }
    @{name = "Winamp.Winamp" }
    @{name = "OzMartian.VidCutter" }
    @{name = "Microsoft.HEVCVideoExtension_8wekyb3d8bbwe" } # HEVC-VideoExtension
    @{name = "Microsoft.HEIFImageExtension_8wekyb3d8bbwe" } # HEIF-PictureExtension
    @{name = "9MVZQVXJBQ9V"; source = "msstore" }           # AV1 VideoExtension
    @{name = "9NCTDW2W1BH8"; source = "msstore" }           # Raw-PictureExtension
    @{name = "9N95Q1ZZPMH4"; source = "msstore" }           # MPEG-2-VideoExtension
    @{name = "GitHub.GitHubDesktop" }                       # Coding
    @{name = "Git.Git" }
    @{name = "Microsoft.WindowsTerminal" }
    @{name = "Microsoft.VisualStudioCode" }
    @{name = "Starship.Starship" }
    @{name = "Microsoft.PowerShell" }
    @{name = "Oracle.JavaRuntimeEnvironment" }              # Runtimes
    @{name = "Microsoft.DotNet.DesktopRuntime.3_1" }
    @{name = "Microsoft.DotNet.DesktopRuntime.6" }
    @{name = "Microsoft.VC++2005Redist-x86" }
    @{name = "Microsoft.VC++2005Redist-x64" }
    @{name = "Microsoft.VC++2008Redist-x86" }
    @{name = "Microsoft.VC++2008Redist-x64" }
    @{name = "Microsoft.VCRedist.2010.x64" }
    @{name = "Microsoft.VCRedist.2010.x86" }
    @{name = "Microsoft.VC++2012Redist-x86" }
    @{name = "Microsoft.VC++2012Redist-x64" }
    @{name = "Microsoft.VC++2013Redist-x64" }
    @{name = "Microsoft.VC++2013Redist-x86" }
    @{name = "Microsoft.VCRedist.2015+.x64" }
    @{name = "Microsoft.VCRedist.2015+.x86" }
    @{name = "Microsoft.VC++2015-2022Redist-x64" }
    @{name = "Microsoft.VC++2015-2022Redist-x86" }
);
$hasPackageManager = Get-AppxPackage -Name 'Microsoft.Winget.Source' | Select Name, Version
$hasVCLibs = Get-AppxPackage -Name 'Microsoft.VCLibs.140.00.UWPDesktop' | Select Name, Version
$hasXAML = Get-AppxPackage -Name 'Microsoft.UI.Xaml.2.7*' | Select Name, Version
$hasAppInstaller = Get-AppxPackage -Name 'Microsoft.DesktopAppInstaller' | Select Name, Version
function install_winget {
    Clear-Host
    Write-Host -ForegroundColor Yellow "Checking if WinGet is installed"
    if (!$hasPackageManager) {
            if ($hasVCLibs.Version -lt "14.0.30035.0") {
                Write-Host
                Write-Host -ForegroundColor Yellow "Installing VCLibs dependencies..."
                Add-AppxPackage -Path "https://aka.ms/Microsoft.VCLibs.x64.14.00.Desktop.appx"
                Write-Host
                Write-Host -ForegroundColor Green "VCLibs dependencies successfully installed."
            }
            else {
                Write-Host
                Write-Host -ForegroundColor Green "VCLibs is already installed. Skip..."
            }
            if ($hasXAML.Version -lt "7.2203.17001.0") {
                Write-Host
                Write-Host -ForegroundColor Yellow "Installing XAML dependencies..."
                Add-AppxPackage -Path "https://github.com/Kugane/winget/raw/main/Microsoft.UI.Xaml.2.7_7.2203.17001.0_x64__8wekyb3d8bbwe.Appx"
                Write-Host
                Write-Host -ForegroundColor Green "XAML dependencies successfully installed."
            }
            else {
                Write-Host
                Write-Host -ForegroundColor Green "XAML is already installed. Skip..."
            }
            if ($hasAppInstaller.Version -lt "1.16.12653.0") {
                Write-Host
                Write-Host -ForegroundColor Yellow "Installing WinGet..."
    	        $releases_url = "https://api.github.com/repos/microsoft/winget-cli/releases/latest"
    		    [Net.ServicePointManager]::SecurityProtocol = [Net.SecurityProtocolType]::Tls12
    		    $releases = Invoke-RestMethod -Uri "$($releases_url)"
    		    $latestRelease = $releases.assets | Where-Object { $_.browser_download_url.EndsWith("msixbundle") } | Select-Object -First 1
    		    Add-AppxPackage -Path $latestRelease.browser_download_url
                Write-Host
                Write-Host -ForegroundColor Green "WinGet successfully installed."
            }
            else {
                Write-Host
                Write-Host -ForegroundColor Green "Winget is already installed. Skip..."
            }
    }
}
function install_choose {
    Write-Host
    Write-Host -ForegroundColor Green "Choosing apps to install"
    Write-Host
    Foreach ($app in $apps) {
        $listApp = winget list --exact -q $app.name
        if (![String]::Join("", $listApp).Contains($app.name)) {
            Write-Host -ForegroundColor Yellow "Install:" $app.name " ?"
            $installChoice = Read-Host "Press y for yes, Enter to skip "
            if ($installChoice -eq 'y') {
              winget install --exact --interactive --accept-package-agreements --accept-source-agreements $app.name
              if ($LASTEXITCODE -eq 0) {
                Write-Host -ForegroundColor Green $app.name "successfully installed."
                Write-Host
            }
              else {
                  $app.name + " couldn't be installed."
                  Write-Host -ForegroundColor Red $app.name "couldn't be installed."
                  Write-Host
                }     
          }
          else {
              Write-Host -ForegroundColor Yellow "Skip installation of" $app.name
              Write-Host
          }
        }
    }
}
function install_all {
    Write-Host -ForegroundColor Cyan "Installing all apps automatically"
    Foreach ($app in $apps) {
        $listApp = winget list --exact -q $app.name
        if (![String]::Join("", $listApp).Contains($app.name)) {
            Write-Host -ForegroundColor Yellow  "Install:" $app.name
            if ($app.source -ne $null) {
                winget install --exact --silent --accept-package-agreements --accept-source-agreements $app.name --source $app.source
                if ($LASTEXITCODE -eq 0) {
                    Write-Host -ForegroundColor Green $app.name "successfully installed."
                }
                else {
                    $app.name + " couldn't be installed."
                    Write-Host -ForegroundColor Red $app.name "couldn't be installed."
                    Pause
                }    
            }
            else {
                winget install --exact --silent --scope machine --accept-package-agreements --accept-source-agreements $app.name
                if ($LASTEXITCODE -eq 0) {
                    Write-Host -ForegroundColor Green $app.name "successfully installed."
                }
                else {
                    $app.name + " couldn't be installed."
                    Write-Host -ForegroundColor Red $app.name "couldn't be installed."
                    Pause
                }  
            }
        }
        else {
            Write-Host -ForegroundColor Yellow "Skip installation of" $app.name
        }
    }
    Pause
}
function finish {
    Write-Host -ForegroundColor Green  "Installation finished"
    Write-Host
    Pause
    exit
}
function menu {
    [string]$Title = 'Winget Menu'
    Write-Host
    Write-Host "================ $Title ================"
    Write-Host
    Write-Host -ForegroundColor Green "1: Choose each app to install"
    Write-Host
    Write-Host "2: Install all apps automatically"
    Write-Host
    Write-Host -ForegroundColor Red "0: Quit"
    Write-Host
    
    $actions = "0"
    while ($actions -notin "0..3") {
    $actions = Read-Host -Prompt 'Choose'
        if ($actions -in 0..2) {
            if ($actions -eq 1) {
                install_choose
                finish
            }
            if ($actions -eq 2) {
                install_all
                finish
            }
            }
            if ($actions -eq 0) {
                exit
            }
        }
        else {
            Write-Host -ForegroundColor Yellow "Please try again"
            Write-Host
        }
}

install_winget
menu
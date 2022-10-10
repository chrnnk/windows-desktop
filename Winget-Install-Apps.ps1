# Get list of all apps installed on current machine that areavilable to winget
winget export -o c:\temp\installed.log
# Convert that list to one like I have below

# Gaming
winget install -e --id Discord.Discord
winget install -e --id EpicGames.EpicGamesLauncher
winget install -e --id Libretro.RetroArch
winget install -e --id Nvidia.PhysX
winget install -e --id Valve.Steam
winget install -e --id WowUp.Wowup

# Sytem
winget install -e --id 7zip.7zip
winget install -e --id BraveSoftware.BraveBrowser
winget install -e --id Corsair.iCUE.4
winget install -e --id dnGrep.dnGrep
winget install -e --id JohnMacFarlane.Pandoc
winget install -e --id Logitech.GHUB
winget install -e --id Microsoft.Edge
winget install -e --id Microsoft.EdgeWebView2Runtime
winget install -e --id Microsoft.Office
winget install -e --id Microsoft.OneDrive
winget install -e --id Microsoft.Teams
winget install -e --id Mozilla.Firefox
winget install -e --id Nvidia.Broadcast
winget install -e --id Nvidia.GeForceExperience
winget install -e --id Nvidia.PhysX
winget install -e --id Obsidian.Obsidian
winget install -e --id Olivia.VIA
winget install -e --id Oracle.JavaRuntimeEnvironment
winget install -e --id Parsec.Parsec
winget install -e --id qBittorrent.qBittorrent
winget install -e --id tailscale.tailscale
winget install -e --id valinet.ExplorerPatcher
winget install -e --id voidtools.Everything

# Media
winget install -e --id Plex.Plex
winget install -e --id Spotify.Spotify
winget install -e --id VideoLAN.VLC

# Coding
winget install -e --id GitHub.GitHubDesktop
winget install -e --id Git.Git
winget install -e --id Microsoft.WindowsTerminal
winget install -e --id Microsoft.VisualStudioCode

# Runtimes
winget install -e --id Microsoft.DotNet.DesktopRuntime.3_1
winget install -e --id Microsoft.VC++2005Redist-x86
winget install -e --id Microsoft.VC++2005Redist-x64
winget install -e --id Microsoft.VC++2008Redist-x86
winget install -e --id Microsoft.VC++2008Redist-x64
winget install -e --id Microsoft.VC++2010Redist-x64
winget install -e --id Microsoft.VC++2010Redist-x86
winget install -e --id Microsoft.VC++2012Redist-x86
winget install -e --id Microsoft.VC++2012Redist-x64
winget install -e --id Microsoft.VC++2013Redist-x64
winget install -e --id Microsoft.VC++2013Redist-x86
winget install -e --id Microsoft.VCRedist.2015+.x64
winget install -e --id Microsoft.VCRedist.2015+.x86
winget install -e --id Microsoft.VC++2015-2022Redist-x64
winget install -e --id Microsoft.VC++2015-2022Redist-x86

# Upgrade all
winget upgrade --all

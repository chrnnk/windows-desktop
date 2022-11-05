# Make sure Windows Terminal have been installed.
$TerminalPath = Join-Path $Env:LOCALAPPDATA "Packages/Microsoft.WindowsTerminal_8wekyb3d8bbwe";
if(!(Test-Path $TerminalPath)) {
    Throw "Windows Terminal have not been installed. winget install -e --id Microsoft.WindowsTerminal"}
# Create symlink to Windows Terminal settings
$TerminalProfileSource = Join-Path $TerminalPath "LocalState/settings.json"
$TerminalProfileDestination = Join-Path $Env:OneDrive "Documents/Appdata/.vscode/settings.json";
if(Test-Path $TerminalProfileDestination) {
    Remove-Item -Path $TerminalProfileDestination;}
Write-Host "Creating symlink to Windows terminal settings..."
Write-Host "New-Item -Path $TerminalProfileDestination -ItemType SymbolicLink -Value $TerminalProfileSource | Out-Null;"
Pause
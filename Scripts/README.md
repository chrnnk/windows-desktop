To run scripts from local PC without signing
```
Set-ExecutionPolicy -ExecutionPolicy Unrestricted
```
```
https://aka.ms/vs/17/release/vc_redist.x64.exe
```
You can run this script directly from GitHub with these two commands:
```
$ScriptFromGithHub = Invoke-WebRequest https://raw.githubusercontent.com/chrxnn/windows-desktop/main/Scripts/App-Install.ps1
Invoke-Expression $($ScriptFromGithHub.Content)
```

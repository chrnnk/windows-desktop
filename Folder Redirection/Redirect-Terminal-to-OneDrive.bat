# Creates fake link in first location to actual link in second location
# Delete the existing folder "%LocalAppData%\Packages\Microsoft.WindowsTerminal_8wekyb3d8bbwe\LocalState" before you point them to new
# OR move out the existing LocalState folder to your "Documents\Appdata" before running this command

mklink /j "%LocalAppData%\Packages\Microsoft.WindowsTerminal_8wekyb3d8bbwe\LocalState" "%UserProfile%\Documents\Appdata\.terminal"
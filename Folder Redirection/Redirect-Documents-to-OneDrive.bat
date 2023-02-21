ECHO mklink /j "%UserProfile%\Documents" "%UserProfile%\OneDrive - domain.com\Documents"
ECHO mklink /j "%UserProfile%\Desktop" "%UserProfile%\Documents\Desktop"
ECHO mklink /j "%UserProfile%\Downloads" "%UserProfile%\Documents\Downloads"
ECHO mklink /j "%UserProfile%\Music" "%UserProfile%\Documents\Music"
ECHO mklink /j "%UserProfile%\Pictures" "%UserProfile%\Documents\Pictures"
ECHO mklink /j "%UserProfile%\Saved Games" "%UserProfile%\Documents\Saved Games"

pause

# MOVE /-Y "%UserProfile%\Saved Games\*.*" "%UserProfile%\Documents\Saved Games"
# REN "%UserProfile%\Saved Games" "OLD-Saved Games"
# mklink /j "%UserProfile%\Saved Games" "%OneDrive%\Documents\Saved Games"

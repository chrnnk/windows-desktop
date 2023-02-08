mklink /j "%UserProfile%\Documents" "%UserProfile%\OneDrive - domain.com\Documents"

mklink /j "%UserProfile%\Desktop" "%UserProfile%\Documents\Desktop"

mklink /j "%UserProfile%\Downloads" "%UserProfile%\Documents\Downloads"

mklink /j "%UserProfile%\Music" "%UserProfile%\Documents\Music"

mklink /j "%UserProfile%\Pictures" "%UserProfile%\Documents\Pictures"

mklink /j "%UserProfile%\Saved Games" "%UserProfile%\Documents\Saved Games"

pause

# MOVE /-Y "%UserProfile%\Saved Games\*.*" "%UserProfile%\Documents\Saved Games"
# REN "%UserProfile%\Saved Games" "OLD-Saved Games"
# mklink /j "%UserProfile%\Saved Games" "%UserProfile%\Documents\Saved Games"

mklink /j "%UserProfile%\Documents" "%UserProfile%\OneDrive - domain.com\Documents"

mklink /j "%UserProfile%\Desktop" "%UserProfile%\OneDrive - domain.com\Documents\Desktop"

mklink /j "%UserProfile%\Downloads" "%UserProfile%\OneDrive - domain.com\Documents\Downloads"

mklink /j "%UserProfile%\Music" "%UserProfile%\OneDrive - domain.com\Documents\Music"

mklink /j "%UserProfile%\Pictures" "%UserProfile%\OneDrive - domain.com\Documents\Pictures"

mklink /j "%UserProfile%\Saved Games" "%UserProfile%\OneDrive - domain.com\Documents\Saved Games"

pause

# MOVE /-Y "%UserProfile%\Saved Games\*.*" "%UserProfile%\OneDrive - domain.com\Documents\Saved Games"
# REN "%UserProfile%\Saved Games" "OLD-Saved Games"
# mklink /j "%UserProfile%\Saved Games" "%UserProfile%\OneDrive - domain.com\Documents\Saved Games"

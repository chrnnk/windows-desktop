mklink /j "%UserProfile%\Documents" "%UserProfile%\OneDrive - domain.com\Documents"

mklink /j "%UserProfile%\Desktop" "%UserProfile%\OneDrive - chrxnn.com\Documents\Desktop"

mklink /j "%UserProfile%\Downloads" "%UserProfile%\OneDrive - chrxnn.com\Documents\Downloads"

mklink /j "%UserProfile%\Music" "%UserProfile%\OneDrive - chrxnn.com\Documents\Music"

mklink /j "%UserProfile%\Pictures" "%UserProfile%\OneDrive - chrxnn.com\Documents\Pictures"

mklink /j "%UserProfile%\Saved Games" "%UserProfile%\OneDrive - chrxnn.com\Documents\Saved Games"

pause

# MOVE /-Y "%UserProfile%\Saved Games\*.*" "%UserProfile%\OneDrive - chrxnn.com\Documents\Saved Games"
# REN "%UserProfile%\Saved Games" "OLD-Saved Games"
# mklink /j "%UserProfile%\Saved Games" "%UserProfile%\OneDrive - chrxnn.com\Documents\Saved Games"
mklink /j "%UserProfile%\Documents" "%UserProfile%\OneDrive - domain.com\Documents"

MOVE /-Y "%UserProfile%\Downloads\*.*" "%UserProfile%\OneDrive - chrxnn.com\Documents\Downloads"
DEL "%UserProfile%\Downloads"
mklink /j "%UserProfile%\Downloads" "%UserProfile%\OneDrive - chrxnn.com\Documents\Downloads"

pause
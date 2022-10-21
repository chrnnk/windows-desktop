# Creates fake link in first location to actual link in second location
# Delete the existing folders in "C:\Games\World of Warcraft\_retail_\" before you point them to new
# OR move out the existing WTF and Interface folders to your "Documents\Saved Games" before running this command

mklink /j "C:\Games\World of Warcraft\_retail_\Interface" "%UserProfile%\Documents\Saved Games\World of Warcraft\_retail_\Interface"
mklink /j "C:\Games\World of Warcraft\_retail_\WTF\Account" "%UserProfile%\Documents\Saved Games\World of Warcraft\_retail_\WTF\Account"
mklink /j "C:\Games\World of Warcraft\_retail_\WTF\SavedVariables" "%UserProfile%\Documents\Saved Games\World of Warcraft\_retail_\WTF\SavedVariables"

mklink /j "C:\Games\World of Warcraft\_classic_\Interface" "%UserProfile%\Documents\Saved Games\World of Warcraft\_classic_\Interface"
mklink /j "C:\Games\World of Warcraft\_classic_\WTF\Account" "%UserProfile%\Documents\Saved Games\World of Warcraft\_classic_\WTF\Account"
mklink /j "C:\Games\World of Warcraft\_classic_\WTF\SavedVariables" "%UserProfile%\Documents\Saved Games\World of Warcraft\_classic_\WTF\SavedVariables"
@ECHO OFF
ECHO Modified from https://github.com/carlospolop/privilege-escalation-awesome-scripts-suite
ECHO .
ECHO systeminfo
systeminfo
ECHO .
ECHO " UAC Settings"
ECHO   [i] If the results read ENABLELUA REG_DWORD 0x1, part or all of the UAC components are on
REG QUERY HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion\Policies\System\ /v EnableLUA 2>nul
ECHO .
ECHO " Registered Anti-Virus(AV)"
WMIC /Node:localhost /Namespace:\\root\SecurityCenter2 Path AntiVirusProduct Get displayName /Format:List | more 
ECHO Checking for defender whitelisted PATHS
reg query "HKLM\SOFTWARE\Microsoft\Windows Defender\Exclusions\Paths" 2>nul
ECHO .
ECHO " ENVIRONMENT"
ECHO .   [i] Interesting information?
set

ECHO " RUN AT STARTUP"
ECHO .   [i] Check if you can modify any binary that is going to be executed by admin or if you can impersonate a not found binary
reg query HKLM\Software\Microsoft\Windows\CurrentVersion\Run 2>nul & ^
reg query HKLM\Software\Microsoft\Windows\CurrentVersion\RunOnce 2>nul & ^
reg query HKCU\Software\Microsoft\Windows\CurrentVersion\Run 2>nul & ^
reg query HKCU\Software\Microsoft\Windows\CurrentVersion\RunOnce 2>nul & ^
icacls "C:\Documents and Settings\All Users\Start Menu\Programs\Startup\*" 2>nul | findstr /i "(F) (M) (W) :\" | findstr /i ":\\ everyone authenticated users todos %username%" && ECHO . & ^
icacls "C:\Documents and Settings\%username%\Start Menu\Programs\Startup\*" 2>nul | findstr /i "(F) (M) (W) :\" | findstr /i ":\\ everyone authenticated users todos %username%" && ECHO . & ^
icacls "%programdata%\Microsoft\Windows\Start Menu\Programs\Startup\*" 2>nul | findstr /i "(F) (M) (W) :\" | findstr /i ":\\ everyone authenticated users todos %username%" && ECHO . & ^
icacls "%appdata%\Microsoft\Windows\Start Menu\Programs\Startup\*" 2>nul | findstr /i "(F) (M) (W) :\" | findstr /i ":\\ everyone authenticated users todos %username%" && ECHO . & ^
ECHO schtasks /query /fo TABLE /nh | findstr /v /i "disable deshab informa")

ECHO " CURRENT SHARES"
net share
ECHO " INTERFACES"
ipconfig  /all
ECHO " FIREWALL"
netsh firewall show state
netsh firewall show config
ECHO .
ECHO " ROUTES"
route print
ECHO .
ECHO " Hosts file"
type C:\WINDOWS\System32\drivers\etc\hosts | findstr /v "^#"
ECHO " BASIC USER INFO"
ECHO .   [i] Check if you are inside the Administrators group or if you have enabled any token that can be use to escalate privileges like SeImpersonatePrivilege, SeAssignPrimaryPrivilege, SeTcbPrivilege, SeBackupPrivilege, SeRestorePrivilege, SeCreateTokenPrivilege, SeLoadDriverPrivilege, SeTakeOwnershipPrivilege, SeDebbugPrivilege
ECHO .
ECHO " CURRENT USER"
net user %username%
net user %USERNAME% /domain 2>nul
whoami /all
ECHO .
ECHO " USERS"
net user
ECHO " GROUPS"
net localgroup
ECHO " ADMINISTRATORS GROUPS"
REM seems to be localised
net localgroup Administrators 2>nul
net localgroup Administradores 2>nul
ECHO " CURRENT LOGGED USERS"
quser
ECHO . 
ECHO " Unattended files"
IF EXIST %WINDIR%\sysprep\sysprep.xml ECHO .%WINDIR%\sysprep\sysprep.xml exists. 
IF EXIST %WINDIR%\sysprep\sysprep.inf ECHO .%WINDIR%\sysprep\sysprep.inf exists. 
IF EXIST %WINDIR%\sysprep.inf ECHO .%WINDIR%\sysprep.inf exists. 
IF EXIST %WINDIR%\Panther\Unattended.xml ECHO .%WINDIR%\Panther\Unattended.xml exists. 
IF EXIST %WINDIR%\Panther\Unattend.xml ECHO .%WINDIR%\Panther\Unattend.xml exists. 
IF EXIST %WINDIR%\Panther\Unattend\Unattend.xml ECHO .%WINDIR%\Panther\Unattend\Unattend.xml exists. 
IF EXIST %WINDIR%\Panther\Unattend\Unattended.xml ECHO .%WINDIR%\Panther\Unattend\Unattended.xml exists.
IF EXIST %WINDIR%\System32\Sysprep\unattend.xml ECHO .%WINDIR%\System32\Sysprep\unattend.xml exists.
IF EXIST %WINDIR%\System32\Sysprep\unattended.xml ECHO .%WINDIR%\System32\Sysprep\unattended.xml exists.
IF EXIST %WINDIR%\..\unattend.txt ECHO .%WINDIR%\..\unattend.txt exists.
IF EXIST %WINDIR%\..\unattend.inf ECHO .%WINDIR%\..\unattend.inf exists. 
ECHO .

ECHO " SAM and SYSTEM backups"
IF EXIST %WINDIR%\repair\SAM ECHO .%WINDIR%\repair\SAM exists. 
IF EXIST %WINDIR%\System32\config\RegBack\SAM ECHO .%WINDIR%\System32\config\RegBack\SAM exists.
IF EXIST %WINDIR%\System32\config\SAM ECHO .%WINDIR%\System32\config\SAM exists.
IF EXIST %WINDIR%\repair\SYSTEM ECHO .%WINDIR%\repair\SYSTEM exists.
IF EXIST %WINDIR%\System32\config\SYSTEM ECHO .%WINDIR%\System32\config\SYSTEM exists.
IF EXIST %WINDIR%\System32\config\RegBack\SYSTEM ECHO .%WINDIR%\System32\config\RegBack\SYSTEM exists.
ECHO .

Echo All Done! 
pause
EXIT
:EOF

:::-Subroutines

:ColorLine
ECHO %~1
EXIT /B

#run this on the pc you want to enable autologin for, then restart
reg ADD “HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\PasswordLess\Device” /v DevicePasswordLessBuildVersion /t REG_DWORD /d 0 /f 
shutdown -r -t 10
#after reboot run netplwiz from cmd
netplwiz
Shift+F10 during installation\
regedit\
Navigate to HKEY_LOCAL_MACHINE\SYSTEM\Setup\
Right-click on Setup and click New > Key. Name that LabConfig\
Create the following DWORD (32-bit Value) keys under LabConfig\
BypassTPMCheck, change the Value data to 1, and press OK.\
: BypassRAMCheck, change the Value data to 1, and press OK.\
: BypassSecureBootCheck, change the Value data to 1, and press OK.\

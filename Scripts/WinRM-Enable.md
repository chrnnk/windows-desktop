set the network type to be "private" for the network you are polling on
```
winrm quickconfig
```
say yes, then test with
```
winrm identify -r:http://localhost:5985 -auth:none
```
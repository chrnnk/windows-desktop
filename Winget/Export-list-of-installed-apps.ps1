# Get list of all apps installed on current machine that areavilable to winget
$DownloadsFolder = (New-Object -ComObject Shell.Application).NameSpace('shell:Downloads').Self.Path
$Date = (Get-Date -Format "yyMMdd")
winget export -o $DownloadsFolder\installed$Date.log
oh-my-posh --init --shell pwsh --config ~/jandedobbeleer.omp.json | Invoke-Expression

Import-Module Terminal-Icons

Import-Module PSReadLine
Set-PSReadLineOption -PredictionSource History
Set-PSReadLineOption -PredictionViewStyle ListView

Set-Alias winfetch pwshfetch-test-1

winfetch
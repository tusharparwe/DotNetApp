Import-Module -Name ServerManager
$appPool = "DefaultAppPool"

Write-Host "Starting $appPool"
Start-WebAppPool -Name $appPool

Write-Host "Resetting IIS"
& iisreset /start


cd C:\website\Demo1.xeeva.com\
start powershell
powershell -command '.\TransShell-02.ps1'

cd C:\website\Demo2.xeeva.com\
start powershell
powershell -command '.\TransShell-02.ps1'
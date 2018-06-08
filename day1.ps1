Get-Command -Module branchcache
Get-Command *get*ip*ad*
Get-Command *content*
$var = Get-NetIPAddress
$var.IPAddress
(Get-NetIPAddress).IPAddress
Get-Content "E:\Mod04\Democode\ByValue.ps1.txt"
get-help -ShowWindow Test-NetConnection
Set-Service -name BITS -StartupType Automatic
get-help -ShowWindow about_*
get-help -ShowWindow about_compa*
get-help -ShowWindow about_env
Get-Service | format-table -Property *
Get-Service | Select-Object -Property status, name, StartType | Sort-Object status, starttype, name
Get-Process | Sort-Object -Property cpu -Descending | Select-Object -Property name,cpu -First 10

Get-Date | select-object -Property DayOfWeek
Get-Process | Select-Object -property Name,@{name='VM';expression={'{0:N2}' -f ($_.VirtualMemorysize/1MB)}}

get-command *physical*
Get-PhysicalDisk | where -FilterScript {$_.HealthStatus -eq "Healthy"} | select -Property FriendlyName, HealthStatus

Get-Service | 
where -FilterScript {$_.Status -eq "Running" -and $_.StartType -eq "Manual" -and $_.Name -like 'w*'} | 
Select-Object -Property Name, status

Get-Service -Name bits, ALG, BFE | ConvertTo-Csv | Out-File c:\svc.csv
Get-Service -Name bits, ALG, BFE | Export-Csv C:\svc1.csv

Compare-Object -ReferenceObject (Get-Content C:\svc.csv) -DifferenceObject (Get-Content c:\svc1.csv)


Get-Service | Out-GridView -OutputMode Multiple | Out-File c:\test.txt




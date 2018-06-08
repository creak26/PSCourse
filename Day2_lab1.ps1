Lab B
gcm *ad*user
Get-ADUser -Filter * -SearchBase 'cn=Users,dc=adatum,dc=com' | Format-Table

(Get-EventLog -LogName Security | Where-Object {$_.EventID -eq 4624} | Measure-Object).Count

Get-EventLog -LogName Security  | 
Where-Object {$_.EventID -eq 4624} | 
Sort-Object -Property TimeWritten | 
Select-Object -property TimeWritten, EventID, Message -First 10
 
dir Cert: -Recurse | Where-Object {$_.HasPrivateKey -eq $false -and (Get-Date) -gt $_.NotBefore -and (Get-Date) -lt $_.NotAfter } | 
Select-Object IssuerName, issuer, NotBefore, NotAfter | Format-List

Get-Volume | Where-Object {$_.SizeRemaining -gt 0 -and  ($_.SizeRemaining/$_.Size*100) -lt 99 } |
Select-Object -Property DriveLetter, @{n='disksize(MB)' ;e={ '{0:N2}' -f $_.Size/1MB}} | 
fl

Get-ControlPanelItem | Where-Object {$_.Category -eq 'System and Security' -and $_.Category.Count
 -eq 1 } |Sort-Object -Property Name | Select-Object -Property name, Description 

#LabC

 Dir E: -Recurse | Select-Object -Property name
 
$lotto=foreach ($n in (1..100))
 {
   Get-Random -Minimum 1 -Maximum 51
   
 }
 $lotto | Select-Object -Unique -First 7


 Get-Random -SetSeed 123
 1..10 | ForEach-Object { Get-Random -SetSeed $_}




Get-ADUser -filter * -Properties * -SearchBase 'ou=IT,dc=adatum,dc=com' | Where-Object -FilterScript {$_.l -eq 'london'} | 
Select-Object -Property name, department, city |
Sort-Object name 


foreach ($l in (Get-ADUser))
{Set-ADUser -Identity $l -Office 'LON-A/1000'}


Get-Service | Stop-Process -WhatIf
Get-Service | gm

Get-Command *ad*user


New-ADUser 
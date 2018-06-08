Get-PSProvider

Get-Help registry

New-PSDrive -Name RegSW -PSProvider Registry -Root HKLM:\SOFTWARE

Get-CimInstance -Namespace root -ClassName __NAMESPACE

Get-CimInstance -ClassName Win32_Process | Select-Object *

Get-CimClass -Namespace root/cimv2 

Get-CimInstance -ClassName Win32_LogicalDisk | Where-Object {$_.DriveType -eq 3}

New-CimSessionOption

$CimSession = New-CimSession -ComputerName (Get-ADComputer -Filter *).name
Get-CimSession

Get-CimInstance -ClassName Win32_BIOS -CimSession $CimSession
Remove-CimSession -CimSession $CimSession

(Get-CimClass Win32_Service).CimClassMethods
Get-WmiObject win32_service | gm -MemberType Method



Get-WmiObject -Namespace root/cimv2 -list | Where-Object {$_.name -like '*confi*'}

Get-WmiObject -Class Win32_NetworkAdapterConfiguration | Where-Object {$_.dhcpenabled -eq $false -and $_.ipaddress -ne $null} | Select-Object -Property ipaddress
Get-WmiObject -Class win32_operatingsystem | Select-Object -Property version, servicepackmajorversion, buildnumber
Get-WmiObject -Namespace root/cimv2 | Where-Object {$_.name -like '*computersystem*'}

Get-WmiObject -Class Win32_ComputerSystem | Select-Object Manufacturer, Model, @{n='RAM(GB)';e={'{0:n1}'-f ($_.totalphysicalmemory/1GB)}}

Get-CimInstance -ClassName Win32_UserAccount | Select-Object Caption, Domain, SID, FullName, Name | Format-Table

Invoke-CimMethod -ClassName Win32_OperatingSystem -ComputerName lon-svr1 -MethodName reboot

Restart-Computer -ComputerName lon-svr1

Get-CimInstance -ClassName Win32_Service | Where-Object {$_.Name -eq "WinRM"} | 
 ForEach-Object {$_.ChangeStartMode('Auto Start')}

[datetime]$date = "6/11/2018" 

[int]$num = 123

$word = 'bob'
$word | gm

New-Variable -Name test -value 1000


$bob = "wed"
New-Variable -Name $bob -Value "Fri"
$bob



# create a string array
[string[]]$names =@()
$names += "bob"
$names += "bill"
$names

#arraylist#
$computers = New-Object -TypeName System.Collections.ArrayList
$computers.Add("lon-cl1")
$computers.Add("lon-cl2")
$computers

#array element position
$num = @(12,34,53,26,86)
$num[3]
$num[-1]



$hash = [ordered]@{
 'lon-dc1' = '172.21.10.101'
 'lon-cl1' = '172.21.10.102'
 'lon-svr1' = '172.21.10.103'

}

$hash | ForEach-Object {$_.values -eq '172.21.10.101'}
$hash.Add('lon-dc2', '172.21.10.104')
$hash.'lon-dc1'= $null #remove the value#

@{
  n=''
  e={}
}

$logPath = 'C:\logs\'
$logFile = 'log.txt'
$logPath = ($logPath.Replace('C','E') + $logFile) -replace '\\{2,}','\'


$today = Get-Date
#convert $today.Year to sting first, so it can be added with '-' which is a string
$Filename = "$($today.Year)" + '-' + "$($today.Month)" + '-' + "$($today.Day)" + '.txt'
$Filename | Out-File -FilePath $logPath
$cutOffDay = (Get-Date).AddDays(-30) 
Get-ADUser -Filter * -Properties * | Where-Object {$_.LastLogonDate -gt $cutOffDay} | Select-Object -Property Name


$mktgUsers = Get-ADUser -Filter * -Properties department | Where-Object {$_.department -eq 'Marketing'}
$mktgUsers | Set-ADUser -Department 'Business development'

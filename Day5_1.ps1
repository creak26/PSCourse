#Enable PS remoting first
Enable-PSRemoting

$PSSession = New-PSSession -ComputerName lon-dc1,lon-svr1
Invoke-Command -Session $PSSession -ScriptBlock {Get-Service bits | Select-Object -Property status, name} | ft 


Invoke-Command -Session $PSSession -SessionOption $psOPT -Port 5531 -UseSSL -ThrottleLimit 343
$psOPT = New-PSSessionOption -SkipCACheck


#getting ActiveDirectory module from a remote machine
$PSSession1 = New-PSSession -ComputerName lon-dc1 # have to  put in a variable, so have a record and can be reused
#Get-PSSession | Remove-PSSession
Import-Module -PSSession $PSSession1 activedirectory 
#$PSSession1 = New-PSSession -ComputerName lon-dc1 -Prefix OLDDC
#will need to run cmd like Get-OLDDCADusers


$NewSession = New-PSSession -ComputerName lon-dc1, lon-svr1
Invoke-Command -Session $NewSession -ScriptBlock {
    Get-NetFirewallRule -Enabled True | Select-Object DisplayName ; Remove-Module NetSecurity
}

#-ExcludeProperty Display all properties execpt RunspaceID
Invoke-Command -Session $NewSession -ScriptBlock {
    Get-WmiObject -Class win32_logicaldisk | Where-Object {$_.DriveType -eq 3} | Select-Object -Property size, deviceID, freespace 
} | Select-Object -Property * -ExcludeProperty RunspaceID  | ConvertTo-Html | Out-File c:\drives.html


#Backgroud jobs
Start-job -Name myjob -ScriptBlock {dir \ -Recurse}
Start-Job -ScriptBlock {dir \}
Get-job -IncludeChildJob
Invoke-Command -ComputerName lon-dc1, lon-svr1 -ScriptBlock {dir c:\} -AsJob
Receive-Job -ID 11 -Keep #Get result of the job, this command will remove the job from the memeory, however if add "-Keep", it keep the data in the memory

#Scheduled jobs
$SJOpt = New-ScheduledJobOption -RunElevated
$SJtrig = New-JobTrigger -At (get-date).AddSeconds(5) -Once
Register-ScheduledJob -Trigger $SJtrig -ScheduledJobOption $SJOpt -ScriptBlock {hostname} -Name hostname1 #retrive a hostname

#Regex
netstat -nao | Select-String -Pattern "\s+TCP\s+\d.*LIST.*"  #Pattern means Regex, 
netstat -nao | Select-String -Pattern "LIST" #only get the listening ones.

#format operator
$services = Get-Service | Select-Object -Property status, name
"{0,-20} {1,-40}" -f "Status","Name"
foreach ($service in $services){
    "{0,-20} {1,-40}" -f $service.status, $service.name
}
Get-Command -Module PowerShellGet
Find-module

Get-ExecutionPolicy
$Cscert = dir -CodeSigningCert | Where-Object {$_.Thumbprint -like "4DBBE14DF2938E3D95E4C6FD95D3D9B110B2FA06"}
$Cscert
Write-host -ForegroundColor Yellow "This is a script"

#sign your code#
Set-AuthenticodeSignature -Certificate $Cscert -HashAlgorithm sha256 -FilePath C:\Users\Administrator.ADATUM\Desktop\myscript.ps1

#Loop#

$Services = Get-Service
foreach ($Service in $Services){
   Write-Host -ForegroundColor Cyan -NoNewline "Service name: " 
   Write-host $Service.name
}


$Choice = Read-Host -Prompt "Please enter a number between 1 and 10"



if($Choice -gt 0 -and $Choice -le 10){
    Write-Host "Good job you choose $choice"
}
else{
    Write-Host "damm"
}


switch ($Choice){
    1 {"You chose one"}
    2 {"You chose two"}
    3 {
        "You chose three" 
         break 
    }
    
    {$_ -gt 2} {"you chose a number greater then 3"}
    default {"You chose something else"}
}


for ($num=2; $num -le 10; $num=$num+2) {
    "The number is $num"
}
foreach ($num in (1..10)){
    "The number is $num"
}

foreach ($val in (4,6,8,9,0,12,15)){
     if($val -eq 0) { continue}
     144/$val
}


do
{
    $WordChoice = Read-Host -Prompt "enter a word"
}
Until ($WordChoice -eq "exit")



#always execute once#
do
{
    $WordChoice = Read-Host -Prompt "enter a word"
}
while ($WordChoice -ne "exit")

#validate first, may not executed#
while ($WordChoice -ne "exit")
{
    $WordChoice = Read-Host -Prompt "enter a word"
}




for ($pl=0; $pl -lt 6; $pl++){
$Upper = [char] (65..90 | Get-Random)
$Lower1 = [char] (97..122 | Get-Random)
$Lower2 = [char] (97..122 | Get-Random)
$Lower3 = [char] (97..122 | Get-Random)
$Number = 0..9 | Get-Random
$Special = [char] (33,(35..38) | Get-Random)

$Password =  $upper + $number + $Special + $Lower1 + $lower2 + $lower3
}

$Password = ($Password.ToCharArray() | Sort-Object{Get-Random}) -join'' #join: convert array into a string
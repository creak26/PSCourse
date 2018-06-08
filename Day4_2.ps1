

#Try Catch only works for Terminating Errors(-ErrorAction stop)

Try{
    foreach ($computer in "lon-dc1", "lon-fri1", "lon-cl1")
    {
    Get-WmiObject -Class win32_bios -ComputerName $computer -ErrorAction stop -ErrorVariable err1
    }
}
Catch{
    Write-Warning "This did not work and the the compuer was $computer"
     
}


function Do-Math {
    Param([int]$Value)
    $Answer1  = $Value + 2
    $Answer2  = $Value * 2
    $ObjProp  = [ordered] @{
        InitValue = $Value
        MathValue = 2
        Add = $Answer1
        Multiply = $Answer2
        }
    New-Object -TypeName psobject -Property $ObjProp #always think create the result as an object#
}
$number = 5
$Addition = Do-Math -Value $number
$Addition


Enter-PSSession -ComputerName lon-dc1
$sname= 'bits'
Invoke-Command -ComputerName lon-dc1, lon-svr1 -ScriptBlock {Get-Service -Name $USING:sname} #$USING: passing a local variable onto remote computer
Invoke-Command -ComputerName lon-dc1, lon-svr1 -FilePath C:\test.ps1jj #run local script on remote computer

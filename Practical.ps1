#Convert name
"Roger, Jane"| Convert-String -Example "Hope, bob=Bob Hope"


#Find file with long file name
[cmdletbinding()] #No error when it's on Line 1.
Param(
[int]$Max,
[string]$StartSource = 'D:\bob'
)

function Get-DirLength{
$items = dir -Recurse
    foreach ($item in $items)
    {
        $objprop = @{
        Fullname = $item.Fullname
        Length = $item.Fullname.length
        }
        if($objprop.length -gt $Max){
        New-Object -TypeName psojbect -Property objprop
        }
    }
}

$TooBigDirs = Get-DirLength
foreach ($Dir in $TooBigDirs){
    #put in your code to fix the file path
}



#Azure AD
Install-Module Azurerm 

#git hub sign in
git config --global user.name "" #2 -- before global
git config --global user.email ""
git config --list
git clone http://******

#add all changes, go to the github folder on local machine
git add . #space between add and dot.
git commit -m "put some reasons here"
git push #push up to github, open a new window to do it if there is an error

#download git
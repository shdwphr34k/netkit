# Name of the function you can call

function Show-Netkit

# This is the menu part

{
Param (
[string]$Title = 'Network Tools'
)
Clear-Host
Write-Host $Title
Write-Host "1: Press '1' to run ipconfig."
Write-Host "2: Press '2' to ping something."
Write-Host "3: Press '3' to tracert something."
Write-Host "Q: Press 'Q' to quit."
}

# Function ipconfig

function Run-Ipconfig {

& "ipconfig"
Write-Host "-------------------------"
Read-Host "Press any key to go back to main menu"

}

# Function ping

function Ping-Something 
{

Param (
[string]$target
)

if ($target -like $null){
$target = Read-Host "Wrong ip or host. Write ip address or hostname:"
}
& "ping" $target
Write-Host "-------------------------"
Read-Host "Press any key to go back to main menu"

}

# Function tracert

function Tracert-Something 
{

Param (
[string]$target
)

if ($target -like $null){
$target = Read-Host "Wrong ip or host. Write ip address or hostname:"
}
& "tracert" $target
Write-Host "-------------------------"
Read-Host "Press any key to go back to main menu"

}

# Here is the execution part

$selection = $null
do {
Show-Netkit
$selection = Read-Host "Select option"
switch ($selection){
'1' {Run-Ipconfig}
'2' {
$target = Read-Host "Write ip address or hostname"
Ping-Something -target $target
}
'3' {
$target = Read-Host "Write ip address or hostname"
Tracert-Something -target $target
}
'Q' {
Write-Host "Quitting"
}
default {
Read-Host "Wrong selection, try again."
}
}
} while ($selection -notlike "Q")

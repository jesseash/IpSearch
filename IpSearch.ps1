<# enter subnet range here#>
$iprange = 100..250

<#ping address range- this forces an addition of the connected device to 
 the arp table#>
Foreach ($ip in $iprange)
{
  $computer = "192.168.1.$ip"
  ping $computer
}

$mac="Put Mac address here"
$ip=arp -a | select-string $mac |% { $_.ToString().Trim().Split(" ")[0] }

"$mac has an ip of $ip"

get-command *dhcp*scope*
Get-DhcpServerv4Scope -ComputerName lon-dc1 | 
  Select-Object -Property ScopeId, SubnetMask, Name | 
  Format-List

  Get-Command *firewall*rule*
  get-help -showwindow Get-NetFirewallRule 
  Get-NetFirewallRule -Enabled True | Format-Table -AutoSize -Wrap | Select-Object -Property name, profile, direction, enabled
  #display all property#
  Get-NetFirewallRule -Enabled True | Select-Object -first 1 -Property * 
  
  Get-NetFirewallRule -Enabled True | 
  Sort-Object -Property profile, displayname | 
  Select-Object -Property displayname, profile, direction, Action | 
  Format-table -GroupBy profile

  Get-NetFirewallRule -Enabled True | Select-Object @{n='name';e=$_.displayname}
 
Get-NetNeighbor | Sort-Object -property state -Descending | 
Get-NetNeighbor | Format-table -Property IPAddress -GroupBy state


Test-NetConnection lon-dc1
Get-DnsClientCache | Sort-Object -Property Entry | Format-table -Property entry, Type, ttl
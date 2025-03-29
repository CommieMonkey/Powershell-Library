<# 
Author: Thomas Van Aert
License: CC BY-NC-ND 4.0 (https://creativecommons.org/licenses/by-nc-nd/4.0/)
Description: [Brief script description]
Note: You may NOT modify or redistribute this script without my permission.
#>

$subnet = "192.168.1"  # Pas dit aan naar jouw netwerk
1..254 | ForEach-Object {
    $ip = "$subnet.$_"
    if (Test-Connection -ComputerName $ip -Count 1 -Quiet) {
        $mac = (arp -a $ip | Select-String -Pattern "([a-fA-F0-9:-]{17})").Matches.Value
        Write-Host "Actief apparaat: $ip - MAC: $mac"
    }
}

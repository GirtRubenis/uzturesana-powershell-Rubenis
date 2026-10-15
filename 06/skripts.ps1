Get-CimInstance -ClassName Win32_PnPSignedDriver | Where-Object -FilterScript {$_.DriverProviderName -ne 'Microsoft' -and $_.DriverProviderName -ne $null} | Export-Csv -Path "$PSScriptRoot\draiveri.csv" -Encoding UTF8 -NoTypeInformation
$rinduSkaits = (Get-Content -Path "$PSScriptRoot\draiveri.csv").Count
Write-Output $rinduSkaits
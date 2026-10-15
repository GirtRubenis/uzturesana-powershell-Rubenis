$servisi = Get-Service | Where-Object -FilterScript {$_.StartType -eq 'Automatic' -and $_.Status -eq 'Stopped'}
if ($null -eq $servisi -or @($servisi).Count -eq 0) {
    Write-Output "Atrasto servisu skaits: 0"
}
else {
    $servisi | Start-Service -WhatIf
    $servisi | Start-Service
}
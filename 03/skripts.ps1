$darbojas = 0
$apturēti = 0
foreach ($serviss in Get-Service) {
    if ($serviss.Status -eq 'Running') {
        $darbojas++
    }
elseif ($serviss.Status -eq 'Stopped') {
        $apturēti++
    }
}
$summa = $darbojas + $apturēti
Write-Output "Darbojas: $darbojas"
Write-Output "Apturēti: $apturēti"
Write-Output "Kopējā summa: $summa"
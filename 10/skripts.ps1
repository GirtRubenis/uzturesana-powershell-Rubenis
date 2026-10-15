$procesuSkaits = @(Get-Process).Count
$darbojas = 0
$apturēti = 0
foreach ($s in Get-Service) {
    if ($s.Status -eq 'Running') { $darbojas++ }
    elseif ($s.Status -eq 'Stopped') { $apturēti++ }
}
$kļūdasSkaits = @(Get-WinEvent -FilterHashtable @{LogName='System'; Level=2; StartTime=(Get-Date).AddHours(-48)} -ErrorAction SilentlyContinue).Count
$brīvaVieta = [math]::Round((Get-CimInstance -ClassName Win32_LogicalDisk -Filter "DeviceID='C:'").FreeSpace / 1GB, 2)

Write-Output "Procesu skaits: $procesuSkaits"
Write-Output "Aktīvie servisi: $darbojas, Apturētie servisi: $apturēti"
Write-Output "Kļūdu skaits (pēdējās 48h): $kļūdasSkaits"
Write-Output "C diska brīvā vieta: $brīvaVieta GB"
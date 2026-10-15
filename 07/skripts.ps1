$robežaGB = 20
Get-CimInstance -ClassName Win32_LogicalDisk | Where-Object -FilterScript {$_.DriveType -eq 3} | ForEach-Object {
    $burts = $_.DeviceID
    $kopāGB = [math]::Round($_.Size / 1GB, 2)
    $brīvsGB = [math]::Round($_.FreeSpace / 1GB, 2)
    Write-Output "Disks: $burts | Kopējais izmērs: $kopāGB GB | Brīvā vieta: $brīvsGB GB"
    if ($brīvsGB -lt $robežaGB) {
        Write-Warning "Brīdinājums! Diskā $burts brīvā vieta ($brīvsGB GB) ir mazāka par noteikto robežu ($robežaGB GB)!"
    }
}
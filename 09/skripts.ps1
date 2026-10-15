Get-CimInstance -ClassName Win32_Process | ForEach-Object {
    try {
        $nosaukums = $_.Name
        $id = $_.ProcessId
        $ipasnieks = $_.GetOwner()
        Write-Output "Process: $nosaukums (ID: $id) | Lietotājs: $($ipasnieks.User)"
    }
    catch {
        Write-Output "Process: $($_.Name) | Lietotājs: Nevar noteikt (piekļuves kļūda)"
    }
}
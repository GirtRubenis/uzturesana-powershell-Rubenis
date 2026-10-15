$laiks = (Get-Date).AddHours(-48)
$kļūdas = Get-WinEvent -FilterHashtable @{LogName='System'; Level=2; StartTime=$laiks} -ErrorAction SilentlyContinue
if ($null -eq $kļūdas) {
    Write-Output "Kļūdu skaits: 0"
    Write-Output "Visbiežākais avots: Nav (0 reizes)"
}
else {
    $skaits = @($kļūdas).Count
    Write-Output "Kļūdu skaits: $skaits"
    $topAvots = $kļūdas | Group-Object -Property ProviderName | Sort-Object -Property Count -Descending | Select-Object -First 1
    Write-Output "Visbiežākais avots: $($topAvots.Name) ($($topAvots.Count) reizes)"
}
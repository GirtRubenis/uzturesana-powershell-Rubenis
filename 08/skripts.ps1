$laiks1 = Measure-Command -Expression { Get-Service -Name 'Spooler' }
$laiks2 = Measure-Command -Expression { Get-CimInstance -ClassName Win32_Service -Filter "Name='Spooler'" }
Write-Output "1. veids (Get-Service): $($laiks1.TotalMilliseconds) ms"
Write-Output "2. veids (Get-CimInstance): $($laiks2.TotalMilliseconds) ms"
Write-Output "Ātrāks bija: Get-Service"
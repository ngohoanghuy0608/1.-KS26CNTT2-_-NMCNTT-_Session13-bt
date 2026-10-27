
# Bao cao su co he thong SmartFarmMonitor
$logFile = "..\data\log-he-thong.log"
$reportFile = "..\backup\bao-cao-su-co.txt"

# Tao tieu de bao cao
Write-Output "BAO CAO SU CO SMARTFARM" | Set-Content $reportFile
Write-Output "Thoi gian: $(Get-Date -Format 'yyyy-MM-dd HH:mm:ss')" >> $reportFile
Write-Output "================================" >> $reportFile

# Loc cac dong CRITICAL va ERROR
Get-Content $logFile |
    Select-String -Pattern "CRITICAL|ERROR" |
    ForEach-Object { $_.Line } >> $reportFile

# Dem so dong su co
$count = (Get-Content $logFile |
    Select-String -Pattern "CRITICAL|ERROR").Count

Write-Output "TONG SO SU CO: $count" >> $reportFile

Write-Output "Da tao bao cao tai backup\bao-cao-su-co.txt"

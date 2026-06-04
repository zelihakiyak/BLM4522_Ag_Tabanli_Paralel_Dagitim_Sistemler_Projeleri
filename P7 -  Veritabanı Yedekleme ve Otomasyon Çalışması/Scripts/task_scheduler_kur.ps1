# P7 - Task Scheduler Kurulum Scripti

# Eski görevi kaldır (varsa)
Unregister-ScheduledTask -TaskName "AW P7 Otomatik Yedekleme" -Confirm:$false -ErrorAction SilentlyContinue

# Görev ayarları
$Action = New-ScheduledTaskAction `
    -Execute "PowerShell.exe" `
    -Argument "-ExecutionPolicy Bypass -File `"C:\Backup\yedek_otomatik.ps1`""

$Trigger = New-ScheduledTaskTrigger `
    -Daily `
    -At "02:00AM"

$Settings = New-ScheduledTaskSettingsSet `
    -ExecutionTimeLimit (New-TimeSpan -Hours 2) `
    -RestartCount 3 `
    -RestartInterval (New-TimeSpan -Minutes 10) `
    -StartWhenAvailable

# Görevi kaydet
Register-ScheduledTask `
    -TaskName "AW P7 Otomatik Yedekleme" `
    -Action $Action `
    -Trigger $Trigger `
    -Settings $Settings `
    -RunLevel Highest `
    -Force

# Doğrula
Get-ScheduledTask -TaskName "AW P7 Otomatik Yedekleme"

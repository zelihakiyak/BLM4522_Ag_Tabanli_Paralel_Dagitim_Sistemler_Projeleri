# P7 - Gelismis Yedekleme Scripti
# BLM4522 - Zeliha Kiyak

$ServerInstance = ".\SQLEXPRESS"
$Database = "AdventureWorks2022"
$BackupPath = "C:\Program Files\Microsoft SQL Server\MSSQL16.SQLEXPRESS\MSSQL\Backup"
$LogFile = "C:\Backup\yedek_rapor.txt"
$Date = Get-Date -Format "yyyy-MM-dd_HH-mm"
$Tarih = Get-Date -Format "dd.MM.yyyy HH:mm:ss"

function Log-Yaz {
    param($Mesaj, $Tip = "BILGI")
    $Satir = "[$Tarih] [$Tip] $Mesaj"
    Add-Content -Path $LogFile -Value $Satir
    Write-Host $Satir
}

function Yedek-Al {
    param($YedekTipi, $DosyaAdi, $SqlKomutu)
    
    try {
        Log-Yaz "Baslatiliyor: $YedekTipi yedeği" "BILGI"
        
        Invoke-Sqlcmd `
            -ServerInstance $ServerInstance `
            -Query $SqlKomutu `
            -QueryTimeout 300
        
        Log-Yaz "BASARILI: $YedekTipi - $DosyaAdi" "BASARILI"
        return $true
    }
    catch {
        Log-Yaz "HATA: $YedekTipi basarisiz! $_" "HATA"
        return $false
    }
}


Log-Yaz "========== YEDEKLEME SURECI BASLADI ==========" "BILGI"

# 1. TAM YEDEK
$TamDosya = "$BackupPath\AW_P7_Tam_$Date.bak"
$TamSql = "BACKUP DATABASE [$Database] TO DISK = '$TamDosya' WITH FORMAT, INIT, NAME = 'P7 Tam Yedek $Date', STATS = 10"
$TamSonuc = Yedek-Al "Tam Yedek" $TamDosya $TamSql

# 2. DİFERANSİYEL YEDEK
$DiffDosya = "$BackupPath\AW_P7_Diff_$Date.bak"
$DiffSql = "BACKUP DATABASE [$Database] TO DISK = '$DiffDosya' WITH DIFFERENTIAL, FORMAT, INIT, NAME = 'P7 Diferansiyel $Date', STATS = 10"
$DiffSonuc = Yedek-Al "Diferansiyel" $DiffDosya $DiffSql

# 3. LOG YEDEĞİ
$LogDosya = "$BackupPath\AW_P7_Log_$Date.bak"
$LogSql = "BACKUP LOG [$Database] TO DISK = '$LogDosya' WITH FORMAT, INIT, NAME = 'P7 Log Yedek $Date', STATS = 10"
$LogSonuc = Yedek-Al "Log Yedeği" $LogDosya $LogSql


Log-Yaz "========== OZET RAPOR ==========" "BILGI"
Log-Yaz "Tam Yedek   : $(if ($TamSonuc)  {'BASARILI'} else {'BASARISIZ'})" "RAPOR"
Log-Yaz "Diferansiyel: $(if ($DiffSonuc) {'BASARILI'} else {'BASARISIZ'})" "RAPOR"
Log-Yaz "Log Yedeği  : $(if ($LogSonuc)  {'BASARILI'} else {'BASARISIZ'})" "RAPOR"

# ============================================
# UYARI — BAŞARISIZ YEDEK KONTROLÜ
# ============================================
if (-not $TamSonuc -or -not $DiffSonuc -or -not $LogSonuc) {
    Log-Yaz "KRITIK UYARI: Bir veya daha fazla yedek basarisiz oldu!" "UYARI"
    Log-Yaz "Lutfen yedek log dosyasini kontrol edin: $LogFile" "UYARI"
} else {
    Log-Yaz "Tum yedekler basariyla tamamlandi." "BILGI"
}

Log-Yaz "========== YEDEKLEME SURECI TAMAMLANDI ==========" "BILGI"
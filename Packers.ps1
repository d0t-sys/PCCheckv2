# Checking Script
# For safe and local quick-dumping of System logs and files
#
# Author:
# Created by do1-sys under GPL-3.0 license
# This script is not related to any external Project.
#
# Usage:
# Use with Powershell 5.1 and NET 4.0 or higher.
# Running PC Checking Programs, including this script, outside of PC Checks may have impact on the outcome.
# It is advised not to use this on your own.
#
# Version 2.0
# 30 - October - 2024

Clear-Host
Write-Host "`n`n`n`tThis Script requires the Full-Check to be run FIRST!" -Foregroundcolor Yellow
Write-Host "`n`n`n`t`tChecking for Dependancy." -Foregroundcolor Yellow
Start-Sleep 3

$filesizePaths = "C:\Temp\Dump\Processes\Filesize.txt"
if (-not (Test-Path $filesizePaths) -or (Get-Content $filesizePaths).Count -eq 0) {
    Write-Host "No Entries to check found - Nothing Detected."
    & C:\temp\scripts\Menu.ps1
}

# --- DEAKTIVIERT: Erstellen des DIE-Verzeichnisses ---
# New-Item -Path "C:\temp\dump\DIE" -ItemType Directory -Force | Out-Null

# --- Spracheingabe und Zustimmung ---
$culture = (Get-Culture).Name
if ($culture -like 'de*') {
    $lang = "Die DIE-Komponente wurde deaktiviert. Diese Version des Scripts lädt keine Tools herunter. Fortfahren? (Y/N)"
} elseif ($culture -like 'tr*') {
    $lang = "DIE bileşeni devre dışı bırakıldı. Bu script hiçbir araç indirmeyecek. Devam edilsin mi? (Y/N)"
} else {
    $lang = "The DIE component has been disabled. This version of the script will not download any tools. Proceed? (Y/N)"
}

Clear-Host
if ((Read-Host "`n`n`n"$lang) -ne "Y") {
    Clear-Host
    Write-Host "`n`n`nPC Check aborted by Player.`nThis may lead to consequences up to your servers Administration.`n`n`n" -Foregroundcolor red
    Write-Host "`n`n`tReturning to Menu in " -NoNewline 
    Write-Host "5 " -NoNewLine -ForegroundColor Magenta
    Write-Host "Seconds`n`n`n" -NoNewline
    Start-Sleep 5
    & C:\temp\scripts\Menu.ps1
    exit
}

Clear-Host
Write-Host "`n`n`n-------------------------"-ForegroundColor yellow
Write

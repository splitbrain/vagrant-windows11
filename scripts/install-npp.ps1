# from https://blog.kmsigma.com/2021/01/06/installing-the-latest-notepad-with-powershell/

# Modern websites require TLS 1.2
[Net.ServicePointManager]::SecurityProtocol = [Net.SecurityProtocolType]::Tls12

#requires -RunAsAdministrator

# Let's go directly to the website and see what it lists as the current version
$BaseUri = "https://notepad-plus-plus.org"
$BasePage = Invoke-WebRequest -Uri $BaseUri -UseBasicParsing
$ChildPath = $BasePage.Links | Where-Object { $_.outerHTML -like '*Current Version*' } | Select-Object -ExpandProperty href
# Now let's go to the latest version's page and find the installer
$DownloadPageUri = $BaseUri + $ChildPath
$DownloadPage = Invoke-WebRequest -Uri $DownloadPageUri -UseBasicParsing
# Determine bit-ness of O/S and download accordingly
if ( [System.Environment]::Is64BitOperatingSystem ) {
    $DownloadUrl = $DownloadPage.Links | Where-Object { $_.outerHTML -like '*npp.*.Installer.x64.exe"*' } | Select-Object -ExpandProperty href -Unique
} else {
    $DownloadUrl = $DownloadPage.Links | Where-Object { $_.outerHTML -like '*npp.*.Installer.exe"*' } | Select-Object -ExpandProperty href -Unique
}
Write-Host "Downloading the latest Notepad++ to the temp folder"
Invoke-WebRequest -Uri $DownloadUrl -OutFile "$env:TEMP\$( Split-Path -Path $DownloadUrl -Leaf )" | Out-Null
Write-Host "Installing the latest Notepad++"
Start-Process -FilePath "$env:TEMP\$( Split-Path -Path $DownloadUrl -Leaf )" -ArgumentList "/S" -Wait

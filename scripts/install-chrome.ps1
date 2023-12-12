$Uri = "https://dl.google.com/chrome/install/latest/chrome_installer.exe"
$Installer = Join-Path $env:TEMP "ChromeStandaloneSetup64.exe"

echo "Downloading Chrome installer..."
Invoke-WebRequest -Uri $Uri -OutFile $Installer

echo "Running Chrome installer..."
Start-Process -FilePath $Installer -Args "/install" -Verb RunAs -Wait;

Remove-Item $Installer

$ProgressPreference = 'SilentlyContinue'

$Uri = "https://dl.google.com/dl/chrome/install/googlechromestandaloneenterprise64.msi"
$Installer = Join-Path $env:TEMP "chromesetup.msi"

echo "Downloading Chrome installer..."
Invoke-WebRequest -Uri $Uri -OutFile $Installer

echo "Running Chrome installer..."
Start-Process msiexec.exe -Wait -ArgumentList "/I",$Installer,"/quiet"

Remove-Item $Installer

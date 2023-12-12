# https://gist.github.com/guillermo-musumeci/a20ccae1be33c108844d0a899349b013

$SourceURL = "https://download.mozilla.org/?product=firefox-msi-latest-ssl&os=win64&lang=en-US"
$Installer = Join-Path $env:TEMP "firefox.msi"

echo "Downloading Firefox installer..."
Invoke-WebRequest $SourceURL -OutFile $Installer

echo "Running Firefox installer..."
Start-Process -FilePath $Installer -Args "/passive" -Verb RunAs -Wait

Remove-Item $Installer

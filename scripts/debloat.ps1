

$url = "https://github.com/Raphire/Win11Debloat/archive/master.zip"

$zip = Join-Path $Env:Temp "debloat.zip"
$dest = Join-Path $Env:Temp "debloat"
$exec = Join-Path $dest "Win11Debloat-master\Win11Debloat.ps1"

Invoke-WebRequest -Uri $url -OutFile $zip
Expand-Archive -Force -LiteralPath $zip -DestinationPath $dest

Set-ExecutionPolicy Unrestricted -Scope Process

# redirecting STDERR seems to be the only way to make Vagrant ignore
# the error about explorer.exe not running yet
& $exec -RunDefaults -Silent 2> $Null


Remove-Item $zip
Remove-Item -Recurse $dest


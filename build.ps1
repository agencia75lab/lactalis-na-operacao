# Monta a apresentação a partir de /src
#  - index.html      : fragmento (publicação como Artifact claude.ai; o host injeta doctype/head/body)
#  - docs/index.html : documento completo para GitHub Pages (publicar a pasta /docs)
$ErrorActionPreference = 'Stop'
$root = Split-Path -Parent $MyInvocation.MyCommand.Path
$src  = Join-Path $root 'src'
$parts = Get-ChildItem $src -Filter '*.html' | Sort-Object Name
$utf8 = New-Object System.Text.UTF8Encoding($false)

$head = [IO.File]::ReadAllText((Join-Path $src '01-head.html'), $utf8)
$rest = ($parts | Where-Object { $_.Name -ne '01-head.html' } | ForEach-Object { [IO.File]::ReadAllText($_.FullName, $utf8) }) -join "`n"

[IO.File]::WriteAllText((Join-Path $root 'index.html'), $head + "`n" + $rest, $utf8)

$docs = Join-Path $root 'docs'
New-Item -ItemType Directory -Force (Join-Path $docs 'assets\images') | Out-Null
Copy-Item (Join-Path $root 'assets\images\*') (Join-Path $docs 'assets\images') -Force
$full = "<!doctype html>`n<html lang=""pt-BR"">`n<head>`n<meta charset=""utf-8"">`n<meta name=""viewport"" content=""width=device-width,initial-scale=1,viewport-fit=cover"">`n" + $head + "`n</head>`n<body>`n" + $rest + "`n</body>`n</html>`n"
[IO.File]::WriteAllText((Join-Path $docs 'index.html'), $full, $utf8)
"index.html: {0:N0} bytes · docs/index.html: {1:N0} bytes" -f (Get-Item (Join-Path $root 'index.html')).Length, (Get-Item (Join-Path $docs 'index.html')).Length

# Versão comercial (15 telas): mesmo head/chrome/script, telas de src/pitch/slides.html
$chrome = [IO.File]::ReadAllText((Join-Path $src '02-chrome.html'), $utf8)
$script = [IO.File]::ReadAllText((Join-Path $src '07-script.html'), $utf8)
$pslides = [IO.File]::ReadAllText((Join-Path $src 'pitch\slides.html'), $utf8)
$ptitle = ([regex]::Match($pslides, '<!--\s*title:\s*(.+?)\s*-->')).Groups[1].Value
$phead = $head -replace '<title>[^<]*</title>', ('<title>' + $ptitle + '</title>')
$prest = $chrome + "`n" + $pslides + "`n" + $script
[IO.File]::WriteAllText((Join-Path $root 'pitch.html'), $phead + "`n" + $prest, $utf8)
$pfull = "<!doctype html>`n<html lang=""pt-BR"">`n<head>`n<meta charset=""utf-8"">`n<meta name=""viewport"" content=""width=device-width,initial-scale=1,viewport-fit=cover"">`n" + $phead + "`n</head>`n<body>`n" + $prest + "`n</body>`n</html>`n"
[IO.File]::WriteAllText((Join-Path $docs 'proposta.html'), $pfull, $utf8)
"pitch.html: {0:N0} bytes · docs/proposta.html" -f (Get-Item (Join-Path $root 'pitch.html')).Length

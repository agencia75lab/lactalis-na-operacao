# Monta as apresentações a partir de /src (Pages servindo main / raiz)
#  - index.html            : proposta comercial (15 telas)      -> agencia75lab.github.io/lactalis-na-operacao/
#  - completa/index.html   : plano completo (42 telas)          -> agencia75lab.github.io/lactalis-na-operacao/completa/
#  - artifact/*.html       : fragmentos para publicação como Artifact claude.ai (o host injeta doctype/head/body)
$ErrorActionPreference = 'Stop'
$root = Split-Path -Parent $MyInvocation.MyCommand.Path
$src  = Join-Path $root 'src'
$utf8 = New-Object System.Text.UTF8Encoding($false)
function Read-U8($p) { [IO.File]::ReadAllText($p, $utf8) }
function Write-U8($p, $t) { New-Item -ItemType Directory -Force (Split-Path $p) | Out-Null; [IO.File]::WriteAllText($p, $t, $utf8) }
function New-Doc($head, $rest) {
  "<!doctype html>`n<html lang=""pt-BR"">`n<head>`n<meta charset=""utf-8"">`n<meta name=""viewport"" content=""width=device-width,initial-scale=1,viewport-fit=cover"">`n<meta name=""author"" content=""75 LAB"">`n" + $head + "`n</head>`n<body>`n" + $rest + "`n</body>`n</html>`n"
}

$head   = Read-U8 (Join-Path $src '01-head.html')
$chrome = Read-U8 (Join-Path $src '02-chrome.html')
$script = Read-U8 (Join-Path $src '07-script.html')

# plano completo: 02..07 em ordem
$parts = Get-ChildItem $src -Filter '*.html' | Sort-Object Name | Where-Object { $_.Name -ne '01-head.html' }
$full  = ($parts | ForEach-Object { Read-U8 $_.FullName }) -join "`n"

# proposta: título vem do comentário <!-- title: ... --> em src/pitch/slides.html
$pslides = Read-U8 (Join-Path $src 'pitch\slides.html')
$ptitle  = ([regex]::Match($pslides, '<!--\s*title:\s*(.+?)\s*-->')).Groups[1].Value
$phead   = $head -replace '<title>[^<]*</title>', ('<title>' + $ptitle + '</title>')
$pitch   = $chrome + "`n" + $pslides + "`n" + $script

# trechos compartilhados (src/partials): mapa competitivo e cronograma de 13 semanas
$cmap  = Read-U8 (Join-Path $src 'partials\cmap.html')
$weeks = Read-U8 (Join-Path $src 'partials\weeks.html')
$dot   = [string][char]0x00B7   # ponto médio; evita depender da codificação deste .ps1
$pitch = $pitch.Replace('@@CMAP@@', $cmap.Replace('@@CHAPTER@@', "01 $dot O desafio")).Replace('@@WEEKS@@', $weeks)
$full  = $full.Replace('@@CMAP@@', $cmap.Replace('@@CHAPTER@@', "02 $dot Mercado & canal")).Replace('@@WEEKS@@', $weeks)
foreach ($chk in @($pitch, $full)) { if ($chk.Contains('@@')) { throw 'marcador @@ sem substituição no build' } }

Write-U8 (Join-Path $root 'index.html') (New-Doc $phead $pitch)
Write-U8 (Join-Path $root 'completa\index.html') ((New-Doc $head $full) -replace '(src|href)="assets/', '$1="../assets/')
Write-U8 (Join-Path $root 'artifact\proposta.html') ($phead + "`n" + $pitch)
Write-U8 (Join-Path $root 'artifact\completa.html') ($head + "`n" + $full)

foreach ($f in 'index.html', 'completa\index.html', 'artifact\proposta.html', 'artifact\completa.html') {
  "{0,-24} {1,9:N0} bytes" -f $f, (Get-Item (Join-Path $root $f)).Length
}

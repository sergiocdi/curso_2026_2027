<#
.SYNOPSIS
    Convierte un documento HTML a PDF con maquetación para impresión usando Microsoft Edge o Google Chrome en modo headless.

.PARAMETER HtmlPath
    Ruta al archivo HTML de origen.

.PARAMETER PdfPath
    Ruta opcional para el PDF resultante. Si no se especifica, se genera en la misma carpeta con extensión .pdf.

.EXAMPLE
    .\html-to-pdf.ps1 -HtmlPath "01-Modulos/Acceso-a-Datos/06-Apuntes/AD-UD01-Flujos-Streams.html"
#>

[CmdletBinding()]
param (
    [Parameter(Mandatory = $true, Position = 0)]
    [string]$HtmlPath,

    [Parameter(Mandatory = $false, Position = 1)]
    [string]$PdfPath
)

# 1. Validar existencia del HTML
$resolvedHtml = Resolve-Path -Path $HtmlPath -ErrorAction SilentlyContinue
if (-not $resolvedHtml) {
    Write-Error "No se encontró el archivo HTML en la ruta: $HtmlPath"
    exit 1
}
$fullHtmlPath = $resolvedHtml.Path

# 2. Determinar ruta de salida PDF
if (-not $PdfPath) {
    $PdfPath = [System.IO.Path]::ChangeExtension($fullHtmlPath, ".pdf")
} else {
    $PdfPath = [System.IO.Path]::GetFullPath($PdfPath)
}

# 3. Detectar navegador Chromium (Edge o Chrome)
$browserCandidates = @(
    "C:\Program Files (x86)\Microsoft\Edge\Application\msedge.exe",
    "C:\Program Files\Microsoft\Edge\Application\msedge.exe",
    "C:\Program Files\Google\Chrome\Application\chrome.exe",
    "C:\Program Files (x86)\Google\Chrome\Application\chrome.exe"
)

$browserExe = $null
foreach ($path in $browserCandidates) {
    if (Test-Path $path) {
        $browserExe = $path
        break
    }
}

if (-not $browserExe) {
    # Probar si está en el PATH del sistema
    $edgeInPath = Get-Command "msedge" -ErrorAction SilentlyContinue
    $chromeInPath = Get-Command "chrome" -ErrorAction SilentlyContinue
    if ($edgeInPath) { $browserExe = $edgeInPath.Source }
    elseif ($chromeInPath) { $browserExe = $chromeInPath.Source }
}

if (-not $browserExe) {
    Write-Error "No se localizó Microsoft Edge ni Google Chrome para realizar la conversión headless."
    exit 1
}

# 4. Formatear URI del archivo HTML
$htmlUri = [System.Uri]::new($fullHtmlPath).AbsoluteUri

Write-Host "[*] Convirtiendo HTML a PDF..." -ForegroundColor Cyan
Write-Host "    Origen:  $fullHtmlPath"
Write-Host "    Destino: $PdfPath"
Write-Host "    Motor:   $browserExe"

# 5. Ejecutar conversión headless
$procArgs = "--headless --disable-gpu --no-pdf-header-footer --run-all-compositor-stages-before-draw --print-to-pdf=`"$PdfPath`" `"$htmlUri`""

$process = Start-Process -FilePath $browserExe -ArgumentList $procArgs -NoNewWindow -Wait -PassThru

# 6. Comprobar resultado
if (Test-Path $PdfPath) {
    $fileInfo = Get-Item $PdfPath
    $sizeKb = [math]::Round($fileInfo.Length / 1KB, 1)
    Write-Host "[+] PDF generado correctamente: $PdfPath ($sizeKb KB)" -ForegroundColor Green
    exit 0
} else {
    Write-Error "Error: El proceso finalizo pero no se genero el archivo PDF."
    exit 1
}

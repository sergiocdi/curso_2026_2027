<#
.SYNOPSIS
    Convierte una presentación interactiva HTML a PDF apaisado (16:9 / A4 Landscape)
    usando Microsoft Edge o Google Chrome en modo headless.

.PARAMETER HtmlPath
    Ruta al archivo HTML de la presentación.

.PARAMETER PdfPath
    Ruta opcional para el PDF resultante. Si se omite, se genera en la misma carpeta con extensión .pdf.

.EXAMPLE
    .\html-to-pdf.ps1 -HtmlPath "01-Modulos/Redes-Locales/07-Presentaciones/UT1/RL-UT1-Presentacion.html"
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

# 3. Detectar navegador Chromium
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
    $edgeInPath = Get-Command "msedge" -ErrorAction SilentlyContinue
    $chromeInPath = Get-Command "chrome" -ErrorAction SilentlyContinue
    if ($edgeInPath) { $browserExe = $edgeInPath.Source }
    elseif ($chromeInPath) { $browserExe = $chromeInPath.Source }
}

if (-not $browserExe) {
    Write-Error "No se localizó Microsoft Edge ni Google Chrome para la exportación."
    exit 1
}

# 4. Formatear URI del archivo HTML
$htmlUri = [System.Uri]::new($fullHtmlPath).AbsoluteUri

Write-Host "[*] Exportando presentación HTML a PDF apaisado..." -ForegroundColor Cyan
Write-Host "    Origen:  $fullHtmlPath"
Write-Host "    Destino: $PdfPath"
Write-Host "    Motor:   $browserExe"

# 5. Generar primero en archivo temporal para evitar bloqueos silenciosos
$tempPdf = [System.IO.Path]::Combine([System.IO.Path]::GetTempPath(), "agy_pres_" + [System.Guid]::NewGuid().ToString("N") + ".pdf")

# 6. Ejecutar conversión headless
$procArgs = "--headless --disable-gpu --no-pdf-header-footer --run-all-compositor-stages-before-draw --print-to-pdf=`"$tempPdf`" `"$htmlUri`""
$process = Start-Process -FilePath $browserExe -ArgumentList $procArgs -NoNewWindow -Wait -PassThru

# 7. Validar generación en temporal
if (-not (Test-Path $tempPdf)) {
    Write-Error "Error: El proceso finalizó pero no se generó el archivo temporal PDF."
    exit 1
}

# 8. Mover o copiar al destino final gestionando posibles bloqueos de visores (Acrobat, Edge)
$maxRetries = 3
$copied = $false
for ($i = 1; $i -le $maxRetries; $i++) {
    try {
        Move-Item -Path $tempPdf -Destination $PdfPath -Force -ErrorAction Stop
        $copied = $true
        break
    } catch {
        if ($i -lt $maxRetries) {
            Write-Warning "El archivo de destino parece bloqueado por un lector de PDF (ej. Adobe Acrobat). Reintentando ($i/$maxRetries)... Cierra el PDF si lo tienes abierto."
            Start-Sleep -Seconds 1
        }
    }
}

if (-not $copied) {
    Write-Warning "AVISO: No se pudo sobreescribir '$PdfPath' porque está bloqueado por otro proceso (visor PDF abierto)."
    Write-Warning "El nuevo PDF se ha guardado provisionalmente en: $tempPdf"
    Write-Host "Por favor cierra el archivo en Adobe Acrobat / navegador y vuelve a ejecutar o cópialo manualmente." -ForegroundColor Yellow
    exit 2
}

# 9. Comprobar resultado y páginas
$fileInfo = Get-Item $PdfPath
$sizeKb = [math]::Round($fileInfo.Length / 1KB, 1)
$pageCount = (Select-String -Path $PdfPath -Pattern '/Type\s*/Page\b' -AllMatches).Matches.Count
Write-Host "[+] Presentación PDF generada con éxito: $PdfPath ($sizeKb KB, $pageCount páginas)" -ForegroundColor Green
exit 0
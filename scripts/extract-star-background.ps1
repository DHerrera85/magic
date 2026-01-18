param(
    [string]$InputPath = "C:\Users\herre\OneDrive\Documentos\Magic Responsive-Gaming-Website-24-10\assets\images\magic-logo-color.jpg",
    [string]$OutputPath = "C:\Users\herre\OneDrive\Documentos\Magic Responsive-Gaming-Website-24-10\assets\images\star-background.jpg",
    [double]$CropLeftRatio = 0.30,   # Recorta 30% del ancho desde la izquierda (donde suele estar el logo)
    [double]$CropTopRatio = 0.00,    # Recorta desde arriba si el logo está alto
    [double]$CropRightRatio = 0.00,  # Recorta desde la derecha si fuera necesario
    [double]$CropBottomRatio = 0.00  # Recorta desde abajo si fuera necesario
)

# Verifica ruta de entrada
if (!(Test-Path -Path $InputPath)) {
    Write-Error "No se encontró la imagen de entrada: $InputPath";
    exit 1;
}

Add-Type -AssemblyName System.Drawing

try {
    $bmp = [System.Drawing.Bitmap]::new($InputPath)
    $width = [double]$bmp.Width
    $height = [double]$bmp.Height

    # Calcula el rectángulo de recorte basado en ratios
    $cropX = [int]([math]::Round($width * $CropLeftRatio))
    $cropY = [int]([math]::Round($height * $CropTopRatio))
    $cropW = [int]([math]::Round($width * (1.0 - $CropLeftRatio - $CropRightRatio)))
    $cropH = [int]([math]::Round($height * (1.0 - $CropTopRatio - $CropBottomRatio)))

    if ($cropW -le 0 -or $cropH -le 0) {
        Write-Error "Parámetros de recorte inválidos. Ajusta los ratios."
        exit 1
    }

    $rect = [System.Drawing.Rectangle]::new($cropX, $cropY, $cropW, $cropH)

    # Aplica recorte
    $cropped = $bmp.Clone($rect, $bmp.PixelFormat)

    # Opcional: ligera suavización para hacer la textura más homogénea
    # Crea un nuevo Bitmap y dibuja con alta calidad
    $outBmp = [System.Drawing.Bitmap]::new($cropped.Width, $cropped.Height)
    $g = [System.Drawing.Graphics]::FromImage($outBmp)
    $g.SmoothingMode = [System.Drawing.Drawing2D.SmoothingMode]::HighQuality
    $g.InterpolationMode = [System.Drawing.Drawing2D.InterpolationMode]::HighQualityBicubic
    $g.PixelOffsetMode = [System.Drawing.Drawing2D.PixelOffsetMode]::HighQuality
    $g.DrawImage($cropped, 0, 0, $cropped.Width, $cropped.Height)
    $g.Dispose()

    # Guarda salida
    $dir = [System.IO.Path]::GetDirectoryName($OutputPath)
    if (!(Test-Path -Path $dir)) { New-Item -ItemType Directory -Path $dir | Out-Null }
    $outBmp.Save($OutputPath, [System.Drawing.Imaging.ImageFormat]::Jpeg)

    $bmp.Dispose()
    $cropped.Dispose()
    $outBmp.Dispose()

    Write-Output "Fondo estrellado generado: $OutputPath"
} catch {
    Write-Error "Error procesando la imagen: $_"
    exit 1
}

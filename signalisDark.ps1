# TLS 1.2 for GitHub connection
[Net.ServicePointManager]::SecurityProtocol = [Net.SecurityProtocolType]::Tls12

# Configuration
$repoUrl = "https://raw.githubusercontent.com/reaperwatch/themes/main/signalis_orangeNblack.css"
$vencordDir = "$env:AppData\Vencord"
$themeDir = "$vencordDir\themes"
$fileName = "DarkNeon.themeMODIFIED.css"
$fullPath = "$themeDir\$fileName"

Write-Host "--- Dark Neon Theme Installer ---" -ForegroundColor Cyan

# Check if Vencord is installed
if (!(Test-Path $vencordDir)) {
    Write-Host " Error: Vencord directory not found at $vencordDir" -ForegroundColor Red
    return 
}

# Ensure themes folder exists
if (!(Test-Path $themeDir)) {
    New-Item -ItemType Directory -Path $themeDir -Force | Out-Null
}

# Download the theme
try {
    Write-Host "Downloading (or updating) Dark Neon..." -ForegroundColor Gray
    
    # Check if file exists and delete it first
    if (Test-Path $fullPath) {
        Remove-Item $fullPath -ErrorAction SilentlyContinue
    }

    # Download using -UseBasicParsing (Better compatibility for older PowerShell)
    Invoke-WebRequest -Uri $repoUrl -OutFile $fullPath -UseBasicParsing -ErrorAction Stop
    
    Write-Host " Successfully installed/updated!" -ForegroundColor Green
    Write-Host "Refresh Discord (Ctrl+R) to apply." -ForegroundColor Cyan
}
catch {
    Write-Host " Failed to download." -ForegroundColor Red
    Write-Host "Reason: $($_.Exception.Message)" -ForegroundColor Yellow
}

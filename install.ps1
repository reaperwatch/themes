[Net.ServicePointManager]::SecurityProtocol = [Net.SecurityProtocolType]::Tls12


$repoUrl = "https://raw.githubusercontent.com/reaperwatch/themes/main/DarkNeon.themeMODIFIED.css"
$vencordDir = "$env:AppData\Vencord"
$themeDir = "$vencordDir\themes"
$fileName = "DarkNeon.themeMODIFIED.css"

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
    Write-Host "Downloading from: $repoUrl" -ForegroundColor Gray
    Invoke-WebRequest -Uri $repoUrl -OutFile "$themeDir\$fileName" -Force -ErrorAction Stop
    Write-Host " Successfully installed/updated!" -ForegroundColor Green
    Write-Host "Refresh Discord (Ctrl+R) to apply." -ForegroundColor Cyan
}
catch {
    Write-Host " Failed to download." -ForegroundColor Red
    Write-Host "Reason: $($_.Exception.Message)" -ForegroundColor Yellow
}

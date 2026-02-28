# Configuration
$repoUrl = "https://raw.githubusercontent.com/reaperwatch/themes/main/DarkNeon.themeMODIFIED.css"
$vencordDir = "$env:AppData\Vencord"
$themeDir = "$vencordDir\themes"
$fileName = "DarkNeon.themeMODIFIED.css"

Write-Host "--- Dark Neon Theme Installer ---" -ForegroundColor Cyan


if (!(Test-Path $vencordDir)) {
    Write-Host "Error: Vencord directory not found at $vencordDir" -ForegroundColor Red
    Write-Host "Please install Vencord (https://vencord.dev) before running this script." -ForegroundColor Yellow
    return 
}


if (!(Test-Path $themeDir)) {
    Write-Host "Creating themes folder..." -ForegroundColor Gray
    New-Item -ItemType Directory -Path $themeDir | Out-Null
}


try {
    Write-Host "Downloading (or updating) Dark Neon..." -ForegroundColor Gray
    Invoke-WebRequest -Uri $repoUrl -OutFile "$themeDir\$fileName" -Force 
    Write-Host "Successfully installed/updated!" -ForegroundColor Green
    Write-Host "Refresh Discord (Ctrl+R) to apply changes." -ForegroundColor Cyan
}

catch {
    Write-Host "Error: Could not download the file. check your internet connection." -ForegroundColor Red
}

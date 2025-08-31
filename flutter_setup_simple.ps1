# Script simples para configurar Flutter
Write-Host "Configurando Flutter para Seedfy..." -ForegroundColor Green

# Verificar se Flutter existe
try {
    flutter --version
    Write-Host "Flutter ja instalado!" -ForegroundColor Green
} catch {
    Write-Host "Instalando Flutter..." -ForegroundColor Yellow
    
    # Criar diretorio
    $flutterPath = "C:\flutter"
    if (!(Test-Path $flutterPath)) {
        New-Item -ItemType Directory -Path $flutterPath -Force
    }
    
    # Baixar e extrair
    $url = "https://storage.googleapis.com/flutter_infra_release/releases/stable/windows/flutter_windows_3.24.3-stable.zip"
    $zip = "$env:TEMP\flutter.zip"
    
    Invoke-WebRequest -Uri $url -OutFile $zip
    Expand-Archive -Path $zip -DestinationPath "C:\" -Force
    
    # Configurar PATH
    $currentPath = [Environment]::GetEnvironmentVariable("PATH", "User")
    $newPath = "$currentPath;C:\flutter\bin"
    [Environment]::SetEnvironmentVariable("PATH", $newPath, "User")
    
    Write-Host "Flutter instalado! Reinicie o terminal." -ForegroundColor Green
}

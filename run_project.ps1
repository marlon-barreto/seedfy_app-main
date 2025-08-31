# Script para executar o projeto Seedfy no Windows
# Execute este script após instalar o Flutter

Write-Host "🌱 Seedfy - Iniciando projeto..." -ForegroundColor Green

# 1. Verificar se estamos no diretório correto
if (!(Test-Path "pubspec.yaml")) {
    Write-Host "❌ Arquivo pubspec.yaml não encontrado!" -ForegroundColor Red
    Write-Host "   Certifique-se de estar no diretório do projeto Seedfy" -ForegroundColor Yellow
    exit 1
}

# 2. Verificar se Flutter está instalado
try {
    $flutterVersion = flutter --version 2>$null
    if ($LASTEXITCODE -ne 0) {
        throw "Flutter não encontrado"
    }
    Write-Host "✅ Flutter encontrado!" -ForegroundColor Green
} catch {
    Write-Host "❌ Flutter não está instalado ou não está no PATH!" -ForegroundColor Red
    Write-Host "   Execute primeiro o script: setup_flutter.ps1" -ForegroundColor Yellow
    exit 1
}

# 3. Verificar dependências
Write-Host "📦 Verificando dependências..." -ForegroundColor Blue
flutter pub get

# 4. Executar diagnóstico
Write-Host "🩺 Verificando configuração do ambiente..." -ForegroundColor Blue
flutter doctor

# 5. Listar dispositivos disponíveis
Write-Host "📱 Dispositivos disponíveis:" -ForegroundColor Blue
flutter devices

# 6. Verificar se há dispositivos
$devices = flutter devices --machine | ConvertFrom-Json
if ($devices.Count -eq 0) {
    Write-Host "❌ Nenhum dispositivo encontrado!" -ForegroundColor Red
    Write-Host "   Opções:" -ForegroundColor Yellow
    Write-Host "   • Conecte um dispositivo Android via USB" -ForegroundColor White
    Write-Host "   • Inicie um emulador Android" -ForegroundColor White
    Write-Host "   • Execute: flutter run -d chrome (para web)" -ForegroundColor White
    Write-Host "   • Execute: flutter run -d windows (para Windows)" -ForegroundColor White
    
    $choice = Read-Host "Deseja executar no navegador Chrome? (s/n)"
    if ($choice -eq "s" -or $choice -eq "S") {
        Write-Host "🌐 Executando no Chrome..." -ForegroundColor Blue
        flutter run -d chrome
    } else {
        Write-Host "🖥️ Tentando executar no Windows..." -ForegroundColor Blue
        flutter run -d windows
    }
} else {
    Write-Host "🚀 Executando projeto..." -ForegroundColor Green
    flutter run
}

Write-Host ""
Write-Host "📝 Comandos úteis:" -ForegroundColor Yellow
Write-Host "   flutter run -d chrome    # Executar no navegador" -ForegroundColor White
Write-Host "   flutter run -d windows   # Executar no Windows" -ForegroundColor White
Write-Host "   flutter run --release    # Versão otimizada" -ForegroundColor White
Write-Host "   flutter clean            # Limpar cache" -ForegroundColor White
Write-Host "   flutter pub get          # Atualizar dependências" -ForegroundColor White

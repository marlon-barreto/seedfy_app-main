# Script de instalacao do Flutter para Windows
# Execute este script como Administrador

Write-Host "Configurando ambiente Flutter para o projeto Seedfy..." -ForegroundColor Green

# 1. Verificar se o Flutter ja esta instalado
try {
    $flutterVersion = flutter --version 2>$null
    if ($LASTEXITCODE -eq 0) {
        Write-Host "Flutter ja esta instalado!" -ForegroundColor Green
        flutter --version
        exit 0
    }
} catch {
    Write-Host "Flutter nao encontrado. Iniciando instalacao..." -ForegroundColor Yellow
}

# 2. Criar diretório para Flutter
$flutterPath = "C:\flutter"
if (!(Test-Path $flutterPath)) {
    Write-Host "📁 Criando diretório $flutterPath..." -ForegroundColor Blue
    New-Item -ItemType Directory -Path $flutterPath -Force
}

# 3. Baixar Flutter
Write-Host "⬇️ Baixando Flutter SDK..." -ForegroundColor Blue
$flutterUrl = "https://storage.googleapis.com/flutter_infra_release/releases/stable/windows/flutter_windows_3.24.3-stable.zip"
$zipPath = "$env:TEMP\flutter.zip"

try {
    Invoke-WebRequest -Uri $flutterUrl -OutFile $zipPath
    Write-Host "✅ Download concluído!" -ForegroundColor Green
} catch {
    Write-Host "❌ Erro no download: $($_.Exception.Message)" -ForegroundColor Red
    exit 1
}

# 4. Extrair Flutter
Write-Host "📦 Extraindo Flutter..." -ForegroundColor Blue
try {
    Expand-Archive -Path $zipPath -DestinationPath "C:\" -Force
    Write-Host "✅ Extração concluída!" -ForegroundColor Green
} catch {
    Write-Host "❌ Erro na extração: $($_.Exception.Message)" -ForegroundColor Red
    exit 1
}

# 5. Adicionar ao PATH do sistema
Write-Host "🔧 Configurando PATH do sistema..." -ForegroundColor Blue
$currentPath = [Environment]::GetEnvironmentVariable("PATH", "Machine")
$flutterBinPath = "C:\flutter\bin"

if ($currentPath -notlike "*$flutterBinPath*") {
    $newPath = "$currentPath;$flutterBinPath"
    [Environment]::SetEnvironmentVariable("PATH", $newPath, "Machine")
    Write-Host "✅ PATH configurado!" -ForegroundColor Green
} else {
    Write-Host "✅ Flutter já está no PATH!" -ForegroundColor Green
}

# 6. Atualizar PATH da sessão atual
$env:PATH += ";C:\flutter\bin"

# 7. Verificar instalação
Write-Host "🔍 Verificando instalação..." -ForegroundColor Blue
try {
    flutter --version
    Write-Host "✅ Flutter instalado com sucesso!" -ForegroundColor Green
} catch {
    Write-Host "❌ Erro na verificação. Reinicie o terminal e tente novamente." -ForegroundColor Red
}

# 8. Executar flutter doctor
Write-Host "🩺 Executando diagnóstico do Flutter..." -ForegroundColor Blue
flutter doctor

Write-Host ""
Write-Host "🎉 Instalação concluída!" -ForegroundColor Green
Write-Host "📝 Próximos passos:" -ForegroundColor Yellow
Write-Host "   1. Reinicie o PowerShell/CMD" -ForegroundColor White
Write-Host "   2. Execute: flutter doctor" -ForegroundColor White
Write-Host "   3. Instale o Android Studio se necessário" -ForegroundColor White
Write-Host "   4. Execute: flutter pub get" -ForegroundColor White
Write-Host "   5. Execute: flutter run" -ForegroundColor White

# Limpar arquivo temporário
Remove-Item $zipPath -ErrorAction SilentlyContinue

# 🌱 Seedfy - Guia de Execução no Windows

## 📋 Pré-requisitos

### 1. **Git** (já instalado ✅)
```bash
git --version  # Confirme que está instalado
```

### 2. **Flutter SDK**
Se ainda não tiver o Flutter instalado:

#### Opção A: Script Automático (Recomendado)
```powershell
# Execute como Administrador
Set-ExecutionPolicy -ExecutionPolicy RemoteSigned -Scope CurrentUser
.\setup_flutter.ps1
```

#### Opção B: Instalação Manual
1. Baixe o Flutter: https://docs.flutter.dev/get-started/install/windows
2. Extraia para `C:\flutter`
3. Adicione `C:\flutter\bin` ao PATH do sistema
4. Reinicie o terminal

### 3. **Android Studio** (Opcional para emulador)
- Download: https://developer.android.com/studio
- Configure um emulador Android após a instalação

### 4. **Visual Studio** (Para Windows desktop)
- Visual Studio 2022 com workload "Desktop development with C++"

## 🚀 Executando o Projeto

### Método Rápido
```powershell
# Execute no diretório do projeto
.\run_project.ps1
```

### Método Manual

1. **Instalar dependências**
```bash
flutter pub get
```

2. **Verificar ambiente**
```bash
flutter doctor
```

3. **Ver dispositivos disponíveis**
```bash
flutter devices
```

4. **Executar o projeto**

#### Para Web (Chrome)
```bash
flutter run -d chrome
```

#### Para Windows Desktop
```bash
flutter run -d windows
```

#### Para Android (emulador ou dispositivo)
```bash
flutter run
```

## 🔧 Configuração de Serviços

### Firebase (Necessário para IA)
1. O projeto já tem configuração Firebase
2. Verifique se `firebase_options.dart` existe
3. Para produção, configure suas próprias chaves

### Supabase (Backend)
1. Edite `lib/core/app_config.dart`
2. Substitua:
   ```dart
   static const String supabaseUrl = 'SUA_URL_SUPABASE';
   static const String supabaseAnonKey = 'SUA_CHAVE_SUPABASE';
   ```

### NVIDIA AI (Funcionalidades de IA)
1. O projeto usa chave de desenvolvimento
2. Para produção, obtenha sua chave em: https://build.nvidia.com/

## 📱 Plataformas Suportadas

| Plataforma | Status | Comando |
|------------|---------|---------|
| 🌐 Web | ✅ Completo | `flutter run -d chrome` |
| 🖥️ Windows | ✅ Completo | `flutter run -d windows` |
| 📱 Android | ✅ Completo | `flutter run` |
| 🍎 iOS | ⚠️ Requer macOS | N/A |

## 🛠️ Comandos Úteis

```bash
# Limpar cache do projeto
flutter clean && flutter pub get

# Executar versão otimizada
flutter run --release

# Build para produção
flutter build windows
flutter build web
flutter build apk

# Verificar problemas
flutter doctor -v

# Atualizar Flutter
flutter upgrade

# Ver logs detalhados
flutter run -v
```

## 🐛 Solução de Problemas

### "flutter não é reconhecido"
```powershell
# Verifique se está no PATH
$env:PATH -split ';' | Where-Object { $_ -like '*flutter*' }

# Adicione temporariamente
$env:PATH += ";C:\flutter\bin"
```

### "No devices found"
- **Web**: Instale o Chrome
- **Windows**: Instale Visual Studio 2022
- **Android**: Configure Android Studio + emulador

### Erro de permissões
```powershell
# Execute como Administrador
Set-ExecutionPolicy -ExecutionPolicy RemoteSigned -Scope CurrentUser
```

### Problemas com dependências
```bash
flutter clean
flutter pub cache repair
flutter pub get
```

## 🌟 Funcionalidades do Seedfy

- 🤖 **IA para Plantas**: Reconhecimento via câmera (NVIDIA NIM)
- 💬 **Chat IA**: Assistente de jardinagem
- 🗺️ **Mapa Interativo**: Planejamento de cultivos
- 📋 **Gestão de Tarefas**: Automatização de atividades
- 🎯 **Onboarding**: Configuração guiada
- 🌐 **Multilíngue**: Português e Inglês

## 📞 Suporte

Se encontrar problemas:
1. Execute `flutter doctor -v`
2. Verifique os logs em `flutter run -v`
3. Consulte a documentação oficial: https://docs.flutter.dev/

---

**🚀 Boa sorte com seu projeto Seedfy! 🌱**

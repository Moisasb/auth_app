# Auth App — Autenticação com Firebase

Aplicativo mobile desenvolvido com Flutter para praticar os fluxos de cadastro e login de usuários utilizando Firebase Authentication.

## Objetivo

Implementar uma camada de autenticação em uma aplicação Flutter, separando as chamadas ao Firebase das telas responsáveis pela interação com o usuário.

## Funcionalidades identificadas

- Inicialização do Firebase conforme a plataforma.
- Cadastro de usuário com e-mail e senha.
- Login com e-mail e senha.
- Serviço dedicado para centralizar as operações de autenticação.
- Telas separadas para login, cadastro e área inicial.

## Organização principal

```text
lib/
├── main.dart
├── firebase_options.dart
├── services/
│   └── auth_service.dart
└── widgets/
    ├── auth_text_field.dart
    └── screen/
        ├── cadastro_screen.dart
        ├── home_screen.dart
        └── login_screen.dart
```

## Tecnologias

- Dart
- Flutter
- Firebase Core
- Firebase Authentication
- Material Design 3

## Configuração necessária

O projeto depende de um projeto Firebase configurado para as plataformas desejadas. As opções de inicialização são fornecidas por `firebase_options.dart`.

Antes de executar:

1. Configure um projeto no Firebase Console.
2. Habilite o método de autenticação por e-mail e senha.
3. Gere ou atualize a configuração FlutterFire para suas plataformas.
4. Instale as dependências e execute o aplicativo.

## Como executar

```bash
flutter pub get
flutter run
```

## Segurança

A autenticação é delegada ao Firebase Authentication. Não armazene senhas em texto puro nem inclua arquivos ou credenciais privadas no repositório.

## Aprendizados

O projeto trabalha autenticação gerenciada por serviço externo, integração Firebase, organização de serviços e separação entre interface e lógica de autenticação.

## Repositório

[github.com/Moisasb/auth_app](https://github.com/Moisasb/auth_app)

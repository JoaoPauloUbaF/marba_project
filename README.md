
# Marba Project

Este repositório contém o código-fonte da branch `main` do **Marba Project**, um projeto voltado para a gestão de ofertas locais utilizando ferramentas modernas para desenvolvimento mobile.

## 📋 Índice

- [Visão Geral](#visão-geral)
- [Funcionalidades](#funcionalidades)
- [Tecnologias Utilizadas](#tecnologias-utilizadas)
- [Pré-requisitos](#pré-requisitos)
- [Como Rodar o Projeto](#como-rodar-o-projeto)
- [Estrutura do Projeto](#estrutura-do-projeto)
- [Contribuição](#contribuição)
- [Licença](#licença)

---

## Visão Geral

O **Marba Project** é uma solução completa que visa facilitar o gerenciamento de ofertas locais, proporcionando uma interface amigável e um backend na nuvem. Ele foi desenvolvido utilizando **Flutter** com **Riverpod** para state management.

---

## Funcionalidades

- **Gerenciamento de Ofertas**: Criação, edição e exclusão de ofertas.
- **Integração Firebase**: Gerenciamento de dados em tempo real.
- **Arquitetura Modularizada**: Estrutura baseada em recursos (feature first).
- **Design Responsivo**: Interface otimizada para diferentes tamanhos de tela.

---

## Tecnologias Utilizadas

- **Flutter**: Framework para desenvolvimento mobile multiplataforma.
- **Riverpod**: Gerenciamento de estado.
- **Firebase**: Backend-as-a-Service.
- **Dart**: Linguagem principal do Flutter.

---

## Pré-requisitos

Antes de começar, certifique-se de ter o seguinte instalado:

- [Flutter SDK](https://docs.flutter.dev/get-started/install)
- [Dart SDK](https://dart.dev/get-dart)
- [Firebase CLI](https://firebase.google.com/docs/cli)

---

## Como Rodar o Projeto

1. Clone o repositório:

   ```bash
   git clone https://github.com/JoaoPauloUbaF/marba_project.git
   cd marba_project
   git checkout developer
   ```

2. Instale as dependências:

   ```bash
   flutter pub get
   ```

3. Configure o Firebase:

   - Crie um projeto no Firebase.
   - Baixe o arquivo `google-services.json` (Android) ou `GoogleService-Info.plist` (iOS) e adicione à pasta correspondente.

4. Execute o projeto:

   ```bash
   flutter run
   ```

---

## Estrutura do Projeto

O projeto segue uma estrutura baseada em **feature first**:

```
lib/
└── src/
    └── features/
        └── offers_management/
            ├── view/
            │   ├── widgets/
            │   └── views/
            ├── model/
            │   └── offers_model.dart
            └── view_model/
                └── offers_view_model.dart
```

---

## Contribuição

Contribuições são bem-vindas! Para contribuir:

1. Faça um fork do projeto.
2. Crie uma nova branch:

   ```bash
   git checkout -b feature/nova-funcionalidade
   ```

3. Commit suas mudanças:

   ```bash
   git commit -m "Adiciona nova funcionalidade"
   ```

4. Faça um push para sua branch:

   ```bash
   git push origin feature/nova-funcionalidade
   ```

5. Abra um Pull Request.

---

## Licença

Este projeto está licenciado sob a licença MIT. Consulte o arquivo [LICENSE](LICENSE) para mais informações.

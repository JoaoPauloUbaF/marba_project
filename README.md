<div align="center">
  <img src="https://github.com/user-attachments/assets/23bdb491-b0f5-4e1d-a0f0-497aebd69b1e" alt="logo" width="400">
</div>
## Marba Project (Onktem)

Este repositório contém o código-fonte da branch `main` do **Marba Project (Onktem) **, um projeto voltado para a gestão de ofertas locais de produtos e serviços.

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

O **Marba Project (Onktem) ** é uma solução completa que visa facilitar o gerenciamento de ofertas locais, proporcionando uma interface amigável e um backend na nuvem. Ele foi desenvolvido utilizando **Flutter** com **Riverpod** para state management.

Esta aplicação foi desenvolvida para conectar usuários a ofertas e serviços locais, ao mesmo tempo em que permite que vendedores, comerciantes e prestadores de serviços gerenciem suas lojas e ofertas dentro da aplicação.

**Cheque a Demo!**
(https://joaopauloubaf.github.io/Onktem-demo/#/home)
   - Há algumas ofertas disponíveis em qualquer endereço em Lavras, Minas Gerais, Brasil. Para isso recomendo utilizar o endereço: R. Carlota Kemper, 728 - Dos Ipês.
   - Para ter a experiência de empreendedor, acesse a conta:
      - testuser2@gmail.com
      - password: 123456


---

## Screenshots
![Simulator Screenshot - iPhone 15 Pro Max - 2024-12-04 at 10 59 57](https://github.com/user-attachments/assets/5922388f-d9c7-4dc2-9d58-70373e832685)
![Simulator Screenshot - iPhone 15 Pro Max - 2024-12-04 at 11 04 51](https://github.com/user-attachments/assets/5cdbb65e-89f8-4d15-b820-a7ca50c6b4b8)
![Simulator Screenshot - iPhone 15 Pro Max - 2024-12-04 at 11 05 00](https://github.com/user-attachments/assets/c6f891f7-8568-4d5f-b00d-2a638aa61213)
![Simulator Screenshot - iPhone 15 Pro Max - 2024-12-04 at 11 03 45](https://github.com/user-attachments/assets/1733fb7a-3ed7-4c16-8d1a-22648ac2ef4d)
![Simulator Screenshot - iPhone 15 Pro Max - 2024-12-04 at 11 03 53](https://github.com/user-attachments/assets/457a1a16-7b55-4653-8475-fb8dae3aad4d)
![Simulator Screenshot - iPhone 15 Pro Max - 2024-12-04 at 11 04 24](https://github.com/user-attachments/assets/81e8a3f0-cb84-4145-ad83-71d90e52660c)

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
- [FlutterFire](https://firebase.flutter.dev/)

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

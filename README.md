<div align="center">
  <img src="https://github.com/user-attachments/assets/23bdb491-b0f5-4e1d-a0f0-497aebd69b1e" alt="logo" width="300">
</div>

## Marba Project (Onktem)

This repository contains the source code for the **Marba Project (Onktem)** `main` branch, a project aimed at managing local product and service offers.

---

## 📋 Table of Contents

- [Overview](#overview)
- [Features](#features)
- [Technologies Used](#technologies-used)
- [Prerequisites](#prerequisites)
- [How to Run the Project](#how-to-run-the-project)
- [Project Structure](#project-structure)
- [Contribution](#contribution)
- [License](#license)
- [PT-BR](#marba-project-onktem-1)

---

## Overview

The **Marba Project (Onktem)** is a complete solution designed to facilitate local offer management, providing a user-friendly interface and a cloud-based backend. It was developed using **Flutter** with **Riverpod** for state management.

This application connects users with local offers and services while enabling sellers, merchants, and service providers to manage their stores and offers within the app.

**Check the Demo!**  
(https://joaopauloubaf.github.io/Onktem-demo/#/home)
   - There are a few offers available for any address in Lavras, Minas Gerais, Brazil. I recommend using this address: R. Carlota Kemper, 728 - Dos Ipês.
   - For the entrepreneur experience, log in with:
      - testuser2@gmail.com
      - password: 123456

---

## Screenshots
![Simulator Screenshot - iPhone 15 Pro Max - 2024-12-04 at 10 59 57 (1)](https://github.com/user-attachments/assets/a5d32386-a70f-4c57-83b9-ac6a6488e702)
![Simulator Screenshot - iPhone 15 Pro Max - 2024-12-04 at 11 04 51](https://github.com/user-attachments/assets/5cdbb65e-89f8-4d15-b820-a7ca50c6b4b8)
![Simulator Screenshot - iPhone 15 Pro Max - 2024-12-04 at 11 05 00](https://github.com/user-attachments/assets/c6f891f7-8568-4d5f-b00d-2a638aa61213)
![Simulator Screenshot - iPhone 15 Pro Max - 2024-12-04 at 11 03 45](https://github.com/user-attachments/assets/1733fb7a-3ed7-4c16-8d1a-22648ac2ef4d)
![Simulator Screenshot - iPhone 15 Pro Max - 2024-12-04 at 11 03 53](https://github.com/user-attachments/assets/457a1a16-7b55-4653-8475-fb8dae3aad4d)
![Simulator Screenshot - iPhone 15 Pro Max - 2024-12-04 at 11 04 24](https://github.com/user-attachments/assets/81e8a3f0-cb84-4145-ad83-71d90e52660c)

---

## Features

- **Offer Management**: Create, edit, and delete offers.
- **Firebase Integration**: Real-time data management.
- **Modular Architecture**: Feature-first structure.
- **Responsive Design**: Optimized for different screen sizes.

- [ ] Fix image upload on the web demo (coming soon)
- [ ] Multi-language support (ongoing(kinda lazy about this(next app definitely going with intl from the start)))

---

## Technologies Used

- **Flutter**: Cross-platform mobile development framework.
- **Riverpod**: State management.
- **Firebase**: Backend-as-a-Service.
- **Dart**: Flutter's primary programming language.

---

## Prerequisites

Before getting started, ensure you have the following installed:

- [Flutter SDK](https://docs.flutter.dev/get-started/install)
- [Dart SDK](https://dart.dev/get-dart)
- [FlutterFire](https://firebase.flutter.dev/)

---

## How to Run the Project

1. Clone the repository:

   ```bash
   git clone https://github.com/JoaoPauloUbaF/marba_project.git
   cd marba_project
   git checkout developer
   ```

2. Install dependencies:

   ```bash
   flutter pub get
   ```

3. Configure Firebase:

   - Create a project in Firebase.
   - Download the `google-services.json` file (Android) or `GoogleService-Info.plist` file (iOS) and add it to the corresponding folder.

4. Run the project:

   ```bash
   flutter run
   ```

---

## Project Structure

The project follows a **feature-first** structure:

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

## Contribution

Contributions are welcome! To contribute:

1. Fork the project.
2. Create a new branch:

   ```bash
   git checkout -b feature/new-feature
   ```

3. Commit your changes:

   ```bash
   git commit -m "Add new feature"
   ```

4. Push to your branch:

   ```bash
   git push origin feature/new-feature
   ```

5. Open a Pull Request.

---

## License

This project is licensed under the MIT License. See the [LICENSE](LICENSE) file for more information.

---

## Marba Project (Onktem)

Este repositório contém o código-fonte da branch `main` do **Marba Project (Onktem)**, um projeto voltado para a gestão de ofertas locais de produtos e serviços.

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
![Simulator Screenshot - iPhone 15 Pro Max - 2024-12-04 at 10 59 57 (1)](https://github.com/user-attachments/assets/a5d32386-a70f-4c57-83b9-ac6a6488e702)
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
- 

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

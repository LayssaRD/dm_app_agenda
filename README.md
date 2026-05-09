# 📅 App Agenda

Aplicativo de agenda de tarefas desenvolvido em **Flutter** como projeto acadêmico da disciplina de **Desenvolvimento Mobile**. O foco principal é a implementação de **drag and drop** para reordenação de tarefas em lista.

---

## 👥 Alunos

| Nome |
|------|
| Bruno Moura Mathias Fernandes Simão |
| Davi Pechebelski Garcez |
| Layssa Rodrigues Alves |
| Luiz Henrique Altissimo |

---

## ✨ Funcionalidades

- ✅ Listagem de tarefas com horário
- ☑️ Marcar/desmarcar tarefa como concluída (com risco no texto)
- 🔃 Reordenação por **drag and drop**
- ➕ Adicionar nova tarefa via botão flutuante
- 📆 Exibição da data atual no rodapé

---

## 🚀 Tecnologias

- [Flutter](https://flutter.dev/) — SDK multiplataforma
- [Dart](https://dart.dev/) — Linguagem de programação
- [`intl`](https://pub.dev/packages/intl) `^0.20.2` — Formatação de datas

---

## 📁 Estrutura do Projeto

```
dm_app_agenda/
├── lib/
│   ├── main.dart              # Ponto de entrada e widget principal
│   ├── model/
│   │   └── tarefa.dart        # Modelo de dados da tarefa
│   └── mock/
│       └── tarefas_mock.dart  # Dados de exemplo
└── pubspec.yaml
```

---

## ⚙️ Pré-requisitos

- [Flutter SDK](https://docs.flutter.dev/get-started/install) (Dart `^3.11.4`)
- [Git](https://git-scm.com/)

Verifique sua instalação:

```bash
flutter doctor
```

---

## 🛠️ Como rodar

```bash
# 1. Clone o repositório
git clone https://github.com/brunomouramathias/dm_app_agenda.git

# 2. Acesse a pasta
cd dm_app_agenda

# 3. Instale as dependências
flutter pub get

# 4. Execute o app
flutter run
```

Para rodar na web:

```bash
flutter run -d chrome
```

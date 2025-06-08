# 📚 Book Tracker

[![Flutter Version](https://img.shields.io/badge/Flutter-v3.32.2-blue?logo=flutter\&logoColor=white)](https://flutter.dev)
[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](LICENSE)

## 🎯 Project Overview

Book Tracker is a clean, intuitive Flutter application designed to help users catalog and monitor their personal reading list. With a minimalistic interface and efficient data storage using SQLite, users can:

* Add new books with detailed metadata (title, author, description, total pages).
* Track current reading progress and remaining pages.
* Save personal notes per book.
* View a summary list with custom cards.

## ⚙️ Key Features

* **Add / Edit / Remove Books:** Seamless CRUD operations backed by `sqflite`.
* **Progress Tracking:** Visualize reading progress in real-time.
* **Responsive Design:** Follows Material guidelines and adapts to dark mode.
* **Modular Architecture:** Clear separation of models, services, screens, and widgets.

## 🛠️ Getting Started

### Prerequisites

* [Flutter SDK](https://flutter.dev/docs/get-started/install) v3.32.2 or higher
* Android Studio or VS Code with Flutter & Dart plugins
* A connected device or emulator

### Installation

1. **Clone the repository**

   ```bash
   git clone https://github.com/bektas-sari/book_tracker.git
   cd book_tracker
   ```
2. **Install dependencies**

   ```bash
   flutter pub get
   ```
3. **Run the app**

   ```bash
   flutter run
   ```

## 🗂️ Project Structure

```
lib/
├── main.dart             # App entrypoint & ThemeData setup
├── models/
│   └── book.dart         # Book data model
├── services/
│   └── database_helper.dart  # SQLite helper class
├── screens/
│   ├── home_screen.dart
│   ├── add_book_screen.dart
│   └── book_detail_screen.dart
└── widgets/
    └── book_card.dart    # Reusable book card widget
```

## 🤝 Contributing

Contributions are welcome! Please follow these steps:

1. Fork the repository
2. Create a feature branch (`git checkout -b feature/YourFeature`)
3. Commit your changes (`git commit -m "Add YourFeature"`)
4. Push to the branch (`git push origin feature/YourFeature`)
5. Open a Pull Request

## 📄 License

This project is licensed under the MIT License. See [LICENSE](LICENSE) for details.

## 👤 Developer

**Bektas Sari**
Email: [bektas.sari@gmail.com](mailto:bektas.sari@gmail.com)
GitHub: [https://github.com/bektas-sari](https://github.com/bektas-sari)
LinkedIn: [https://www.linkedin.com/in/bektas-sari](https://www.linkedin.com/in/bektas-sari)
ResearchGate: [https://www.researchgate.net/profile/Bektas-Sari-3](https://www.researchgate.net/profile/Bektas-Sari-3)
Academia: [https://independent.academia.edu/bektassari](https://independent.academia.edu/bektassari)

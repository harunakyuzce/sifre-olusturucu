🔐 Dart Password Manager CLI

A lightweight command-line password manager built with Dart.
It generates secure random passwords and stores credentials locally using a JSON-based structure.

⚙️ Features
🔐 Cryptographically secure password generation (Random.secure)
🧠 Title + username based credential system
💾 Local JSON file storage
♻️ Duplicate username handling (auto update)
📂 Simple CLI interface (no external dependencies)
🚀 How it works
User enters a title (e.g. Gmail, GitHub)
Adds a username
System generates a secure password automatically
Data is stored in passwords.json
▶️ Run the project
dart run main.dart
🧭 Menu
1 - Create new password entry
2 - View saved entries
0 - Exit
🧱 Data Structure
{
  "gmail": [
    {
      "username": "harun",
      "password": "A9x!P-3kL@z-9mQ#T"
    }
  ]
}
🛠 Tech Stack
Dart
CLI (Command Line Interface)
JSON-based local storage
📌 Notes
This project is for learning purposes
No encryption is implemented yet (future improvement: AES encryption + master password system)
🔮 Future Improvements
🔐 AES encrypted storage
📱 Flutter UI version
🔑 Master password authentication
☁️ Cloud sync support
👨‍💻 Author

Built as a learning project to practice secure password generation, data structures, and local storage handling in Dart.

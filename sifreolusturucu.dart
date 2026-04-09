import 'dart:io';
import 'dart:math';
import 'dart:convert';

const String fileName = 'passwords.json';

String generatePassword({int groups = 4, int lengthPerGroup = 5}) {
  const chars =
      'ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789!@#\$%^&*';

  final random = Random.secure();
  List<String> parts = [];

  for (int i = 0; i < groups; i++) {
    String part = '';
    for (int j = 0; j < lengthPerGroup; j++) {
      part += chars[random.nextInt(chars.length)];
    }
    parts.add(part);
  }

  return parts.join('-');
}

Map<String, dynamic> readData() {
  final file = File(fileName);

  if (!file.existsSync()) {
    return {};
  }

  final content = file.readAsStringSync();
  return jsonDecode(content);
}

void writeData(Map<String, dynamic> data) {
  final file = File(fileName);
  file.writeAsStringSync(jsonEncode(data, toEncodable: (e) => e));
}

void addEntry() {
  stdout.write("Başlık gir: ");
  String title = stdin.readLineSync() ?? '';

  stdout.write("Kullanıcı adı gir: ");
  String username = stdin.readLineSync() ?? '';

  String password = generatePassword();

  Map<String, dynamic> data = readData();


  data.putIfAbsent(title, () => []);

  List entries = data[title];

 
  int index = entries.indexWhere((e) => e["username"] == username);

  if (index != -1) {
    // Güncelle
    entries[index] = {
      "username": username,
      "password": password,
    };
    print("\n♻️ Aynı kullanıcı bulundu, güncellendi!");
  } else {
    // Yeni ekle
    entries.add({
      "username": username,
      "password": password,
    });
    print("\n✅ Yeni kayıt eklendi!");
  }

  writeData(data);

  print("🔐 Şifre: $password");
}

void showEntry() {
  stdout.write("Başlık gir: ");
  String title = stdin.readLineSync() ?? '';

  Map<String, dynamic> data = readData();

  if (!data.containsKey(title)) {
    print("❌ Kayıt bulunamadı!");
    return;
  }

  List entries = data[title];

  print("\n📌 Başlık: $title");

  for (var e in entries) {
    print("-------------------");
    print("👤 Kullanıcı Adı: ${e["username"]}");
    print("🔐 Şifre: ${e["password"]}");
  }
}

void main() {
  while (true) {
    print("\n=== Şifre Yöneticisi ===");
    print("1 - Yeni şifre oluştur");
    print("2 - Şifre görüntüle");
    print("0 - Çıkış");

    stdout.write("Seçim: ");
    String choice = stdin.readLineSync() ?? '';

    if (choice == '1') {
      addEntry();
    } else if (choice == '2') {
      showEntry();
    } else if (choice == '0') {
      print("Çıkılıyor...");
      break;
    } else {
      print("❌ Geçersiz seçim!");
    }
  }
}

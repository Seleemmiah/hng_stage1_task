import 'package:flutter/material.dart';
import 'encryption.dart';

class EncryptionScreen extends StatefulWidget {
  @override
  _EncryptionScreenState createState() => _EncryptionScreenState();
}

class _EncryptionScreenState extends State<EncryptionScreen> {
  // the method for the text and the key
  TextEditingController textController = TextEditingController();
  TextEditingController keyController = TextEditingController();

  String encryptedText = "";
  String decryptedText = "";

  void encryptText() {
    if (textController.text.isEmpty || keyController.text.isEmpty) return;
    var encryptor = CustomEncryptor(keyController.text);
    setState(() {
      encryptedText = encryptor.encrypt(textController.text);
      decryptedText = ""; // Reset decrypted text
    });
  }

  void decryptText() {
    if (encryptedText.isEmpty || keyController.text.isEmpty) return;
    var encryptor = CustomEncryptor(keyController.text);
    setState(() {
      decryptedText = encryptor.decrypt(encryptedText);
    });
  }

  void resetFields() {
    setState(() {
      textController.clear();
      keyController.clear();
      encryptedText = "";
      decryptedText = "";
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Encryption & Decryption")),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Center(
          child: Column(
            children: [
              Center(
                child: TextField(
                  controller: textController,
                  decoration: InputDecoration(labelText: "Enter Text"),
                ),
              ),
              SizedBox(height: 10),
              TextField(
                controller: keyController,
                decoration: InputDecoration(labelText: "Enter Secret Key"),
                obscureText: true, // Hide key for security
              ),
              SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton(
                      onPressed: encryptText, child: Text("Encrypt")),
                  ElevatedButton(
                      onPressed: decryptText, child: Text("Decrypt")),
                  ElevatedButton(
                    onPressed: resetFields,
                    child: Text("Reset"),
                    // style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
                  ),
                ],
              ),
              SizedBox(height: 20),
              Text("Encrypted: $encryptedText", style: TextStyle(fontSize: 16)),
              SizedBox(height: 10),
              Text("Decrypted: $decryptedText", style: TextStyle(fontSize: 16)),
            ],
          ),
        ),
      ),
    );
  }
}

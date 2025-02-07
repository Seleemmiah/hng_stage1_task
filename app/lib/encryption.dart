class CustomEncryptor {
  final String secretKey; // The key used for encryption and decryption

  CustomEncryptor(this.secretKey);

  // Encryption function
  String encrypt(String text) {
    return String.fromCharCodes(
      text.runes.map((char) =>
          char + secretKey.length), // Shift each character by key length
    );
  }

  // Decryption function
  String decrypt(String encryptedText) {
    return String.fromCharCodes(
      encryptedText.runes
          .map((char) => char - secretKey.length), // Reverse the shift
    );
  }
}

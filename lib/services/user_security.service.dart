import 'package:encrypt/encrypt.dart';

class UserSecurityService {
  final String clave_secreta = 'hola';

  String encriptar(String plainText){
    final key = Key.fromUtf8(clave_secreta.padRight(32, '0')); // AES-256 necesita 32 bytes
    final iv = IV.fromLength(16);

    final encriptor = Encrypter(AES(key, mode: AESMode.cbc));
    final encriptado = encriptor.encrypt(plainText, iv: iv);

    return encriptado.base64;
  }
//   void main() {
//   final claveSecreta = "miClaveSecreta123"; // ¡Debe ser la misma en Python!
//   final textoOriginal = "clave_super_secreta_123";
  
//   final textoCifrado = encryptAES(textoOriginal, claveSecreta);
//   print("Texto cifrado: $textoCifrado");
  
//   // Enviar `textoCifrado` a tu API Python via HTTP
// }
}
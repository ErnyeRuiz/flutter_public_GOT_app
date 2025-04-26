import 'dart:convert';

Usuario usuarioFromJson(String str) => Usuario.fromJson(json.decode(str));

String usuarioToJson(Usuario data) => json.encode(data.toJson());

class Usuario {
    int usuarioid;
    String nombre;
    String apellidos;
    String cedula;
    String telefono;
    DateTime fechanacimiento;
    DateTime fecharegistro;
    String contrasena;
    String correo;

    Usuario({
        required this.usuarioid,
        required this.nombre,
        required this.apellidos,
        required this.cedula,
        required this.telefono,
        required this.fechanacimiento,
        required this.fecharegistro,
        required this.contrasena,
        required this.correo,
    });

    factory Usuario.fromJson(Map<String, dynamic> json) => Usuario(
        usuarioid: json["usuarioid"],
        nombre: json["nombre"],
        apellidos: json["apellidos"],
        cedula: json["cedula"],
        telefono: json["telefono"],
        fechanacimiento: DateTime.parse(json["fechanacimiento"]),
        fecharegistro: DateTime.parse(json["fecharegistro"]),
        contrasena: json["contrasena"],
        correo: json["correo"],
    );

    Map<String, dynamic> toJson() => {
        "usuarioid": usuarioid,
        "nombre": nombre,
        "apellidos": apellidos,
        "cedula": cedula,
        "telefono": telefono,
        "fechanacimiento": "${fechanacimiento.year.toString().padLeft(4, '0')}-${fechanacimiento.month.toString().padLeft(2, '0')}-${fechanacimiento.day.toString().padLeft(2, '0')}",
        "fecharegistro": fecharegistro.toIso8601String(),
        "contrasena": contrasena,
        "correo": correo,
    };
}

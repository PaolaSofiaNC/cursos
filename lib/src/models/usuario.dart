class Usuario {
  final int id;
  final String email;
  final String contrasena;

  Usuario({required this.id, required this.email, required this.contrasena});

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'email': email,
      'contrasena': contrasena,
    };
  }
}

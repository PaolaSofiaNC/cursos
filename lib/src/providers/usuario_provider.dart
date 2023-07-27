import 'package:flutter/material.dart';

class UsuarioProvider with ChangeNotifier {
  String _email = '';
  String _contrasena = '';
  String _photo = '';
  String _nombre = '';
  String _apellido = '';

  get getEmail {
    return _email;
  }

  get getContrasena {
    return _contrasena;
  }

  get getFoto {
    return _photo;
  }

  get getNombre {
    return _nombre;
  }

  get getApellido {
    return _apellido;
  }

  set setEmail(String email) {
    _email = email;
    notifyListeners();
  }

  set setContra(String contrase) {
    _contrasena = contrase;
    notifyListeners();
  }

  set setFoto(String foto) {
    _photo = foto;
    notifyListeners();
  }

  set setNombre(String nombre) {
    _nombre = nombre;
    notifyListeners();
  }

  set setApellido(String apellido) {
    _apellido = apellido;
    notifyListeners();
  }
}

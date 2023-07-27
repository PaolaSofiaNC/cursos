import 'package:flutter/material.dart';

class LoginProvider with ChangeNotifier {
  String _email = '';
  String _contrasena = '';

  get getEmail {
    return _email;
  }

  get getContrasena {
    return _contrasena;
  }

  set setEmail(String email) {
    _email = email;
    notifyListeners();
  }

  set setContra(String contrase) {
    _contrasena = contrase;
    notifyListeners();
  }
}

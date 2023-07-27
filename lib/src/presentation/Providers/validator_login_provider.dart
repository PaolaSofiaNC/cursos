import 'package:flutter/material.dart';

class ValidatorLoginProvider with ChangeNotifier {
  String _correo = ' ';
  String _passw = ' ';
  String _respL = ' ';

  bool get validarCorreo => getEmailVacio || esCorreoInValido ? true : false;
  bool get validarPassw =>
      getPassWVacia || getPassWMenor8 || errorResp ? true : false;

  String get msjCorreo => getEmailVacio
      ? 'El correo es obligatorio'
      : (esCorreoInValido ? 'Formato de correo incorrecto' : '');

  String get msjPassw => getPassWVacia
      ? 'La contraseña es obligatoria'
      : (getPassWMenor8
          ? 'Contraseña minima de 8 caracteres'
          : (errorResp ? 'Correo y/o Contraseña incorrectos' : ''));

  get getPassWVacia => _passw == '';
  get getEmailVacio => _correo == '';
  get esCorreoInValido =>
      (!_correo.contains('@')) && _correo != '' && _correo != ' ';
  get errorResp => _respL == 'error' && _passw != ' ';
  get getPassWMenor8 => _passw != ' ' && _passw.length < 8;

  set setRespLogin(String resp) {
    _respL = resp;
    notifyListeners();
  }

  set setEmail(String email) {
    _correo = email;
    notifyListeners();
  }

  set setContra(String contrase) {
    _passw = contrase;
    notifyListeners();
  }
}

// ignore_for_file: unrelated_type_equality_checks

import 'package:flutter/material.dart';

class ValidacionUpdateDatosProvider with ChangeNotifier {
  String _nombre = ' ';
  String _apellidoP = ' ';
  String _apellidoM = ' ';
  String _correo = ' ';

  bool get validarCorreo => getEmailVacio || esCorreoInValido ? true : false;
  String get obtMsg1 => getNombre ? 'El campo es obligatorio' : '';
  String get obtMsg2 => getApellidoP ? 'El campo es obligatorio' : '';
  String get obtMsg3 => getApellidoM ? 'El campo es obligatorio' : '';

  String get obtMsg4 => getEmailVacio
      ? 'El correo es obligatorio'
      : (esCorreoInValido ? 'Formato de correo incorrecto' : '');

  get getNombre => _nombre == '' && _nombre != ' ';
  get getApellidoP => _apellidoP == '' && _apellidoP != ' ';
  get getApellidoM => _apellidoM == '' && _apellidoM != ' ';
  get getEmailVacio => _correo == '';

  get esCorreoInValido =>
      (!_correo.contains('@')) && _correo != '' && _correo != ' ';

  set setNombre(String nombre) {
    _nombre = nombre;
    notifyListeners();
  }

  set setApellidoP(String apellidoP) {
    _apellidoP = apellidoP;
    notifyListeners();
  }

  set setApellidoM(String apellidoM) {
    _apellidoM = apellidoM;
    notifyListeners();
  }

  set setCorreo(String correo) {
    _correo = correo;
    notifyListeners();
  }

}

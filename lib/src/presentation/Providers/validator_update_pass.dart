import 'package:flutter/material.dart';

class ValidacionUpdatePassProvider with ChangeNotifier {
  String _campo1 = ' ';
  String _campo2 = ' ';
  String _campo3 = ' ';
  String _passPe = ' ';

  get getCampo1Vacio => _campo1 == '';
  get getCampo2Vacio => _campo2 == '';
  get getCampo3Vacio => _campo3 == '';

  String get msjCampo1 => getCampo1Vacio
      ? 'El campo es obligatorio'
      : (getCampoNoIgualContrApi ? 'Contraseña actual incorrecta' : '');

  String get msjCampo2 => getCampo2Vacio
      ? 'El campo es obligatorio'
      : (getCampoNoMayorIgual8 ? 'Contraseña minima de 8 caracteres' : '');

  String get msjCampo3 => getCampo3Vacio
      ? 'El campo es obligatorio'
      : (getCampoNoMayorIgual8_2
          ? 'Contraseña minima de 8 caracteres'
          : (noIgualCampo2YCampo3
              ? 'La contraseña de verificación no coincide'
              : ''));

  bool get validacionesCampo1 =>
      getCampo1Vacio || getCampoNoIgualContrApi ? true : false;

  bool get validacionesCampo2 =>
      getCampo2Vacio || getCampoNoMayorIgual8 ? true : false;

  bool get validacionesCampo3 =>
      getCampo3Vacio || getCampoNoMayorIgual8_2 || noIgualCampo2YCampo3
          ? true
          : false;

  get getCampoNoIgualContrApi =>
      _campo1 != '' && _campo1 != ' ' && _campo1 != _passPe;
  get getCampoNoMayorIgual8 => _campo2 != ' ' && _campo2.length < 8;
  get getCampoNoMayorIgual8_2 => _campo3 != ' ' && _campo3.length < 8;
  get noIgualCampo2YCampo3 => _campo2 != _campo3;

  set setCampo1(String v1) {
    _campo1 = v1;
    notifyListeners();
  }

  set setCampo2(String v2) {
    _campo2 = v2;
    notifyListeners();
  }

  set setCampo3(String v3) {
    _campo3 = v3;
    notifyListeners();
  }

  set setPassPet(String passPet) {
    _passPe = passPet;
    notifyListeners();
  }
}

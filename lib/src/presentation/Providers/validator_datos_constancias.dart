import 'package:flutter/material.dart';

class ValidatorDatosConstanciaProvider with ChangeNotifier {
  String _curp = ' ';
  String _ocupacion = ' ';
  String _razonS = ' ';
  String _shcp = ' ';
  String _reprL = ' ';
  String _reprT = ' ';

  String get obtMC1 => getCurp ? 'El campo es obligatorio' : '';
  String get obtMC2 => getOcupacion ? 'El campo es obligatorio' : '';
  String get obtMC3 => getRazonS ? 'El campo es obligatorio' : '';
  String get obtMC4 => getSHCP ? 'El campo es obligatorio' : '';
  String get obtMC5 => getReprL ? 'El campo es obligatorio' : '';
  String get obtMC6 => getReprT ? 'El campo es obligatorio' : '';

  get getCurp => _curp == '' && _curp != ' ';
  get getOcupacion => _ocupacion == '' && _ocupacion != ' ';
  get getRazonS => _razonS == '' && _razonS != ' ';
  get getSHCP => _shcp == '' && _shcp != ' ';
  get getReprL => _reprL == '' && _reprL != ' ';
  get getReprT => _reprT == '' && _reprT != ' ';

  set setCurp(String curp) {
    _curp = curp;
  }

  set setOcupacion(String ocupa) {
    _ocupacion = ocupa;
    notifyListeners();
  }

  set setRzS(String rzS) {
    _razonS = rzS;
    notifyListeners();
  }

  set setSHCP(String shcp) {
    _shcp = shcp;
    notifyListeners();
  }

  set setReprL(String rpL) {
    _reprL = rpL;
    notifyListeners();
  }

  set setRprT(String rpT) {
    _reprT = rpT;
    notifyListeners();
  }
}

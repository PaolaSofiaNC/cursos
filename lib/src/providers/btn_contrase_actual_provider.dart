import 'package:flutter/material.dart';

class BotonContrasenaActualProvider with ChangeNotifier {
  bool _ocultarContra = true;

  get ocultar {
    return _ocultarContra;
  }

  set esOcultar(bool oculto) {
    _ocultarContra = oculto;
    notifyListeners();
  }
}

import 'package:flutter/material.dart';

class BotonContrasena with ChangeNotifier {
  bool _esOculto = true;

  get oculto {
    return _esOculto;
  }

  set esOculto(bool oculto) {
    _esOculto = oculto;
    notifyListeners();
  }
}

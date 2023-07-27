import 'package:flutter/material.dart';

class GetTokProvider with ChangeNotifier {
  String _tok = '';

  get getTok {
    return _tok;
  }

  set setTok(String tok) {
    _tok = tok;
    notifyListeners();
  }
}

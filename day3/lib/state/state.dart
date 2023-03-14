import 'package:flutter/material.dart';

class AppState extends ChangeNotifier {
  bool isLight = true;

  changeMode() {
    isLight = !isLight;
    notifyListeners();
  }
}

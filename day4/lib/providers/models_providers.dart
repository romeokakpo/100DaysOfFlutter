import 'package:flutter/material.dart';

class ModelsProviders with ChangeNotifier {
  String currentModel = "gpt-3.5-turbo-0301";
  String get getCurrentModel {
    return currentModel;
  }

  void setCurrentModel(String newModel) {
    currentModel = newModel;
    notifyListeners();
  }

  bool isTyping = false;

  void setTyping() {
    isTyping = !isTyping;
    notifyListeners();
  }
}

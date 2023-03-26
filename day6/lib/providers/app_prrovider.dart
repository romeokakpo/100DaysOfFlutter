import 'package:flutter/material.dart';
import 'package:dart_eval/dart_eval.dart';

class AppProvider with ChangeNotifier {
  bool mode = false; //false == dark and true == light
  String enteredText = "";
  String backendExpression = "";
  String result = "";

  void setMode(now) {
    mode = now;
    notifyListeners();
  }

  void setResult() {
    result = "${eval(backendExpression)}";
    notifyListeners();
  }

  void addEnteredText(text) {
    enteredText += text;
    if (text == " x ") {
      backendExpression += " * ";
    } else if (text == " ÷ ") {
      backendExpression += " / ";
    } else {
      backendExpression += text;
    }

    notifyListeners();
  }

  void resetEnteredText() {
    enteredText = '';
    backendExpression = '';
    result = '';
    notifyListeners();
  }

  void removeLeft() {
    enteredText = enteredText.substring(0, enteredText.length - 1);
    backendExpression =
        backendExpression.substring(0, backendExpression.length - 1);
    notifyListeners();
  }
}

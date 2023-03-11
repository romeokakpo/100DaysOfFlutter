import 'package:flutter/material.dart';
import "../contact.dart";

class AppState extends ChangeNotifier {
  AppState() {
    contacts = <Contact>[
      Contact("Roméo KAKPO", "romeokakpo3@gmail.com", "+22991985934", ""),
      Contact("Deus KYR", "kyrdeus@gmail.com", "+22963015516", ""),
    ]..sort(((a, b) {
        return a.name.compareTo(b.name);
      }));
  }

  late List<Contact> contacts;

  void newContact(Contact add) {
    contacts.add(add);
    contacts.sort(((a, b) {
      return a.name.compareTo(b.name);
    }));
    notifyListeners();
  }
}

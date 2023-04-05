import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class ThemeService {
  final GetStorage _box = GetStorage();
  final _key = "isLightMode";

  ThemeMode get theme => _loadFromThemeBox() ? ThemeMode.light : ThemeMode.dark;

  bool _loadFromThemeBox() {
    return _box.read<bool>(_key) ?? true;
  }

  void _saveThemeToBox(bool isLightMode) {
    _box.write(_key, isLightMode);
  }

  void switchTheme() {
    Get.changeThemeMode(_loadFromThemeBox() ? ThemeMode.dark : ThemeMode.light);
    _saveThemeToBox(!_loadFromThemeBox());
  }
}

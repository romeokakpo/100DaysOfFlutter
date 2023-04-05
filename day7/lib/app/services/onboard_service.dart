import 'package:get_storage/get_storage.dart';

class OnboadService {
  final GetStorage _box = GetStorage();
  final _key = "onBoardYet";

  bool get isOnBoard => _loadFromBox();

  bool _loadFromBox() {
    return _box.read<bool>(_key) ?? false;
  }

  void _saveToBox() {
    _box.write(_key, true);
  }

  void changeStatus() {
    _saveToBox();
  }
}

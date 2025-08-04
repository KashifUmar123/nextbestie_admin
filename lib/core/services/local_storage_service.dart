import 'package:shared_preferences/shared_preferences.dart';

class LocalStorageService {
  late SharedPreferences _prefs;

  Future<void> init() async {
    _prefs = await SharedPreferences.getInstance();
  }

  bool get getIsFirstTimeAppOpening =>
      _prefs.getBool(StorageConstants.isFirstTimeAppOpening) ?? true;

  Future<void> write<T>(String key, T data) async {
    if (data is bool) {
      await _prefs.setBool(key, data);
    } else if (data is String) {
      await _prefs.setString(key, data);
    } else if (data is int) {
      await _prefs.setInt(key, data);
    } else if (data is List<int>) {
      await _prefs.setStringList(key, data.map((e) => e.toString()).toList());
    }
  }

  T? read<T>(String key) {
    return _prefs.get(key) as T?;
  }

  Future<void> delete(String key) async {
    await _prefs.remove(key);
  }

  Future<void> deleteAll() async {
    await _prefs.clear();
  }
}

class StorageConstants {
  static const String isFirstTimeAppOpening = "isFirstTimeAppOpening";
  static const String isLoggedIn = "isLoggedIn";
}

import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class SecureStorageService {
  late FlutterSecureStorage _storage;
  SecureStorageService() {
    _storage = const FlutterSecureStorage();
    debugPrint("[SecureStorageService Initialized]");
  }

  Future<void> _writeSecureData({
    required String key,
    required String value,
  }) async {
    await _storage.write(key: key, value: value);
  }

  Future<String?> _readSecureData({required String key}) async {
    return await _storage.read(
      key: key,
    );
  }

  Future<void> clearAllSecureData() async {
    await _storage.deleteAll();
  }

  Future<void> setToken(String token) async {
    await _writeSecureData(
      key: SecureStorageConstants.token,
      value: token,
    );
  }

  Future<String?> getToken() async {
    return await _readSecureData(
      key: SecureStorageConstants.token,
    );
  }

  Future<void> setLoggedIn(bool value) async {
    await _writeSecureData(
      key: SecureStorageConstants.isLoggedIn,
      value: value.toString(),
    );
  }

  Future<bool> getLoggedIn() async {
    final value = await _readSecureData(
      key: SecureStorageConstants.isLoggedIn,
    );
    return value == "true";
  }

  Future<dynamic> read(String key) async {
    return await _storage.read(key: key);
  }
}

class SecureStorageConstants {
  static const String token = "token";
  static const String isLoggedIn = "isLoggedIn";
}

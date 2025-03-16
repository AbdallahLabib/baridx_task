import 'dart:convert';

import 'package:uuid/uuid.dart';
import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'local_storage_service.dart';

@Named("AppLocalStorage")
@LazySingleton(as: LocalStorageService)
class LocalStorageServiceImpl implements LocalStorageService {
  LocalStorageServiceImpl(this._sharedPreferences);
  final SharedPreferences _sharedPreferences;

  @override
  Future<void> saveString({required String key, required String value}) async {
    _sharedPreferences.setString(key, value);
  }

  @override
  String? getString({required String key, String? defaultValue}) {
    return _sharedPreferences.getString(key) ?? defaultValue;
  }

  @override
  Future<void> saveInt({required String key, required int value}) async {
    _sharedPreferences.setInt(key, value);
  }

  @override
  int? getInt({required String key, int? defaultValue}) {
    return _sharedPreferences.getInt(key) ?? defaultValue;
  }

  @override
  Future<void> saveMap({required String key, required Map<String, dynamic> jsonMap}) async {
    await _sharedPreferences.setString(key, json.encode(jsonMap));
  }

  @override
  Future<bool> removeValue({required String key}) async {
    return _sharedPreferences.remove(key);
  }

  @override
  Map<String, dynamic>? getMap<T>({required String key}) {
    final String? value = _sharedPreferences.getString(key);
    if (value != null) {
      return json.decode(_sharedPreferences.getString(key)!) as Map<String, dynamic>;
    } else {
      return null;
    }
  }

  @override
  bool? getBool({required String key, bool? defaultValue}) {
    return _sharedPreferences.getBool(key) ?? defaultValue;
  }

  @override
  Future<void> saveBool({required String key, required bool value}) async {
    await _sharedPreferences.setBool(key, value);
  }
}

@Named("AppSecureStorage")
@LazySingleton(as: LocalStorageService)
class AppSecureStorageImpl implements LocalStorageService {
  final SharedPreferences _sharedPreferences;
  final Uuid _uuid;

  AppSecureStorageImpl(this._sharedPreferences, this._uuid);

  String _getKey(String key) {
    return '${_uuid.v5(Uuid.NAMESPACE_URL, key)}_$key';
  }

  @override
  Future<void> saveString({required String key, required String value}) async {
    await _sharedPreferences.setString(_getKey(key), value);
  }

  @override
  Future<String?> getString({required String key, String? defaultValue}) async {
    return _sharedPreferences.getString(_getKey(key)) ?? defaultValue;
  }

  @override
  Future<void> saveInt({required String key, required int value}) async {
    await _sharedPreferences.setInt(_getKey(key), value);
  }

  @override
  Future<int?> getInt({required String key, int? defaultValue}) async {
    return _sharedPreferences.getInt(_getKey(key)) ?? defaultValue;
  }

  @override
  Future<void> saveMap({required String key, required Map<String, dynamic> jsonMap}) async {
    await _sharedPreferences.setString(_getKey(key), json.encode(jsonMap));
  }

  @override
  Future<Map<String, dynamic>?> getMap<T>({required String key}) async {
    final value = _sharedPreferences.getString(_getKey(key));
    return value == null ? null : json.decode(value) as Map<String, dynamic>;
  }

  @override
  Future<bool> removeValue({required String key}) async {
    return await _sharedPreferences.remove(_getKey(key));
  }

  @override
  Future<bool?> getBool({required String key, bool? defaultValue}) async {
    final value = _sharedPreferences.getBool(_getKey(key));
    return value ?? defaultValue;
  }

  @override
  Future<void> saveBool({required String key, required bool value}) async {
    await _sharedPreferences.setBool(_getKey(key), value);
  }
}

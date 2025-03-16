import 'package:baridx_task/core/app/app_manager.dart';
import 'package:baridx_task/core/app/app_manager_env.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:uuid/uuid.dart';

/// This class register the third party plugins
@module
abstract class RegisterModule {
  @Named("BaseUrl")
  String get baseUrl => AppManager.instance.env.baseUrl;

  @lazySingleton
  GlobalKey<NavigatorState> get navigator => GlobalKey<NavigatorState>();

  @preResolve
  Future<SharedPreferences> get getSharedPreference => SharedPreferences.getInstance();

  @lazySingleton
  FlutterSecureStorage get getSecureStorage => const FlutterSecureStorage();

  @lazySingleton
  Uuid get uuid => const Uuid();
}

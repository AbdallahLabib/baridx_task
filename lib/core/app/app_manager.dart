import 'dart:async';
import 'dart:developer';
import 'dart:io';

import 'package:baridx_task/features/my_app/app.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../services/dependency_injection/dependency_init.dart';
import 'app_manager_env.dart';

class AppManager {
  AppManager._();

  static final instance = AppManager._();

  var _env = AppManagerEnv.dev;

  AppManagerEnv get env => _env;

  bool get isAqa => _env == AppManagerEnv.testing;
  bool get isDev => _env == AppManagerEnv.dev;
  bool get isProd => _env == AppManagerEnv.prod;

  void init(AppManagerEnv env) {
    _env = env;
  }

  void run() {
    runZonedGuarded(
      () async {
        WidgetsFlutterBinding.ensureInitialized();
        await SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
        SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge, overlays: [
          SystemUiOverlay.top,
        ]);

        SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
          statusBarColor: Colors.transparent,
          statusBarIconBrightness: Brightness.light,
          statusBarBrightness: Brightness.light,
        ));

        await configureDependencies(_env.dependencyInjectionEnv);

        if (isDev) {
          HttpOverrides.global = MyHttpOverrides();
        }

        runApp(const MyApp());
      },
      (error, stackTrace) {
        log(error.toString());
      },
    );
  }
}

class MyHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext? context) {
    return super.createHttpClient(context)
      ..badCertificateCallback = (X509Certificate cert, String host, int port) => true;
  }
}

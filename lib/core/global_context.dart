import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import '/core/services/dependency_injection/dependency_init.dart';
import '/core/services/navigation_service/navigation_service.dart';

@lazySingleton
class GlobalContext {
  BuildContext context() => getIt.get<NavigationService>().navigatorKey.currentContext!;
}

import 'package:flutter/widgets.dart' show GlobalKey, NavigatorState, Route;

abstract class NavigationService {
  Future<dynamic> pushNamed(String routeName, {Object? args});

  Future<dynamic> pushReplacement(String routeName, {Object? args});

  Future<dynamic> pushNamedAndRemoveUntil(
    String routeName, {
    Object? args,
    bool Function(Route<dynamic>)? predicate,
  });

  void pop();

  GlobalKey<NavigatorState> get navigatorKey;
}

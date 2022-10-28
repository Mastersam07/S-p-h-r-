import 'package:flutter/material.dart';
import 'router.dart';

export 'router.dart';

class AppNavigator {
  AppNavigator._();
  static final key = GlobalKey<NavigatorState>();

  static Future push(Widget page) {
    return key.currentState!.push(
      MaterialPageRoute(builder: (_) => page),
    );
  }

  static Future pushNamed(
    String route, {
    required SubRouter router,
    arguments,
  }) {
    return key.currentState!.pushNamed(
      '${router.moduleName} $route',
      arguments: arguments,
    );
  }

  static Future pushReplacement(Widget page) {
    return key.currentState!.pushReplacement(
      MaterialPageRoute(builder: (_) => page),
    );
  }

  static Future pushNamedReplacement(
    String route, {
    required SubRouter router,
    arguments,
  }) {
    return key.currentState!.pushReplacementNamed(
      '${router.moduleName} $route',
      arguments: arguments,
    );
  }

  static Future pushAndClear(Widget page) {
    return key.currentState!.pushAndRemoveUntil(
      MaterialPageRoute(builder: (_) => page),
      (route) => false,
    );
  }

  static Future pushNamedAndClear(
    String route, {
    required SubRouter router,
    arguments,
  }) {
    return key.currentState!.pushNamedAndRemoveUntil(
      '${router.moduleName} $route',
      (route) => false,
      arguments: arguments,
    );
  }

  static dynamic pop([result]) {
    return key.currentState!.pop(result);
  }

  static dynamic maybePop([result]) {
    return key.currentState!.pop(result);
  }

  static bool get canPop => key.currentState!.canPop();
}
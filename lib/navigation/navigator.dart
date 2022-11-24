import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'router.dart';

export 'router.dart';

class AppNavigator {
  AppNavigator._();
  static final key = GlobalKey<NavigatorState>();

  static Future push(Widget page, [String? routeName]) {
    return key.currentState!.push(
      getPageRoute(view: page, routeName: routeName),
    );
  }

  static Future pushNamed(
    String route, {
    SubRouter? router,
    arguments,
  }) {
    return key.currentState!.pushNamed(
      router != null ? '${router.moduleName} $route' : route,
      arguments: arguments,
    );
  }

  static Future pushReplacement(Widget page, [String? routeName]) {
    return key.currentState!.pushReplacement(
      getPageRoute(view: page, routeName: routeName),
    );
  }

  static Future pushNamedReplacement(
    String route, {
    SubRouter? router,
    arguments,
  }) {
    return key.currentState!.pushReplacementNamed(
      router != null ? '${router.moduleName} $route' : route,
      arguments: arguments,
    );
  }

  static Future pushAndClear(Widget page, [String? routeName]) {
    return key.currentState!.pushAndRemoveUntil(
      getPageRoute(view: page, routeName: routeName),
      (route) => false,
    );
  }

  static Future pushNamedAndClear(
    String route, {
    SubRouter? router,
    arguments,
  }) {
    return key.currentState!.pushNamedAndRemoveUntil(
      router != null ? '${router.moduleName} $route' : route,
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

  static PageRoute<T> getPageRoute<T>({
    required Widget view,
    required String? routeName,
  }) {
    final nameOfRoute = routeName ?? view.runtimeType.toString();
    if (Platform.isIOS) {
      return CupertinoPageRoute<T>(
        builder: (_) => view,
        settings: RouteSettings(name: nameOfRoute),
      );
    } else {
      return MaterialPageRoute<T>(
        builder: (_) => view,
        settings: RouteSettings(name: nameOfRoute),
      );
    }
  }
}

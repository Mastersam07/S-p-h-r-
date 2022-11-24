import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'router.dart';

export 'router.dart';

class AppNavigator {
  AppNavigator._();
  static final key = GlobalKey<NavigatorState>();

  static BuildContext get currentContext => key.currentContext!;

  static Future push(Widget page, [String? routeName]) {
    return key.currentState!.push(
      getPageRoute(view: page, routeName: routeName),
    );
  }

  static Future<T?> pushNamed<T>(
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

  static Future<T?> pushNamedReplacement<T>(
    String route, {
    SubRouter? router,
    arguments,
  }) {
    return key.currentState!.pushReplacementNamed(
      router != null ? '${router.moduleName} $route' : route,
      arguments: arguments,
    );
  }

  static Future<T?> pushAndClear<T>(Widget page, [String? routeName]) {
    return key.currentState!.pushAndRemoveUntil(
      getPageRoute(view: page, routeName: routeName),
      (route) => false,
    );
  }

  static Future<T?> pushNamedAndClear<T>(
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

  static void pop<T>([T? result]) {
    return key.currentState!.pop(result);
  }

  static void maybePop<T>([T? result]) {
    return key.currentState!.pop(result);
  }

  static bool get canPop => key.currentState!.canPop();

  static void popUntilRoute(String routeName) {
    return key.currentState!.popUntil(ModalRoute.withName(routeName));
  }

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

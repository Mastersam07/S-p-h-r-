import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'router.dart';
import 'supercharged_navigator.dart';

export 'router.dart';

class AppNavigator {
  AppNavigator._();

  static final _hood = SuperchargedNavigator();

  static final key = _hood.key;

  static BuildContext get currentContext => _hood.currentContext;

  static Future<T?> push<T>(Widget page, [String? routeName]) =>
      _hood.push(page, routeName);

  static Future<T?> pushNamed<T>(
    String route, {
    SubRouter? router,
    arguments,
  }) =>
      _hood.pushNamed(route, router: router, arguments: arguments);

  static Future<T?> pushReplacement<T>(Widget page, [String? routeName]) =>
      _hood.pushReplacement<T>(page, routeName);

  static Future<T?> pushNamedReplacement<T>(
    String route, {
    SubRouter? router,
    arguments,
  }) =>
      _hood.pushNamedReplacement<T>(route);

  static Future<T?> pushAndClear<T>(Widget page, [String? routeName]) =>
      _hood.pushAndClear(page, routeName);

  static Future<T?> pushNamedAndClear<T>(
    String route, {
    SubRouter? router,
    arguments,
  }) =>
      _hood.pushNamedAndClear(route, router: router, arguments: arguments);

  static void pop<T>([T? result]) => _hood.pop(result);

  static void maybePop<T>([T? result]) => _hood.maybePop(result);

  static bool get canPop => _hood.canPop;

  static void popUntilRoute(String routeName) => _hood.popUntilRoute(routeName);
}

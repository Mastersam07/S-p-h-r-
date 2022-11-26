
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'router.dart';

class SuperchargedNavigator {
  SuperchargedNavigator();

  final key = GlobalKey<NavigatorState>();

  BuildContext get currentContext => key.currentContext!;

  Future<T?> push<T>(Widget page, [String? routeName]) {
    return key.currentState!.push(
      getPageRoute(view: page, routeName: routeName),
    );
  }

  Future<T?> pushNamed<T>(
    String route, {
    SubRouter? router,
    arguments,
  }) {
    return key.currentState!.pushNamed(
      router != null ? '${router.moduleName} $route' : route,
      arguments: arguments,
    );
  }

  Future<T?> pushReplacement<T>(Widget page, [String? routeName]) {
    return key.currentState!.pushReplacement(
      getPageRoute(view: page, routeName: routeName),
    );
  }

  Future<T?> pushNamedReplacement<T>(
    String route, {
    SubRouter? router,
    arguments,
  }) {
    return key.currentState!.pushReplacementNamed(
      router != null ? '${router.moduleName} $route' : route,
      arguments: arguments,
    );
  }

  Future<T?> pushAndClear<T>(Widget page, [String? routeName]) {
    return key.currentState!.pushAndRemoveUntil(
      getPageRoute(view: page, routeName: routeName),
      (route) => false,
    );
  }

  Future<T?> pushNamedAndClear<T>(
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

  void pop<T>([T? result]) {
    return key.currentState!.pop(result);
  }

  void maybePop<T>([T? result]) {
    return key.currentState!.pop(result);
  }

  bool get canPop => key.currentState!.canPop();

  void popUntilRoute(String routeName) {
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

import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../main.dart';
import '../views/moduleA/router.dart';
import '../views/moduleB/router.dart';
import '../views/normal_a.dart';
import '../views/normal_b.dart';
import 'route.dart';

class AppRouter {
  AppRouter._();
  static final _instance = AppRouter._();
  factory AppRouter() => _instance;

  final _moduleRouterRegistration = <SubRouter>[
    moduleARouter,
    moduleBRouter,
  ];

  Route onGenerateRoute(RouteSettings settings) {
    final routeComponents = settings.name!.split(' ');

    if (routeComponents.length == 1) {
      return getPageRoute(
        view: _mainRouter(settings),
        settings: settings,
      );
    }

    final module = _moduleRouterRegistration.firstWhere(
      (subRouter) => subRouter.moduleName == routeComponents[0],
      orElse: () => throw Exception(
        'Module with name ${routeComponents[0]} not registered in Router',
      ),
    );
    final routeName = routeComponents[1];
    final splitRouteSettings = RouteSettings(
      name: routeName,
      arguments: settings.arguments,
    );
    return getPageRoute(
      view: module.router(splitRouteSettings),
      settings: splitRouteSettings,
    );
  }

  PageRoute getPageRoute({
    required Widget view,
    required RouteSettings settings,
  }) {
    return Platform.isIOS
        ? CupertinoPageRoute(
            builder: (_) => view,
            settings: settings,
          )
        : MaterialPageRoute(
            builder: (_) => view,
            settings: settings,
          );
  }

  Widget _mainRouter(RouteSettings settings) {
    switch (settings.name) {
      case dashboardRoute:
        return const MyHomePage();

      case normalARoute:
        return const NormalA();

      case normalBRoute:
        return const NormalB();

      default:
        return Scaffold(
          body: Center(
            child: Text('No route defined for ${settings.name}'),
          ),
        );
    }
  }
}

abstract class SubRouter {
  String get moduleName;
  Widget router(RouteSettings settings);
}

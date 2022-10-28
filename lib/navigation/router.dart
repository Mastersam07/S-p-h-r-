import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:navhero/main.dart';

import '../views/moduleA/router.dart';
import '../views/moduleB/router.dart';

class AppRouter {
  AppRouter._();
  static final _instance = AppRouter._();
  factory AppRouter() => _instance;

  final _moduleRouterRegistration = <SubRouter>[
    moduleARouter,
    moduleBRouter,
  ];

  Route onGenerateRoute(RouteSettings settings) {
    print(settings.name);
    final routeComponents = settings.name!.split(' ');
    //Backward compatibility check
    if (routeComponents.length == 1) {
      return MainAppRouter.generateRoutes(settings);
    }

    final module = _moduleRouterRegistration.firstWhere(
      (subRouter) => subRouter.moduleName == routeComponents[0],
      orElse: () => throw Exception(
        'Module with name ${routeComponents[0]} not registered in Router',
      ),
    );
    final routeName = routeComponents[1];
    print('routeComponents[1]: ${routeComponents[1]}');
    print('routeComponents[0]: ${routeComponents[0]}');
    print('settings.arguments: ${settings.arguments}');
    final splitRouteSettings = RouteSettings(
      name: routeName,
      arguments: settings.arguments,
    );
    return Platform.isIOS
        ? CupertinoPageRoute(
            builder: (_) => module.router(splitRouteSettings),
          )
        : MaterialPageRoute(
            builder: (_) => module.router(splitRouteSettings),
          );
  }
}

abstract class SubRouter {
  String get moduleName;
  Widget router(RouteSettings settings);
}

abstract class MainAppRouter {
  static Route<dynamic> generateRoutes(RouteSettings settings) {
    switch (settings.name) {
      case '/':
        return getPageRoute(
          settings: settings,
          view: const MyHomePage(),
        );
      default:
        return getPageRoute(
          settings: settings,
          view: Scaffold(
            body: Center(
              child: Text('No route defined for ${settings.name}'),
            ),
          ),
        );
    }
  }

  static PageRoute<dynamic> getPageRoute({
    required RouteSettings settings,
    required Widget view,
  }) {
    return Platform.isIOS
        ? CupertinoPageRoute(settings: settings, builder: (_) => view)
        : MaterialPageRoute(settings: settings, builder: (_) => view);
  }
}
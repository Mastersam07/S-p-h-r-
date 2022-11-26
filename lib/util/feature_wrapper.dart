import 'dart:async';

import 'package:flutter/material.dart';

import '../navigation/navigator.dart';
import '../navigation/supercharged_navigator.dart';
import 'observer.dart';

abstract class FeatureWrapper extends StatelessWidget {
  FeatureWrapper({Key? key}) : super(key: key);

  String get _featureName => runtimeType.toString();

  String? get initialRoute;

  FeatureRouter get viewGenerator;

  final navigator = SuperchargedNavigator();

  Future<void> start([BuildContext? context]) async {
    if (context != null) {
      Navigator.of(context).push(
        SuperchargedNavigator.getPageRoute(view: this, routeName: _featureName),
      );
    } else {
      AppNavigator.push(this, _featureName);
    }
  }

  stop() {
    final route = NavigationHistoryObserver().history.firstWhere(
          (element) => element?.settings.name == _featureName,
          orElse: () => null,
        );

    if (route != null) {
      Navigator.of(AppNavigator.currentContext).removeRoute(route);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Navigator(
      key: navigator.key,
      initialRoute: initialRoute,
      onGenerateRoute: (routeSettings) {
        final w = viewGenerator.router(routeSettings);
        return AppRouter.getPageRoute(
          view: w,
          settings: routeSettings,
        );
      },
    );
  }
}

class FeatureRouter {
  final String name;
  final Widget Function(RouteSettings settings) router;

  FeatureRouter(this.name, this.router);
}

class Authentication extends FeatureWrapper {
  Authentication({Key? key}) : super(key: key);

  @override
  String? get initialRoute => 'onboarding';

  @override
  FeatureRouter get viewGenerator => FeatureRouter(
        runtimeType.toString(),
        (settings) {
          final name = settings.name;
          switch (name) {
            case 'login':
              return const Scaffold();

            default:
              return const Scaffold();
          }
        },
      );
}

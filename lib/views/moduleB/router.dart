import 'package:flutter/material.dart';

import '../../navigation/navigator.dart';
import 'route.dart';
import 'view_b_one.dart';
import 'view_b_three.dart';
import 'view_b_two.dart';

export 'router.dart';
export 'route.dart';

final moduleBRouter = _ModuleBRouter();

class _ModuleBRouter implements SubRouter {
  @override
  String get moduleName => 'moduleB';

  @override
  Widget router(RouteSettings settings) {
    switch (settings.name) {
      case bOneRoute:
        return ViewBOne();
      case bTwoRoute:
        return const ViewBTwo();
      case bThreeRoute:
        return const ViewBThree();
      default:
        return const Scaffold(
          body: Center(
            child: Text(
              'Cannot find route',
            ),
          ),
        );
    }
  }
}

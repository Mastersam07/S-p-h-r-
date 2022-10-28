import 'package:flutter/material.dart';

import '../../navigation/navigator.dart';
import 'route.dart';
import 'view_a_one.dart';
import 'view_a_three.dart';
import 'view_a_two.dart';

export 'router.dart';
export 'route.dart';

final moduleARouter = _ModuleARouter();

class _ModuleARouter implements SubRouter {
  @override
  String get moduleName => 'moduleA';

  @override
  Widget router(RouteSettings settings) {
    print("settings.arguments settings.arguments: ${settings.arguments}");
    switch (settings.name) {
      case aOneRoute:
        return ViewAOne();
      case aTwoRoute:
        return const ViewATwo();
      case aThreeRoute:
        return const ViewAThree();
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

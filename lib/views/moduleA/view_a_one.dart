import 'package:flutter/material.dart';

import '../../navigation/navigator.dart';
import '../../util/observer.dart';
import 'router.dart';

class ViewAOne extends StatelessWidget {
  ViewAOne({Key? key}) : super(key: key);

  final NavigationHistoryObserver historyObserver = NavigationHistoryObserver();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('View A One'),
            OutlinedButton(
              onPressed: () => AppNavigator.pushNamed(aTwoRoute,
                  router: moduleARouter, arguments: 2),
              child: const Text('View A Two'),
            ),
          ],
        ),
      ),
    );
  }
}

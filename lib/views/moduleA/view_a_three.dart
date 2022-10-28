import 'package:flutter/material.dart';

import '../../navigation/navigator.dart';
import '../../util/observer.dart';

class ViewAThree extends StatelessWidget {
  ViewAThree({Key? key}) : super(key: key);

  final NavigationHistoryObserver historyObserver = NavigationHistoryObserver();

  @override
  Widget build(BuildContext context) {
    print(historyObserver.history);
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('View A Three'),
            OutlinedButton(
              onPressed: () => AppNavigator.pop(),
              child: const Text('Pop totally'),
            ),
          ],
        ),
      ),
    );
  }
}

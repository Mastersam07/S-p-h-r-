import 'package:flutter/material.dart';

import '../../util/observer.dart';

class ViewBOne extends StatelessWidget {
  ViewBOne({Key? key}) : super(key: key);

  final NavigationHistoryObserver historyObserver = NavigationHistoryObserver();

  @override
  Widget build(BuildContext context) {
    print(historyObserver.history);
    return const Scaffold(
      body: Center(
        child: Text('View B One'),
      ),
    );
  }
}

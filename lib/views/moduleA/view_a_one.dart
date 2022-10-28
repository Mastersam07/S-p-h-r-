import 'package:flutter/material.dart';

import '../../util/observer.dart';

class ViewAOne extends StatelessWidget {
  ViewAOne({Key? key}) : super(key: key);

  final NavigationHistoryObserver historyObserver = NavigationHistoryObserver();

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text('View A One'),
      ),
    );
  }
}

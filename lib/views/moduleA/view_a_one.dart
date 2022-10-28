import 'package:flutter/material.dart';

import '../../util/observer.dart';

class ViewAOne extends StatelessWidget {
  ViewAOne({Key? key}) : super(key: key);

  final NavigationHistoryObserver historyObserver = NavigationHistoryObserver();

  @override
  Widget build(BuildContext context) {
    // TODO: ARGS IS NULL
    print("args: ${ModalRoute.of(context)?.settings.arguments}");

    // TODO: NAME IS NULL
    print("name: ${ModalRoute.of(context)?.settings.name}");

    // TODO: HISTORY SHOWS A ROUTE WITH NULL SETTINGS
    print(historyObserver.history);
    return const Scaffold(
      body: Center(
        child: Text('View A One'),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:navhero/views/moduleA/router.dart';

import '../../navigation/navigator.dart';

class ViewATwo extends StatelessWidget {
  const ViewATwo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('View A Two'),
            OutlinedButton(
              onPressed: () => AppNavigator.pushNamed(aThreeRoute,
                  router: moduleARouter, arguments: 3),
              child: const Text('View A Three'),
            ),
          ],
        ),
      ),
    );
  }
}

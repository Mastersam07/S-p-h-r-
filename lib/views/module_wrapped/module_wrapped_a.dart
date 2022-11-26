import 'package:flutter/material.dart';

import 'module_wrapped.dart';
import 'module_wrapped_b.dart';

class ModuleWrappedA extends StatelessWidget {
  const ModuleWrappedA({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Module Wrapped. View A',
            ),
            OutlinedButton(
              onPressed: () {
                final module = ModuleWrapped.instance;
                module.navigator.push(const ModuleWrappedB());
              },
              child: const Text('Go to ModuleWrapped View B'),
            ),
          ],
        ),
      ),
    );
  }
}

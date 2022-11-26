import 'package:flutter/material.dart';

import 'module_wrapped.dart';

class ModuleWrappedB extends StatelessWidget {
  const ModuleWrappedB({Key? key}) : super(key: key);

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
                module.navigator.pop();
              },
              child: const Text('Internal Module Pop'),
            ),
          ],
        ),
      ),
    );
  }
}

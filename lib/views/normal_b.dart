import 'package:flutter/material.dart';

class NormalB extends StatelessWidget {
  const NormalB({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    print(ModalRoute.of(context)?.settings);
    return const Scaffold(
      body: Center(
        child: Text('NormalB'),
      ),
    );
  }
}

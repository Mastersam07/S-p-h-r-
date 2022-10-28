import 'package:flutter/material.dart';

class NormalA extends StatelessWidget {
  const NormalA({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    print(ModalRoute.of(context)?.settings);
    return const Scaffold(
      body: Center(
        child: Text('NormalA'),
      ),
    );
  }
}

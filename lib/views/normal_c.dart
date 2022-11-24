import 'package:flutter/material.dart';

class NormalC extends StatelessWidget {
  const NormalC({
    required this.valueFromArgument,
    Key? key,
  }) : super(key: key);

  final String valueFromArgument;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text('NormalC - $valueFromArgument'),
      ),
    );
  }
}

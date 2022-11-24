import 'package:flutter/material.dart';

class NormalD extends StatelessWidget {
  const NormalD({
    required this.valueFromArgument,
    Key? key,
  }) : super(key: key);

  final String valueFromArgument;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text('NormalD - $valueFromArgument'),
      ),
    );
  }
}

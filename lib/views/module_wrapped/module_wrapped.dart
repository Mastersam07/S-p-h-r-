import 'package:flutter/material.dart';

import '../../util/feature_wrapper.dart';
import 'module_wrapped_a.dart';
import 'module_wrapped_b.dart';

class ModuleWrapped extends FeatureWrapper {
  ModuleWrapped._({Key? key}) : super(key: key);

  static final instance = ModuleWrapped._();

  @override
  String? get initialRoute => 'module_wrapped_a';

  @override
  FeatureRouter get viewGenerator =>
      FeatureRouter('module_wrapped', (settings) {
        final name = settings.name;
        switch (name) {
          case 'module_wrapped_a':
            return const ModuleWrappedA();

          case 'module_wrapped_b':
            return const ModuleWrappedB();

          default:
            return const Scaffold();
        }
      });
}

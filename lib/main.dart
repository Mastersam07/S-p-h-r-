import 'package:flutter/material.dart';
import 'package:navhero/navigation/route.dart';
import 'views/moduleA/router.dart';

import 'navigation/navigator.dart';
import 'util/observer.dart';
import 'views/moduleB/router.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      navigatorKey: AppNavigator.key,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      onGenerateRoute: AppRouter().onGenerateRoute,
      navigatorObservers: [NavigationHistoryObserver()],
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    print("name: ${ModalRoute.of(context)?.settings.name}");
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home Page'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            OutlinedButton(
              onPressed: () => AppNavigator.pushNamed(aOneRoute,
                  router: moduleARouter, arguments: 5),
              child: const Text('Push ModuleA'),
            ),
            OutlinedButton(
              onPressed: () =>
                  AppNavigator.pushNamed(bOneRoute, router: moduleBRouter),
              child: const Text('Push ModuleA'),
            ),
            OutlinedButton(
              onPressed: () => AppNavigator.pushNamed(normalARoute),
              child: const Text('NormalA'),
            ),
            OutlinedButton(
              onPressed: () => AppNavigator.pushNamed(normalBRoute),
              child: const Text('NormalB'),
            ),
          ],
        ),
      ),
    );
  }
}

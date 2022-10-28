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
                  router: moduleARouter, arguments: 1),
              child: const Text('Push ModuleA'),
            ),
            OutlinedButton(
              onPressed: () => AppNavigator.pushNamed(bOneRoute,
                  router: moduleBRouter, arguments: 2),
              child: const Text('Push ModuleB'),
            ),
            OutlinedButton(
              onPressed: () =>
                  AppNavigator.pushNamed(normalARoute, arguments: 3),
              child: const Text('NormalA'),
            ),
            OutlinedButton(
              onPressed: () =>
                  AppNavigator.pushNamed(normalBRoute, arguments: 4),
              child: const Text('NormalB'),
            ),
            OutlinedButton(
              onPressed: () => Navigator.push(
                  context, MaterialPageRoute(builder: (context) => InfoPage())),
              child: const Text('Info'),
            ),
          ],
        ),
      ),
    );
  }
}

class InfoPage extends StatelessWidget {
  InfoPage({Key? key}) : super(key: key);

  final NavigationHistoryObserver historyObserver = NavigationHistoryObserver();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Information'),
      ),
      body: SingleChildScrollView(
        child: SafeArea(
          child: Column(
            children: [
              Text(
                'History',
                style: Theme.of(context).textTheme.headline4,
              ),
              ListView.separated(
                separatorBuilder: (context, index) =>
                    const Divider(thickness: 2),
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemBuilder: (context, index) => Text(
                  historyObserver.history[index].settings.name ?? 'Null',
                  style: Theme.of(context)
                      .textTheme
                      .bodyText2
                      ?.copyWith(fontSize: 20),
                  textAlign: TextAlign.center,
                ),
                itemCount: historyObserver.history.length,
              ),
              const SizedBox(height: 16),
              Text(
                'Popped Routes',
                style: Theme.of(context).textTheme.headline4,
              ),
              ListView.separated(
                separatorBuilder: (context, index) =>
                    const Divider(thickness: 2),
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemBuilder: (context, index) => Text(
                  historyObserver.poppedRoutes[index].settings.name ?? 'Null',
                  style: Theme.of(context)
                      .textTheme
                      .bodyText2
                      ?.copyWith(fontSize: 20),
                  textAlign: TextAlign.center,
                ),
                itemCount: historyObserver.poppedRoutes.length,
              )
            ],
          ),
        ),
      ),
    );
  }
}

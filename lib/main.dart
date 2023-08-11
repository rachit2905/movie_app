import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import './pages/SplashPage.dart';
import './pages/mainPage.dart';

void main() {
  runApp(
    // ignore: avoid_returning_null_for_void
    SplashPage(
        key: UniqueKey(),
        onInitializationComplete: () => runApp(ProviderScope(
              child: MyApp(),
            ))),
  );
}

class MyApp extends StatelessWidget {
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'MovieBUFF',
      initialRoute: 'home',
      routes: {
        'home': (BuildContext context) => MainPage(),
      },
      theme: ThemeData(
          primarySwatch: Colors.blueGrey,
          visualDensity: VisualDensity.adaptivePlatformDensity),
    );
  }
}

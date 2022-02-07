import 'package:flutter/material.dart';
import 'package:flutter_playground/routes/constants_router.dart';
import 'package:flutter_playground/tinder_mockup/tinder_mockup.dart';

import 'main_screen.dart';
import 'money_mockup/money_mockup.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Playground',
        theme: ThemeData(primarySwatch: Colors.blue, fontFamily: 'Roboto'),
        initialRoute: homeRoute,
        home: const MainScreen(),
        routes: {
          homeRoute: (context) => const MainScreen(),
          tinderRoute: (context) => const TinderMockup(),
          moneyRoute: (context) => const MoneyMockup(),
        });
  }
}

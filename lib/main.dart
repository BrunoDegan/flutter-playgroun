import 'package:flutter/material.dart';
import 'package:flutter_playground/animations/controlled/button/controlled_animated_button_page.dart';
import 'package:flutter_playground/animations/controlled/list/controlled_animated_list_page.dart';
import 'package:flutter_playground/animations/implicit/button/implicit_animated_button_page.dart';
import 'package:flutter_playground/flutterando_screen/flutterando_main_page.dart';
import 'package:flutter_playground/flutterando_screen/splash/flutterando_splash_page.dart';
import 'package:flutter_playground/money_screen/money_page.dart';
import 'package:flutter_playground/routes/constants_router.dart';
import 'package:flutter_playground/tinder_screen/tinder_page.dart';

import 'animations/implicit/list/implicit_animated_list_page.dart';
import 'main_screen.dart';

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
        debugShowCheckedModeBanner: false,
        theme: ThemeData(primarySwatch: Colors.blue, fontFamily: 'Roboto'),
        initialRoute: homeRoute,
        home: const MainScreen(),
        routes: {
          tinderRoute: (context) => const TinderPage(),
          moneyRoute: (context) => const MoneyPage(),
          implicitAnimatedButton: (context) =>
              const ImplicitAnimatedButtonPage(),
          implicitAnimatedList: (context) => const ImplicitAnimatedListPage(),
          // implicitAnimationsDemo: (context) =>
          //     const ImplicitAnimationPageDemo(),
          // controlledAnimationsDemo: (context) =>
          //     const ControlledAnimationsPageDemo(),
          controlledAnimatedButton: (context) =>
              const ControlledAnimatedButtonPage(),
          controlledAnimatedList: (context) =>
              const ControlledAnimatedListPage(),
          flutterandoRoute: (context) => const FlutterandoSplashPage(),
          flutterandoProjectList: (context) => const FlutterandoMainPage()
        });
  }
}

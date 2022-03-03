import 'package:flutter/material.dart';
import 'package:flutter_playground/src/animations/animations_page.dart';
import 'package:flutter_playground/src/animations/controlled/button/controlled_animated_button_page.dart';
import 'package:flutter_playground/src/animations/controlled/list/controlled_animated_list_page.dart';
import 'package:flutter_playground/src/animations/demo/controlled_animations_screen_demo.dart';
import 'package:flutter_playground/src/animations/demo/implicit_animations_screen_demo.dart';
import 'package:flutter_playground/src/animations/implicit/button/implicit_animated_button_page.dart';
import 'package:flutter_playground/src/animations/implicit/list/implicit_animated_list_page.dart';
import 'package:flutter_playground/src/flutterando_page/splash/flutterando_splash_page.dart';
import 'package:flutter_playground/src/home/home_page.dart';
import 'package:flutter_playground/src/mockup/mockup_page.dart';
import 'package:flutter_playground/src/mockup/money_screen/money_page.dart';
import 'package:flutter_playground/src/mockup/tinder_screen/tinder_page.dart';
import 'package:flutter_playground/src/playground/playground_screen.dart';
import 'package:flutter_playground/src/routes/constants_router.dart';

void main() {
  runApp(const FlutterandoApp());
}

class FlutterandoApp extends StatelessWidget {
  const FlutterandoApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: splashRoute,
      home: const FlutterandoSplashPage(),
      routes: {
        homeRoute: (context) => const HomePage(),
        playgroundRoute: (context) => const PlaygroundScreen(),
        mockupRoute: (context) => const MockupPage(),
        tinderRoute: (context) => const TinderPage(),
        moneyRoute: (context) => const MoneyPage(),
        animationsRoute: (context) => const AnimationsPage(),
        implicitAnimatedButton: (context) => const ImplicitAnimatedButtonPage(),
        implicitAnimatedList: (context) => const ImplicitAnimatedListPage(),
        implicitAnimationsDemo: (context) => const ImplicitAnimationPageDemo(),
        controlledAnimationsDemo: (context) =>
            const ControlledAnimationsPageDemo(),
        controlledAnimatedButton: (context) =>
            const ControlledAnimatedButtonPage(),
        controlledAnimatedList: (context) => const ControlledAnimatedListPage(),
      },
    );
  }
}

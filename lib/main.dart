import 'package:flutter/material.dart';
import 'package:flutter_playground/animations/animations_page.dart';
import 'package:flutter_playground/animations/controlled/button/controlled_animated_button_page.dart';
import 'package:flutter_playground/animations/controlled/list/controlled_animated_list_page.dart';
import 'package:flutter_playground/animations/demo/controlled_animations_screen_demo.dart';
import 'package:flutter_playground/animations/demo/implicit_animations_screen_demo.dart';
import 'package:flutter_playground/animations/implicit/button/implicit_animated_button_page.dart';
import 'package:flutter_playground/flutterando_page/about/flutterando_about_page.dart';
import 'package:flutter_playground/flutterando_page/splash/flutterando_splash_page.dart';
import 'package:flutter_playground/home/home_page.dart';
import 'package:flutter_playground/mockup/mockup_page.dart';
import 'package:flutter_playground/mockup/money_screen/money_page.dart';
import 'package:flutter_playground/mockup/tinder_screen/tinder_page.dart';
import 'package:flutter_playground/playground/playground_screen.dart';
import 'package:flutter_playground/routes/constants_router.dart';
import 'animations/implicit/list/implicit_animated_list_page.dart';

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
        aboutRoute: (context) => const FlutterandoAboutPage()
      },
    );
  }
}

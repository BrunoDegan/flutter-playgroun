import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_playground/src/animations/animations_page.dart';
import 'package:flutter_playground/src/animations/controlled/button/controlled_animated_button_page.dart';
import 'package:flutter_playground/src/animations/controlled/list/controlled_animated_list_page.dart';
import 'package:flutter_playground/src/animations/demo/controlled_animations_screen_demo.dart';
import 'package:flutter_playground/src/animations/demo/implicit_animations_screen_demo.dart';
import 'package:flutter_playground/src/animations/implicit/button/implicit_animated_button_page.dart';
import 'package:flutter_playground/src/animations/implicit/list/implicit_animated_list_page.dart';
import 'package:flutter_playground/src/flutterando_page/about/datasource/local_datasource.dart';
import 'package:flutter_playground/src/flutterando_page/about/datasource/remote_datasource.dart';
import 'package:flutter_playground/src/flutterando_page/about/repositories/about_repository.dart';
import 'package:flutter_playground/src/flutterando_page/about/services/check_internet_connectivity_service.dart';
import 'package:flutter_playground/src/flutterando_page/about/store/about_screen_store.dart';
import 'package:flutter_playground/src/flutterando_page/splash/flutterando_splash_page.dart';
import 'package:flutter_playground/src/home/home_page.dart';
import 'package:flutter_playground/src/mockup/mockup_page.dart';
import 'package:flutter_playground/src/mockup/money_screen/money_page.dart';
import 'package:flutter_playground/src/mockup/tinder_screen/tinder_page.dart';
import 'package:flutter_playground/src/playground/playground_screen.dart';
import 'package:flutter_playground/src/routes/constants_router.dart';
import 'package:flutter_playground/themes/themes.dart';
import 'package:provider/provider.dart';
import 'src/playground/validador_cpf/validador_cpf_page.dart';

void main() {
  runApp(const FlutterandoApp());
}

class FlutterandoApp extends StatelessWidget {
  const FlutterandoApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider(create: (_) => Dio()),
        Provider(
          create: (context) => RemoteDataSource(
            dio: context.read<Dio>(),
          ),
        ),
        Provider(create: (context) => CheckConnectivityService()),
        Provider(create: (context) => LocalDataSource()),
        Provider(
          create: (context) => AboutRepository(
            remoteDataSource: context.read<RemoteDataSource>(),
            localDataSource: context.read<LocalDataSource>(),
            connectivityService: context.read<CheckConnectivityService>(),
          ),
        ),
        ChangeNotifierProvider(
          create: (context) =>
              AboutPageStore(repository: context.read<AboutRepository>()),
        )
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        initialRoute: splashRoute,
        home: const FlutterandoSplashPage(),
        theme: lightTheme,
        darkTheme: darkTheme,
        themeMode: ThemeMode.system,
        routes: {
          homeRoute: (context) => const HomePage(),
          playgroundRoute: (context) => const PlaygroundScreen(),
          mockupRoute: (context) => const MockupPage(),
          tinderRoute: (context) => const TinderPage(),
          moneyRoute: (context) => const MoneyPage(),
          animationsRoute: (context) => const AnimationsPage(),
          implicitAnimatedButton: (context) =>
              const ImplicitAnimatedButtonPage(),
          implicitAnimatedList: (context) => const ImplicitAnimatedListPage(),
          implicitAnimationsDemo: (context) =>
              const ImplicitAnimationPageDemo(),
          controlledAnimationsDemo: (context) =>
              const ControlledAnimationsPageDemo(),
          controlledAnimatedButton: (context) =>
              const ControlledAnimatedButtonPage(),
          controlledAnimatedList: (context) =>
              const ControlledAnimatedListPage(),
          validadorCpfPlayground: (context) => const ValidadorCpfPage(),
        },
      ),
    );
  }
}

import 'package:flutter/widgets.dart';
import 'package:flutter_playground/routes/constants_router.dart';

class FlutterandoSplashPage extends StatelessWidget {
  const FlutterandoSplashPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    _splashScreenTimer(context: context);
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      color: const Color(0xFF121517),
      child: Center(
          child: Image.asset("assets/flutterando_screen/masterclass_logo.png")),
    );
  }

  _splashScreenTimer({required BuildContext context}) {
    Future.delayed(const Duration(seconds: 3))
        .then((value) => Navigator.of(context).pushReplacementNamed(homeRoute));
  }
}

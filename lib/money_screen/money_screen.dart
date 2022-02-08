import 'package:flutter/material.dart';
import 'package:flutter_playground/money_screen/money_button.dart';
import 'package:flutter_playground/money_screen/money_strings.dart';
import 'package:flutter_svg/flutter_svg.dart';

class MoneyScreen extends StatelessWidget {
  const MoneyScreen({Key? key}) : super(key: key);

  final TextStyle signUpWithEmailTextStyle = const TextStyle(
    fontSize: 18.0,
    fontWeight: FontWeight.bold,
    color: Colors.white,
  );

  final TextStyle signUpWithGoogleTextStyle = const TextStyle(
    fontSize: 18.0,
    fontWeight: FontWeight.w800,
    color: Colors.black87,
  );

  Widget mainContent() {
    return Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const SizedBox(height: 100.0),
          Image.asset(
            "assets/money/money_logo.png",
          ),
          const SizedBox(
            height: 10.0,
          ),
          const Text(moneyControlTitle,
              style: TextStyle(
                fontSize: 30.0,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              )),
          const SizedBox(
            height: 10.0,
          ),
          const Text(
            moneyControlSubTitle,
            style: TextStyle(
              fontSize: 20.0,
              fontWeight: FontWeight.normal,
              color: Colors.white54,
            ),
          ),
          const SizedBox(height: 60.0),
          MoneyButton(
            buttonTitle: moneySignupWithEmailButtonTitle,
            onButtonClicked: () => {},
            backgroundButtonColor: const Color(0xFF5e5ce5),
            textStyle: signUpWithEmailTextStyle,
          ),
          const SizedBox(height: 5.0),
          MoneyButton(
            buttonImage: "assets/money/google_icon.svg",
            buttonTitle: moneySignupButtonWithFacebookButtonTitle,
            onButtonClicked: () => {},
            backgroundButtonColor: Colors.white,
            textStyle: signUpWithGoogleTextStyle,
          ),
        ]);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios),
          tooltip: 'Voltar',
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: mainContent(),
    );
  }
}

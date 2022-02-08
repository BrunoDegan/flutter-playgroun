import 'package:flutter/material.dart';
import 'package:flutter_playground/common/string_formatter.dart';
import 'package:flutter_playground/money_screen/money_button.dart';
import 'package:flutter_playground/money_screen/money_strings.dart';

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

  Widget mainContent(Function(String) clickListener) {
    return Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
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
        moneyControlSubTitle1,
        style: TextStyle(
          fontSize: 20.0,
          fontWeight: FontWeight.normal,
          color: Colors.white54,
        ),
      ),
      const Center(
        child: Text(
          moneyControlSubtitle2,
          style: TextStyle(
            fontSize: 20.0,
            fontWeight: FontWeight.normal,
            color: Colors.white54,
          ),
        ),
      ),
      const SizedBox(height: 60.0),
      MoneyButton(
        buttonTitle: moneySignupWithEmailButtonTitle,
        onButtonClicked: () =>
            {clickListener.call("Logar na conta com email!")},
        backgroundButtonColor: const Color(0xFF5e5ce5),
        textStyle: signUpWithEmailTextStyle,
      ),
      const SizedBox(height: 15.0),
      MoneyButton(
        buttonImage: "assets/money/google_icon.svg",
        buttonTitle: moneySignupButtonWithFacebookButtonTitle,
        onButtonClicked: () =>
            {clickListener.call("Logar na conta com Google!")},
        backgroundButtonColor: Colors.white,
        textStyle: signUpWithGoogleTextStyle,
      ),
      const SizedBox(height: 30.0),
      _formatSubtitle(),
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
        body: Container(
            padding: const EdgeInsets.all(80.0),
            height: double.infinity,
            width: double.infinity,
            child: mainContent((info) {
              ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                  content: Text(info), duration: const Duration(seconds: 1)));
            })));
  }

  RichText _formatSubtitle() {
    return RichText(
      textAlign: TextAlign.center,
      text: TextSpan(
        children: [
          formatStringInfo(info: moneyAlreadyHasAccount1),
          formatStringInfoUnderline(info: moneyAlreadyHasAccount2)
        ],
      ),
    );
  }
}
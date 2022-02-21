// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:flutter_playground/common/text_formatter.dart';
import 'package:flutter_playground/mockup/tinder_screen/tinder_button.dart';
import 'package:flutter_playground/mockup/tinder_screen/tinder_strings.dart';
import 'package:flutter_svg/svg.dart';

final List<Color> _backgroundLinearGradient = [
  const Color.fromARGB(255, 235, 57, 107),
  const Color.fromARGB(226, 221, 107, 118),
];

final BoxDecoration _boxDecoration = BoxDecoration(
  gradient: LinearGradient(
    colors: _backgroundLinearGradient,
    begin: Alignment.centerLeft,
    end: Alignment.centerRight,
  ),
);

Widget _troubleShootingText = Center(
  child: GestureDetector(
      child: const Text(
        "Trouble Signing In?",
        style: TextStyle(
            fontWeight: FontWeight.normal,
            decoration: TextDecoration.none,
            backgroundColor: Colors.transparent,
            color: Colors.white,
            fontStyle: FontStyle.normal,
            fontSize: 15.0),
      ),
      onTap: () => {}),
);

Widget _infoText = Container(
  margin: const EdgeInsets.all(20.0),
  child: RichText(
    textAlign: TextAlign.center,
    text: TextSpan(
      children: [
        formatStringInfo(info: tinderInfoPart1),
        formatStringInfoUnderline(info: tinderInfoTermsLink),
        formatStringInfo(info: tinderInfoPart2),
        formatStringInfoUnderline(info: tinderPrivacyPolicyLink),
        formatStringInfo(info: tinderAnd),
        formatStringInfoUnderline(info: tinderCookiesPolicy)
      ],
    ),
  ),
);

Widget bodyContent(BuildContext context) {
  return Scaffold(
    extendBodyBehindAppBar: true,
    appBar: AppBar(
      elevation: 0,
      backgroundColor: Colors.transparent,
      leading: IconButton(
        icon: const Icon(Icons.arrow_back_ios),
        tooltip: 'Voltar',
        onPressed: () => Navigator.pop(context),
      ),
    ),
    body: mainContent(
        context,
        (info) => {
              ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                  content: Text(info), duration: const Duration(seconds: 1)))
            }),
  );
}

Widget mainContent(BuildContext context, Function(String) onClickListener) {
  return Expanded(
    child: Container(
      padding: const EdgeInsets.all(30.0),
      decoration: _boxDecoration,
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const SizedBox(height: 200.0),
          SvgPicture.asset(
            "assets/tinder/tinder_logo.svg",
            width: 50.0,
            height: 50.0,
          ),
          const SizedBox(
            height: 100.0,
          ),
          _infoText,
          const SizedBox(
            height: 20,
          ),
          TinderButton(
            buttonImage: "assets/tinder/apple_logo.svg",
            buttonTitle: signupWithAppleString,
            onButtonClicked: () {
              onClickListener.call("Logar com Apple!!");
            },
          ),
          const SizedBox(
            height: 10,
          ),
          TinderButton(
            buttonImage: "assets/tinder/facebook_logo.svg",
            buttonTitle: signupWithFacebookString,
            onButtonClicked: () {
              onClickListener.call("Logar com facebook!!");
            },
          ),
          const SizedBox(
            height: 10,
          ),
          TinderButton(
            buttonImage: "assets/tinder/dialog.svg",
            buttonTitle: signupWithPhoneNumberString,
            onButtonClicked: () {
              onClickListener.call("Logar com Tinder!!");
            },
          ),
          const SizedBox(
            height: 20,
          ),
          _troubleShootingText
        ],
      ),
    ),
  );
}

class TinderPage extends StatelessWidget {
  const TinderPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return bodyContent(context);
  }
}

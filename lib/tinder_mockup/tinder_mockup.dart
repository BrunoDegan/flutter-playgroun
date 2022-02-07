import 'package:flutter/material.dart';
import 'package:flutter_playground/common/tinder_strings.dart';
import 'package:flutter_playground/tinder_mockup/strings_constants.dart';
import 'package:flutter_playground/tinder_mockup/tinder_button.dart';
import 'package:flutter_svg/svg.dart';

final List<Color> _backgroundLinearGradient = [
  const Color(0xffea4a77),
  const Color(0xffea5e6c),
];

final BoxDecoration boxDecoration = BoxDecoration(
  gradient: LinearGradient(
    colors: _backgroundLinearGradient,
    begin: Alignment.centerLeft,
    end: Alignment.centerRight,
  ),
);

const Widget troubleShootingText = Center(
  child: Text(
    "Trouble Signing In?",
    style: TextStyle(
        backgroundColor: Colors.white,
        fontStyle: FontStyle.normal,
        fontSize: 20.0),
  ),
);

Widget infoText = Container(
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

class TinderMockup extends StatelessWidget {
  const TinderMockup({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        padding: const EdgeInsets.all(30.0),
        decoration: boxDecoration,
        height: double.infinity,
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SvgPicture.asset("assets/tinder/tinder_logo.svg"),
            infoText,
            const SizedBox(
              height: 20,
            ),
            const TinderButton(
              buttonImage: "assets/tinder/apple_logo.svg",
              buttonTitle: signupWithAppleString.toUpperCase(),
            ),
            const SizedBox(
              height: 10,
            ),
            const TinderButton(
              buttonImage: "assets/tinder/facebook_logo.svg",
              buttonTitle: signupWithFacebookString.toUpperCase(),
            ),
            const SizedBox(
              height: 10,
            ),
            const TinderButton(
              buttonImage: "assets/tinder/logo_tinder.png",
              buttonTitle: signupWithPhoneNumberString.toUpperCase(),
            ),
            const SizedBox(
              height: 20,
            ),
            troubleShootingText
          ],
        ),
      ),
    );
  }
}

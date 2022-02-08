import 'package:flutter/material.dart';

TextSpan formatStringInfo({required String info}) {
  return TextSpan(
    text: info,
    style: const TextStyle(
      fontWeight: FontWeight.normal,
      fontStyle: FontStyle.normal,
      color: Colors.white,
      fontSize: 16,
    ),
  );
}

TextSpan formatStringInfoUnderline({required String info}) {
  return TextSpan(
    text: info,
    style: const TextStyle(
      decoration: TextDecoration.underline,
      fontWeight: FontWeight.normal,
      fontStyle: FontStyle.normal,
      color: Colors.white,
      fontSize: 16,
    ),
  );
}

const String tinderInfoPart1 =
    "By tapping Create Account or Sign In, you agree to our";
const String tinderInfoTermsLink = " Terms";
const String tinderInfoPart2 = ".Learn how we process your data in our ";
const String tinderPrivacyPolicyLink = "Privacy Policy";
const String tinderAnd = " and ";
const String tinderCookiesPolicy = "Cookies Policy.";

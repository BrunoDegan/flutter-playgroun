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

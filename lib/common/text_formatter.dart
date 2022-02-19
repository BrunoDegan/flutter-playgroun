import 'package:flutter/material.dart';
import 'package:flutter_playground/common/strings_constants.dart';

formatStringInfo({required String info}) {
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

formatStringInfoUnderline({required String info}) {
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

getFlutterandoHeaderTitleStyle({required String headerTitle}) {
  return Text(
    headerTitle,
    style: const TextStyle(
      fontFamily: "Poppins-Bold",
      color: Color(0xFFEDF4F8),
      fontSize: 20,
      fontWeight: FontWeight.w400,
    ),
  );
}

getFlutterandoHeaderSubTitleStyle({required String headerSubtitle}) {
  return Text(
    headerSubtitle,
    style: const TextStyle(
      fontFamily: "Poppins-Medium",
      color: Color(0xFFEDF4F8),
      fontSize: 12,
      fontWeight: FontWeight.w400,
    ),
  );
}

getFlutterandoCounterFormatted({required String counterText}) {
  return RichText(
    text: TextSpan(children: <TextSpan>[
      const TextSpan(
        text: flutterandoExercisesCounterTitles,
        style: TextStyle(
            color: Color(0x0051565A), fontSize: 12, fontFamily: "Montserrat"),
      ),
      TextSpan(
        text: counterText,
        style: const TextStyle(
            color: Colors.white, fontSize: 12, fontFamily: "Poppins-Medium"),
      )
    ]),
  );
}

getFlutterandoCardBodyTextFormatted({required String bodyInfo}) {
  return Text(
    bodyInfo,
    style: const TextStyle(
      fontSize: 14.0,
      fontFamily: "Roboto-Regular",
      color: Color(0x0051565A),
    ),
  );
}

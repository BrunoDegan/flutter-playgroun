import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

ElevatedButton HomeButton(
    {required BuildContext context,
    required String buttonText,
    required Function onClicked,
    required int exerciseNumber}) {
  return ElevatedButton(
    style: ButtonStyle(
      backgroundColor: MaterialStateProperty.all(
        const Color(0xFF172026),
      ),
      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
        RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(50.0),
        ),
      ),
    ),
    onPressed: () => {onClicked.call()},
    child: SizedBox(
      width: MediaQuery.of(context).size.width,
      height: 64.0,
      child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
        Container(
          width: 33.0,
          height: 33.0,
          decoration: const BoxDecoration(
              color: Color(0xFF055AA3),
              shape: BoxShape.rectangle,
              borderRadius: BorderRadius.all(Radius.circular(20.0))),
          child: Center(
            child: Text(
              exerciseNumber.toString(),
              textAlign: TextAlign.center,
              style: const TextStyle(
                color: Color(0xFFEDF4F8),
              ),
            ),
          ),
        ),
        Text(
          buttonText,
          textAlign: TextAlign.center,
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.normal,
            fontFamily: "Poppins-Medium",
            color: Color(0xFFEDF4F8),
          ),
        ),
      ]),
    ),
  );
}

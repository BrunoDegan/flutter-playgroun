import 'package:flutter/material.dart';

ElevatedButton HomeButton(
    {required BuildContext context,
    required String buttonText,
    required Function onClicked}) {
  return ElevatedButton(
    onPressed: () => {onClicked.call()},
    child: SizedBox(
      width: MediaQuery.of(context).size.width,
      height: 40,
      child: Center(
        child: Text(buttonText),
      ),
    ),
  );
}

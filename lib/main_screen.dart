import 'package:flutter_playground/routes/constants_router.dart';
import 'package:flutter/material.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({Key? key}) : super(key: key);

  Widget HomeButton(
      {required BuildContext context,
      required String buttonText,
      required Function onClicked}) {
    return ElevatedButton(
      onPressed: () => {onClicked.call()},
      child: SizedBox(
        width: 150,
        height: 40,
        child: Padding(
          padding: const EdgeInsets.all(5.0),
          child: Center(
            child: Text(buttonText),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Flutterando Playground"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            HomeButton(
              context: context,
              buttonText: "Tinder",
              onClicked: () {
                Navigator.of(context).pushNamed(tinderRoute);
              },
            ),
            const SizedBox(
              width: double.infinity,
              height: 10,
            ),
            HomeButton(
              context: context,
              buttonText: "Money Management",
              onClicked: () {
                Navigator.of(context).pushNamed(moneyRoute);
              },
            )
          ],
        ),
      ),
    );
  }
}

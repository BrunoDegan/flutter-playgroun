import 'package:flutter_playground/routes/constants_router.dart';
import 'package:flutter/material.dart';

import 'common/strings_constants.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({Key? key}) : super(key: key);

  Widget HomeButton(
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Flutterando Playground"),
      ),
      body: Center(
        child: ListView(
          padding: const EdgeInsets.all(20.0),
          children: <Widget>[
            HomeButton(
              context: context,
              buttonText: tinderPage,
              onClicked: () {
                Navigator.of(context).pushNamed(tinderRoute);
              },
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width,
              height: 10,
            ),
            HomeButton(
              context: context,
              buttonText: moneyPage,
              onClicked: () {
                Navigator.of(context).pushNamed(moneyRoute);
              },
            ),
            // SizedBox(
            //   width: MediaQuery.of(context).size.width,
            //   height: 10,
            // ),
            // HomeButton(
            //   context: context,
            //   buttonText: demoAnimImplicitPage,
            //   onClicked: () {
            //     Navigator.of(context).pushNamed(implicitAnimationsDemo);
            //   },
            // ),
            // SizedBox(
            //   width: MediaQuery.of(context).size.width,
            //   height: 10,
            // ),
            // HomeButton(
            //   context: context,
            //   buttonText: demoAnimControlledPage,
            //   onClicked: () {
            //     Navigator.of(context).pushNamed(controlledAnimationsDemo);
            //   },
            // ),
            SizedBox(
              width: MediaQuery.of(context).size.width,
              height: 10,
            ),
            HomeButton(
              context: context,
              buttonText: implicitButtonAnimPage,
              onClicked: () {
                Navigator.of(context).pushNamed(implicitAnimatedButton);
              },
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width,
              height: 10,
            ),
            HomeButton(
              context: context,
              buttonText: implicitListAnimPage,
              onClicked: () {
                Navigator.of(context).pushNamed(implicitAnimatedList);
              },
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width,
              height: 10,
            ),
            HomeButton(
              context: context,
              buttonText: controlledButtonAnimPage,
              onClicked: () {
                Navigator.of(context).pushNamed(controlledAnimatedButton);
              },
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width,
              height: 10,
            ),
            HomeButton(
              context: context,
              buttonText: controlledListAnimPage,
              onClicked: () {
                Navigator.of(context).pushNamed(controlledAnimatedList);
              },
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width,
              height: 10,
            ),
            HomeButton(
              context: context,
              buttonText: flutterandoPage,
              onClicked: () {
                Navigator.of(context).pushNamed(flutterandoRoute);
              },
            ),
          ],
        ),
      ),
    );
  }
}

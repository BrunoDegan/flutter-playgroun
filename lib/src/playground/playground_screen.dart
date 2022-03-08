import 'package:flutter_playground/src/common/home_button.dart';
import 'package:flutter_playground/src/routes/constants_router.dart';
import 'package:flutter/material.dart';

import '../common/strings_constants.dart';

class PlaygroundScreen extends StatelessWidget {
  const PlaygroundScreen({Key? key}) : super(key: key);

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
              buttonText: demoAnimImplicitPage,
              exerciseNumber: 1,
              onClicked: () {
                Navigator.of(context).pushNamed(implicitAnimationsDemo);
              },
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width,
              height: 10,
            ),
            HomeButton(
              context: context,
              buttonText: demoAnimControlledPage,
              exerciseNumber: 2,
              onClicked: () {
                Navigator.of(context).pushNamed(controlledAnimationsDemo);
              },
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width,
              height: 10,
            ),
            HomeButton(
              context: context,
              buttonText: cpfValidatorPlayground,
              exerciseNumber: 3,
              onClicked: () {
                Navigator.of(context).pushNamed(validadorCpfPlayground);
              },
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width,
              height: 10,
            )
          ],
        ),
      ),
    );
  }
}

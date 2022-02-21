import 'package:flutter_playground/common/home_button.dart';
import 'package:flutter_playground/routes/constants_router.dart';
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
              onClicked: () {
                Navigator.of(context).pushNamed(controlledAnimationsDemo);
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

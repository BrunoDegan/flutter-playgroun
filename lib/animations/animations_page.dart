import 'package:flutter/material.dart';
import 'package:flutter_playground/common/home_button.dart';
import 'package:flutter_playground/common/strings_constants.dart';
import 'package:flutter_playground/routes/constants_router.dart';

class AnimationsPage extends StatelessWidget {
  const AnimationsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(animationsPage),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios),
          tooltip: 'Voltar',
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: Center(
        child: ListView(
          padding: const EdgeInsets.all(20.0),
          children: <Widget>[
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
          ],
        ),
      ),
    );
  }
}

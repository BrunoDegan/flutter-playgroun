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
        actions: <Widget>[
          Padding(
            padding: const EdgeInsets.only(right: 24.0),
            child: GestureDetector(
              onTap: () {
                //TODO CHANGE THEME
              },
              child: Image.asset(
                "assets/flutterando_screen/moon.png",
                width: 22.0,
                height: 24.0,
                alignment: Alignment.centerRight,
              ),
            ),
          )
        ],
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
              exerciseNumber: 1,
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
              exerciseNumber: 2,
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
              exerciseNumber: 3,
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
              exerciseNumber: 4,
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

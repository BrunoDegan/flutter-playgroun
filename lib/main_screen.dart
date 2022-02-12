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
              buttonText: "Tela Tinder",
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
              buttonText: "Tela Money Management",
              onClicked: () {
                Navigator.of(context).pushNamed(moneyRoute);
              },
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width,
              height: 10,
            ),
            HomeButton(
              context: context,
              buttonText: "Demo Aula de animações implícitas",
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
              buttonText: "Demo Aula de animações controladas",
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
              buttonText: "Desafio Animações implícitas do botão",
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
              buttonText: "Desafio Animações implicitas da lista",
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
              buttonText: "Desafio Animações controladas do botão",
              onClicked: () {
                Navigator.of(context).pushNamed(controlledAnimatedButton);
              },
            ),
          ],
        ),
      ),
    );
  }
}

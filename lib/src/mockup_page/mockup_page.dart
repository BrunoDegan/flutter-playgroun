import 'package:flutter/material.dart';
import 'package:flutter_playground/src/common/home_button.dart';
import 'package:flutter_playground/src/common/strings_constants.dart';
import 'package:flutter_playground/src/routes/constants_router.dart';

class MockupPage extends StatefulWidget {
  const MockupPage({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _MockupPageState();
}

class _MockupPageState extends State<MockupPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios),
          tooltip: 'Voltar',
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text(flutterandoMockupRead),
        actions: <Widget>[
          Padding(
            padding: const EdgeInsets.only(right: 24.0),
            child: GestureDetector(
              onTap: () {
                //TODO CHANGE THEME
              },
              child: Image.asset(
                'assets/flutterando_screen/moon.png',
                alignment: Alignment.centerRight,
                width: 22.0,
                height: 24.0,
              ),
            ),
          )
        ],
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
              buttonText: tinderPage,
              exerciseNumber: 1,
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
              exerciseNumber: 2,
              onClicked: () {
                Navigator.of(context).pushNamed(moneyRoute);
              },
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width,
              height: 10,
            ),
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_playground/common/home_button.dart';
import 'package:flutter_playground/common/strings_constants.dart';
import 'package:flutter_playground/routes/constants_router.dart';

class MockupPage extends StatelessWidget {
  const MockupPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(animationsPage),
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

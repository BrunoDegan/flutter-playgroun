import 'package:flutter_playground/routes/constants_router.dart';
import 'package:flutter/material.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Flutterando Playground"),
        actions: [
          IconButton(
            icon: Icon(),
            tooltip: 'Voltar',
            onPressed: () => Navigator.pop(context),
          ),
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ElevatedButton(
              onPressed: () => {
                Navigator.of(context).pushNamed(tinderRoute),
              },
              child: const Text("Tinder Page"),
            ),
            const SizedBox(
              width: double.infinity,
              height: 10,
            ),
            ElevatedButton(
              onPressed: () => {
                Navigator.of(context).pushNamed(moneyRoute),
              },
              child: const Text("Money Management Page"),
            )
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';

class ImplicitAnimationPageDemo extends StatefulWidget {
  const ImplicitAnimationPageDemo({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _ImplicitAnimationPageStateDemo();
}

class _ImplicitAnimationPageStateDemo extends State<ImplicitAnimationPageDemo> {
  bool _isExpanded = false;
  final Duration _duration = const Duration(milliseconds: 500);
  final Curve _curve = Curves.ease;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Implicit Animations"),
      ),
      body: AnimatedAlign(
        alignment: _isExpanded ? Alignment.center : Alignment.bottomCenter,
        duration: _duration,
        child: GestureDetector(
          onTap: () {
            setState(() {
              _isExpanded = !_isExpanded;
            });
          },
          child: AnimatedScale(
            curve: _curve,
            scale: _isExpanded ? 5 : 1,
            duration: _duration,
            child: AnimatedContainer(
              duration: _duration,
              alignment: Alignment.center,
              width: _isExpanded ? 150 : 100,
              height: _isExpanded ? 150 : 100,
              child: const Text(
                "Flutterando",
                style: TextStyle(
                  color: Colors.blue,
                  decorationStyle: TextDecorationStyle.solid,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

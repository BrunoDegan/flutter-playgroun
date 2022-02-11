import 'package:flutter/material.dart';

class ImplicitAnimationScreenDemo extends StatefulWidget {
  const ImplicitAnimationScreenDemo({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _ImplicitAnimationPageStateDemo();
}

class _ImplicitAnimationPageStateDemo
    extends State<ImplicitAnimationScreenDemo> {
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
                  scale: _isExpanded ? 10 : 1,
                  duration: _duration,
                  child: AnimatedContainer(
                      duration: _duration,
                      alignment: Alignment.center,
                      width: _isExpanded ? 100 : 50,
                      height: _isExpanded ? 100 : 50,
                      child: const Center(child: Text("Flutterando")))),
            )));
  }
}

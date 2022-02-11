import 'package:flutter/material.dart';

class ControlledAnimationsPage extends StatefulWidget {
  const ControlledAnimationsPage({Key? key}) : super(key: key);

  @override
  _ControlledAnimationState createState() => _ControlledAnimationState();
}

class _ControlledAnimationState extends State<ControlledAnimationsPage>
    with TickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<Size?> sizeAnimation;
  late Animation<Color?> colorAnimation;
  final Duration _duration = const Duration(seconds: 4);

  void onToggle() {
    if (_controller.value == 0) {
      _controller.forward(from: 0.5);
    } else if (_controller.value == 0.5) {
      _controller.forward();
      //_controller.repeat(5);
    } else {
      _controller.reverse();
    }
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this, duration: _duration);

    sizeAnimation =
        SizeTween(begin: const Size(50, 50), end: const Size(100, 100))
            .animate(_controller);

    colorAnimation =
        ColorTween(begin: Colors.pink, end: Colors.blue).animate(_controller);

    _controller.addListener(() {
      print(_controller.value);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text("Controlled Animations")),
        body: Center(
            child: AnimatedBuilder(
                animation: _controller,
                builder: (context, child) {
                  return GestureDetector(
                    onTap: onToggle,
                    child: Container(
                      width: sizeAnimation.value?.width,
                      height: sizeAnimation.value?.height,
                      color: colorAnimation.value,
                      child: child,
                    ),
                  );
                })));
  }
}

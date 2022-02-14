import 'package:flutter/material.dart';

class ControlledAnimatedButtonPage extends StatefulWidget {
  const ControlledAnimatedButtonPage({Key? key}) : super(key: key);

  @override
  _ControlledAnimatedButtonPageState createState() =>
      _ControlledAnimatedButtonPageState();
}

class _ControlledAnimatedButtonPageState
    extends State<ControlledAnimatedButtonPage> with TickerProviderStateMixin {
  late Animation<Size?> _sizeAnimation;
  late Animation<BorderRadius?> _radiusAnimation;
  late Animation<AlignmentGeometry?> _alignmentAnimation;
  final Curve _curve = Curves.linear;

  late AnimationController _controller;
  final Duration _duration = const Duration(milliseconds: 500);

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this, duration: _duration);
    _createAnimations();
  }

  void _createAnimations() {
    _sizeAnimation = SizeTween(
      begin: const Size(80, 80),
      end: const Size(120, 60),
    ).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Interval(0.2, 1.0, curve: _curve),
      ),
    );

    _radiusAnimation = BorderRadiusTween(
      begin: const BorderRadius.all(
        Radius.circular(50.0),
      ),
      end: const BorderRadius.all(
        Radius.zero,
      ),
    ).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Interval(0.2, 1.0, curve: _curve),
      ),
    );

    _alignmentAnimation = AlignmentTween(
      begin: Alignment.bottomRight,
      end: Alignment.topCenter,
    ).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Interval(0.0, 1.0, curve: _curve),
      ),
    );
  }

  toggleControlledAnimation() {
    if (_controller.isCompleted || _controller.isAnimating) {
      _controller.reverse();
    } else {
      _controller.forward();
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Desafio Animação controlada - Botão"),
        leading: IconButton(
          tooltip: 'Voltar',
          icon: const Icon(Icons.arrow_back_ios),
          onPressed: () {
            _controller.dispose();
            Navigator.of(context).pop();
          },
        ),
      ),
      body: SafeArea(
        child: AnimatedBuilder(
            animation: _controller,
            builder: (context, child) {
              return GestureDetector(
                onTap: toggleControlledAnimation,
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Align(
                    alignment: _alignmentAnimation.value!,
                    child: Container(
                      width: _sizeAnimation.value?.width,
                      height: _sizeAnimation.value?.height,
                      decoration: BoxDecoration(
                        borderRadius: _radiusAnimation.value,
                        color: Colors.blue,
                      ),
                    ),
                  ),
                ),
              );
            }),
      ),
    );
  }
}

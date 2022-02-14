import 'dart:html';

import 'package:flutter/material.dart';

import '../../data/list_data.dart';

class ControlledAnimatedListTile extends StatefulWidget {
  final ListData animationData;
  ControlledAnimatedListTile({Key? key, required this.animationData});

  @override
  State<StatefulWidget> createState() =>
      _ControlledAnimatedListTileState(data: animationData);
}

class _ControlledAnimatedListTileState extends State<ControlledAnimatedListTile>
    with TickerProviderStateMixin {
  bool _isPressed = false;
  final Duration _duration = const Duration(milliseconds: 500);
  final _curve = Curves.linear;
  final ListData data;

  late AnimationController _animatedController;
  late Animation<Color?> _colorAnimation;
  late Animation<double> _opacityAnimation;
  late Animation<double> _sizeAnimation;
  late Animation<double> _rotateIconAnimation;

  _ControlledAnimatedListTileState({required this.data});

  @override
  void initState() {
    _animatedController = AnimationController(
      vsync: this,
      duration: _duration,
    );
    _createAnimations();
    super.initState();
  }

  void _createAnimations() {
    _colorAnimation = ColorTween(
      begin: Colors.grey,
      end: Colors.blue,
    ).animate(
      CurvedAnimation(
        parent: _animatedController,
        curve: Interval(
          0.0,
          0.2,
          curve: _curve,
        ),
      ),
    );

    _sizeAnimation = Tween<double>(
      begin: 0,
      end: 1,
    ).animate(
      CurvedAnimation(
        parent: _animatedController,
        curve: Interval(
          0.0,
          1.0,
          curve: _curve,
        ),
      ),
    );

    _opacityAnimation = Tween<double>(
      begin: 0.0,
      end: 1.0,
    ).animate(
      CurvedAnimation(
        parent: _animatedController,
        curve: Interval(
          0.2,
          0.4,
          curve: _curve,
        ),
      ),
    );

    _rotateIconAnimation = Tween<double>(
      begin: 0.0,
      end: -0.5,
    ).animate(
      CurvedAnimation(
        parent: _animatedController,
        curve: Interval(
          0.0,
          0.5,
          curve: _curve,
        ),
      ),
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _animatedController,
      builder: (context, child) {
        return GestureDetector(
          child: _bodyWidget(),
          onTap: () => _toggleButtonClicked,
        );
      },
    );
  }

  _toggleControlledAnimation() {
    if (_animatedController.value == 0) {
      _animatedController.forward();
    } else {
      _animatedController.reverse();
    }
  }

  _toggleButtonClicked() => setState(() {
        _isPressed = !_isPressed;
        _toggleControlledAnimation();
      });

  @override
  void dispose() {
    _animatedController.dispose();
    super.dispose();
  }

  _bodyWidget() {
    return SizedBox(
      child: Card(
        elevation: _isPressed ? 1 : 0,
        margin: const EdgeInsets.symmetric(vertical: 5.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(5),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Expanded(
                    child: Text(
                      data.title,
                      style: TextStyle(
                        color: _colorAnimation.value,
                      ),
                    ),
                  ),
                  RotationTransition(
                    turns: _rotateIconAnimation,
                    child: IconButton(
                      onPressed: _toggleButtonClicked,
                      icon: Icon(
                        Icons.keyboard_arrow_down,
                        color: _colorAnimation.value!,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            ClipRect(
              child: Align(
                heightFactor: _sizeAnimation.value,
                child: _animatedBody(),
              ),
            )
          ],
        ),
      ),
    );
  }

  _animatedBody() => Padding(
        padding: const EdgeInsets.only(bottom: 20),
        child: SingleChildScrollView(
          child: Opacity(
            opacity: _opacityAnimation.value,
            child: Column(
              children: [
                const FlutterLogo(
                  size: 40,
                ),
                const SizedBox(
                  height: 15,
                ),
                Text(
                  data.description,
                  textAlign: TextAlign.justify,
                ),
              ],
            ),
          ),
        ),
      );
}

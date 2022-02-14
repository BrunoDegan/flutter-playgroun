import 'package:flutter/material.dart';
import 'package:flutter_playground/animations/data/list_data.dart';

class ImplicitAnimatedTile extends StatefulWidget {
  final ListData animationData;

  const ImplicitAnimatedTile({Key? key, required this.animationData});

  @override
  State<StatefulWidget> createState() =>
      _ImplicitAnimatedState(data: animationData);
}

class _ImplicitAnimatedState extends State<ImplicitAnimatedTile> {
  bool _isPressed = false;
  final Duration _duration = const Duration(milliseconds: 500);
  final ListData data;

  _ImplicitAnimatedState({required this.data});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: rowTileWidget(),
      onTap: () {
        setState(() {
          _isPressed = !_isPressed;
        });
      },
    );
  }

  Widget rowTileWidget() {
    return Card(
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
                    style: _isPressed
                        ? const TextStyle(color: Colors.blueAccent)
                        : const TextStyle(color: Colors.grey),
                  ),
                ),
                AnimatedRotation(
                  turns: _isPressed ? -0.5 : 0.0,
                  duration: _duration,
                  child: IconButton(
                    onPressed: toggleButtonClicked,
                    icon: _isPressed ? getArrowDownward() : getArrowUpward(),
                  ),
                )
              ],
            ),
          ),
          _animatedBodyContainer()
        ],
      ),
    );
  }

  getArrowDownward() => const Icon(
        Icons.keyboard_arrow_down_rounded,
        color: Colors.blue,
      );

  getArrowUpward() => const Icon(
        Icons.keyboard_arrow_down_rounded,
        color: Colors.grey,
      );

  toggleButtonClicked() => setState(
        () {
          _isPressed = !_isPressed;
        },
      );

  _animatedBodyContainer() {
    return AnimatedContainer(
      duration: _duration,
      height: _isPressed ? 300 : 0,
      child: SingleChildScrollView(
        child: Padding(
            padding: const EdgeInsets.only(left: 20, right: 20),
            child: _animatedBodyOpacity()),
      ),
    );
  }

  _animatedBodyOpacity() {
    return AnimatedOpacity(
      opacity: _isPressed ? 1 : 0,
      duration: _duration,
      child: Column(
        children: [
          const FlutterLogo(size: 40),
          const SizedBox(height: 15),
          Text(data.description, textAlign: TextAlign.justify),
        ],
      ),
    );
  }
}

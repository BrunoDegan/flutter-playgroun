import 'package:flutter/material.dart';

class ImplicitAnimatedButtonPage extends StatefulWidget {
  const ImplicitAnimatedButtonPage({Key? key}) : super(key: key);

  @override
  _ImplicitAnimatedButtonState createState() => _ImplicitAnimatedButtonState();
}

class _ImplicitAnimatedButtonState extends State<ImplicitAnimatedButtonPage> {
  bool _isPressed = false;
  final Duration _duration = const Duration(seconds: 1);
  final Curve _curve = Curves.easeIn;
  final _circleRadiusPressed = const Radius.circular(0.0);
  final _circleRadiusUnpressed = const Radius.circular(40.0);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Desafio Animação implicita - Botão flutuante"),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios),
          tooltip: 'Voltar',
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: AnimatedAlign(
            alignment: _isPressed ? Alignment.topCenter : Alignment.bottomRight,
            duration: _duration,
            child: GestureDetector(
              onTap: () {
                setState(() {
                  _isPressed = !_isPressed;
                });
              },
              child: AnimatedContainer(
                curve: _curve,
                width: _isPressed ? 100 : 80,
                height: _isPressed ? 50 : 80,
                decoration: BoxDecoration(
                    shape: BoxShape.rectangle,
                    color: Colors.blue,
                    borderRadius: BorderRadius.all(_isPressed
                        ? _circleRadiusPressed
                        : _circleRadiusUnpressed)),
                duration: _duration,
                alignment: Alignment.bottomRight,
              ),
            ),
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class TinderButton extends StatelessWidget {
  final String buttonImage;
  final String buttonTitle;
  final Function onButtonClicked;
  late double screenWidth;

  TinderButton(
      {Key? key,
      required this.buttonImage,
      required this.buttonTitle,
      required this.onButtonClicked})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    screenWidth = MediaQuery.of(context).size.width;

    return GestureDetector(
      onTap: () => {onButtonClicked.call()},
      child: Container(
        width: screenWidth,
        height: 50.0,
        decoration: BoxDecoration(
          color: Colors.transparent,
          shape: BoxShape.rectangle,
          borderRadius: BorderRadius.circular(30.0),
          border: Border.all(
              color: Colors.white, width: 2.0, style: BorderStyle.solid),
        ),
        child: Padding(
          padding: const EdgeInsets.all(14.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SvgPicture.asset(
                buttonImage,
                width: 30.0,
                height: 30.0,
              ),
              const Spacer(),
              Text(
                buttonTitle,
                style: const TextStyle(
                  decoration: TextDecoration.none,
                  color: Colors.white,
                  fontWeight: FontWeight.w400,
                  wordSpacing: 1.5,
                  letterSpacing: 2.0,
                  fontSize: 14.0,
                ),
              ),
              const Spacer(),
            ],
          ),
        ),
      ),
    );
  }
}

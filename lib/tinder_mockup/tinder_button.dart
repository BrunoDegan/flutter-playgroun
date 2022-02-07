import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class TinderButton extends StatelessWidget {
  final String buttonImage;
  final String buttonTitle;

  const TinderButton(
      {Key? key, required this.buttonImage, required this.buttonTitle})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40,
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.transparent,
        shape: BoxShape.rectangle,
        border: Border.all(
            color: Colors.transparent, width: 2.0, style: BorderStyle.solid),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset(
              buttonImage,
              width: 25,
              height: 25,
            ),
            const Spacer(),
            Text(
              buttonTitle,
              style: const TextStyle(
                  fontWeight: FontWeight.w300,
                  backgroundColor: Colors.white,
                  letterSpacing: 1.0,
                  fontSize: 14.0),
            ),
            const Spacer(),
          ],
        ),
      ),
    );
  }
}

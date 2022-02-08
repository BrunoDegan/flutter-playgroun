import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class MoneyButton extends StatelessWidget {
  final String? buttonImage;
  final String buttonTitle;
  final Function onButtonClicked;
  final Color backgroundButtonColor;
  final TextStyle textStyle;

  const MoneyButton(
      {Key? key,
      this.buttonImage,
      required this.buttonTitle,
      required this.onButtonClicked,
      required this.backgroundButtonColor,
      required this.textStyle})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(onTap: () => {}, child: containerButton());
  }

  List<Widget> handleButtonType() {
    if (buttonImage != null) {
      return [
        SvgPicture.asset(
          buttonImage!,
          height: 35.0,
        ),
        const Spacer(),
        Text(
          buttonTitle,
          style: textStyle,
        ),
        const Spacer(),
      ];
    } else {
      return [
        Text(
          buttonTitle,
          style: textStyle,
        ),
        const Spacer(),
      ];
    }
  }

  Widget containerButton() {
    return Container(
      decoration: BoxDecoration(
          color: backgroundButtonColor,
          shape: BoxShape.rectangle,
          borderRadius: BorderRadius.circular(5.0)),
      height: 50.0,
      width: double.infinity,
      child: Padding(
          padding: const EdgeInsets.all(10),
          child: Center(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: handleButtonType(),
            ),
          )),
    );
  }
}

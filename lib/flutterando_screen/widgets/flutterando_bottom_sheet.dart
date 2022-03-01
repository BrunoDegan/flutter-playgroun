import 'package:flutter/material.dart';
import 'package:flutter_playground/common/strings_constants.dart';
import 'package:flutter_playground/routes/constants_router.dart';

_handleBackgroundImage(String? imagePath) {
  if (imagePath != null) {
    return Image.asset(
      imagePath,
      width: 20,
      height: 20,
    );
  } else {
    return const Icon(Icons.person);
  }
}

_createBottomSheetButton(
    {required String buttonTextTitle,
    String? imagePath,
    IconData? materialIcon,
    required Function onClicked}) {
  return ElevatedButton(
    style: ButtonStyle(
      backgroundColor:
          MaterialStateProperty.all<Color>(const Color(0XFF121517)),
    ),
    onPressed: () => onClicked.call(),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        _handleBackgroundImage(imagePath),
        Padding(
          padding: const EdgeInsets.only(top: 10, bottom: 10),
          child: Text(
            buttonTextTitle,
            style: const TextStyle(fontFamily: "Montserrat"),
          ),
        ),
      ],
    ),
  );
}

Widget bottomButtonNav(BuildContext context) {
  return Container(
    width: MediaQuery.of(context).size.width,
    height: 80,
    color: const Color(0XFF121517),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        _createBottomSheetButton(
          imagePath: "assets/flutterando_screen/activities_icon.png",
          buttonTextTitle: flutterandoBottomsheetTitle1,
          onClicked: () {
            //TODO criar as outras paginas do bottom navigator
          },
        ),
        Container(
          color: Colors.white,
          width: 0.5,
          height: 50,
        ),
        _createBottomSheetButton(
          imagePath: "assets/flutterando_screen/github_icon.png",
          buttonTextTitle: flutterandoBottomsheetTitle2,
          onClicked: () {
            //TODO criar as outras paginas do bottom navigator
          },
        ),
        Container(
          color: Colors.white,
          width: 0.5,
          height: 50,
        ),
        _createBottomSheetButton(
          materialIcon: Icons.person,
          buttonTextTitle: flutterandoBottomsheetTitle3,
          onClicked: () {
            Navigator.of(context).pushNamed(aboutRoute);
          },
        )
      ],
    ),
  );
}

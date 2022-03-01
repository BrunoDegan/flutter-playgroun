import 'package:flutter/material.dart';
import 'package:flutter_playground/common/strings_constants.dart';
import 'package:flutter_playground/common/text_formatter.dart';

class FlutterandoTopBarWidget extends StatelessWidget {
  Function onTopBarButtonClickListener;

  FlutterandoTopBarWidget({Key? key, required this.onTopBarButtonClickListener})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.only(top: 10, left: 20, right: 10),
        child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Image.asset("assets/flutterando_screen/logo.png"),
                  const SizedBox(width: 10),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      getFlutterandoHeaderTitleStyle(
                        headerTitle: flutterandoActivitiesTitle,
                      ),
                      getFlutterandoHeaderSubTitleStyle(
                        headerSubtitle: flutterandoActivitiesSubTitle,
                      )
                    ],
                  ),
                ],
              ),
              IconButton(
                icon: Image.asset(
                  "assets/flutterando_screen/moon.png",
                  width: 22.0,
                  height: 24.0,
                  alignment: Alignment.centerRight,
                ),
                onPressed: () {
                  onTopBarButtonClickListener.call();
                },
              ),
            ]),
      ),
    );
  }
}

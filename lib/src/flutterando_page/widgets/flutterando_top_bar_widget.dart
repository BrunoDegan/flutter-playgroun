import 'package:flutter/material.dart';
import 'package:flutter_playground/src/common/strings_constants.dart';
import 'package:flutter_playground/src/common/text_formatter.dart';

class FlutterandoTopBarWidget extends StatefulWidget {
  Function onTopBarButtonClickListener;

  @override
  State<StatefulWidget> createState() => _FlutterandoTopBarWidgetState();

  FlutterandoTopBarWidget({Key? key, required this.onTopBarButtonClickListener})
      : super(key: key);
}

class _FlutterandoTopBarWidgetState extends State<FlutterandoTopBarWidget> {
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
                  widget.onTopBarButtonClickListener.call();
                },
              ),
            ]),
      ),
    );
  }
}

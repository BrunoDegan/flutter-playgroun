import 'package:flutter/material.dart';
import 'package:flutter_playground/src/flutterando_page/about/model/flutterando_about_model.dart';
import 'package:flutter_playground/src/flutterando_page/about/skills/skills_list_tile.dart';
import 'package:flutter_playground/src/flutterando_page/strings/flutterando_strings.dart';

class SkillsWidget extends StatefulWidget {
  final FlutterandoAboutModel data;

  const SkillsWidget({Key? key, required this.data}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _SkillWidgetState();
}

class _SkillWidgetState extends State<SkillsWidget> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
          padding: EdgeInsets.only(left: 14.0, bottom: 8.0),
          child: Text(
            SKILLS,
            style: TextStyle(
              fontFamily: "Poppins-Medium",
              fontWeight: FontWeight.w400,
              fontSize: 14.0,
              color: Color(
                0xFFEDF4F8,
              ),
            ),
          ),
        ),
        Container(
          alignment: Alignment.center,
          decoration: const BoxDecoration(
            color: Color(0xFF172026),
            shape: BoxShape.rectangle,
            borderRadius: BorderRadius.all(
              Radius.circular(30.0),
            ),
          ),
          child: Expanded(
            child: ListView.builder(
              itemCount: widget.data.skillsList.length,
              shrinkWrap: true,
              scrollDirection: Axis.vertical,
              itemBuilder: (context, pos) {
                return SkillsListTile(data: widget.data.skillsList[pos]);
              },
              padding: const EdgeInsets.only(
                  top: 14.0, bottom: 14.0, left: 15, right: 15),
            ),
          ),
        )
      ],
    );
  }
}

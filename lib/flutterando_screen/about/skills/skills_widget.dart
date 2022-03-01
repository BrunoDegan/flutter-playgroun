import 'package:flutter/material.dart';
import 'package:flutter_playground/flutterando_screen/about/data/flutterando_about_data.dart';
import 'package:flutter_playground/flutterando_screen/about/skills/skills_list_tile.dart';
import 'package:flutter_playground/flutterando_screen/strings/flutterando_strings.dart';

class SkillsWidget extends StatelessWidget {
  final FlutterandoAboutData data;

  const SkillsWidget({Key? key, required this.data}) : super(key: key);

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
              itemCount: data.skillsList.length,
              shrinkWrap: true,
              scrollDirection: Axis.vertical,
              itemBuilder: (context, pos) {
                return SkillsListTile(data: data.skillsList[pos]);
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

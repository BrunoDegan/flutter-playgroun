import 'package:flutter/material.dart';
import 'package:flutter_playground/flutterando_screen/about/data/flutterando_about_data.dart';
import 'package:flutter_playground/flutterando_screen/about/skills/skills_list_tile.dart';
import 'package:flutter_playground/flutterando_screen/strings/flutterando_strings.dart';

class SkillsWidget extends StatelessWidget {
  final FlutterandoAboutData data;

  const SkillsWidget({Key? key, required this.data}) : super(key: key);

  _skillsContainer() {
    return Container(
      alignment: Alignment.center,
      decoration: const BoxDecoration(
        color: Color(0xFF172026),
        shape: BoxShape.rectangle,
        borderRadius: BorderRadius.all(
          Radius.circular(5.0),
        ),
      ),
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, pos) {
          return SkillsListTile(data: data.skillsList[pos]);
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          SKILLS,
          style: TextStyle(
            fontFamily: "Poppins-Medium",
            fontWeight: FontWeight.w300,
            fontSize: 14.0,
            color: Color(
              0xFFEDF4F8,
            ),
          ),
        ),
        _skillsContainer()
      ],
    );
  }
}

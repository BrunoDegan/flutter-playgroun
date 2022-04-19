import 'package:flutter/material.dart';
import 'package:flutter_playground/src/about_page/domain/model/about_model.dart';
import 'package:flutter_playground/src/about_page/skills/skills_list_tile.dart';
import 'package:flutter_playground/src/main_page/strings/flutterando_strings.dart';

class SkillsWidget extends StatefulWidget {
  final AboutModel model;
  const SkillsWidget({Key? key, required this.model}) : super(key: key);

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
              fontFamily: 'Poppins-Medium',
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
          child: ListView.builder(
            itemCount: widget.model.skills.length,
            shrinkWrap: true,
            scrollDirection: Axis.vertical,
            itemBuilder: (context, pos) {
              return SkillsListTile(data: widget.model.skills[pos]);
            },
            padding: const EdgeInsets.only(
                top: 14.0, bottom: 14.0, left: 15, right: 15),
          ),
        )
      ],
    );
  }
}

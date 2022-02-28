import 'package:flutter/material.dart';
import 'package:flutter_playground/flutterando_screen/about/data/flutterando_skill_data.dart';

class SkillsListTile extends StatelessWidget {
  Skills data;
  SkillsListTile({Key? key, required this.data}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Padding(
          padding: const EdgeInsets.only(
            left: 28,
            right: 48,
          ),
          child: Text(
            data.title,
            style: const TextStyle(
              color: Color(0xFF51565A),
              fontFamily: "Poppins-Medium",
              fontSize: 12.0,
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(right: 13.0),
          child: LinearProgressIndicator(
            backgroundColor: const Color(0xFF0D0E0F),
            color: const Color(0xFF055AA3),
            value: data.percentage / 100,
          ),
        ),
      ],
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_playground/src/flutterando_page/about/model/skill_model.dart';

class SkillsListTile extends StatelessWidget {
  final SkillsModel data;
  const SkillsListTile({Key? key, required this.data}) : super(key: key);

  _progressBar(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width / 3,
      height: 10,
      margin: const EdgeInsets.symmetric(vertical: 5, horizontal: 5),
      child: ClipRRect(
        clipBehavior: Clip.antiAlias,
        borderRadius: const BorderRadius.all(Radius.circular(50)),
        child: LinearProgressIndicator(
          backgroundColor: const Color(0xFF0D0E0F),
          color: const Color(0xFF055AA3),
          value: data.percentage / 100,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 2, bottom: 2),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            data.title,
            style: const TextStyle(
              color: Color(0xFF51565A),
              fontFamily: "Poppins-Medium",
              fontSize: 12.0,
            ),
          ),
          _progressBar(context)
        ],
      ),
    );
  }
}

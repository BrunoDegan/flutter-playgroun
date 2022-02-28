import 'package:flutter/material.dart';
import 'package:flutter_playground/flutterando_screen/about/about_card_widget.dart';
import 'package:flutter_playground/flutterando_screen/about/datasource/AboutPageDataSource.dart';
import 'package:flutter_playground/flutterando_screen/about/favorites/favorites_widget.dart';
import 'package:flutter_playground/flutterando_screen/about/repositories/AboutPageRepository.dart';
import 'package:flutter_playground/flutterando_screen/about/skills/skills_widget.dart';

class FlutterandoAboutPage extends StatefulWidget {
  const FlutterandoAboutPage({Key? key}) : super(key: key);

  @override
  State<FlutterandoAboutPage> createState() => _FlutterandoAboutPageState();
}

class _FlutterandoAboutPageState extends State<FlutterandoAboutPage> {
  AboutPageRepository repository =
      AboutPageRepository(dataSource: AboutPageDataSource());

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color(0xFF121517),
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      child: Column(
        children: [
          AboutCardWidget(
            data: repository.provideData(),
          ),
          const SizedBox(
            height: 20,
          ),
          FavoritesWidget(data: repository.provideData()),
          const SizedBox(
            height: 20,
          ),
          SkillsWidget(
            data: repository.provideData(),
          ),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_playground/flutterando_page/about/datasource/AboutPageDataSource.dart';
import 'package:flutter_playground/flutterando_page/about/favorites/favorites_widget.dart';
import 'package:flutter_playground/flutterando_page/about/profile_info/about_card_widget.dart';
import 'package:flutter_playground/flutterando_page/about/repositories/AboutPageRepository.dart';
import 'package:flutter_playground/flutterando_page/about/skills/skills_widget.dart';
import 'package:flutter_playground/flutterando_page/widgets/flutterando_top_bar_widget.dart';

class FlutterandoAboutPage extends StatefulWidget {
  const FlutterandoAboutPage({Key? key}) : super(key: key);

  @override
  State<FlutterandoAboutPage> createState() => _FlutterandoAboutPageState();
}

class _FlutterandoAboutPageState extends State<FlutterandoAboutPage> {
  AboutPageRepository repository = AboutPageRepository(
    dataSource: AboutPageDataSource(),
  );

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        _bodyWidget(),
        FlutterandoTopBarWidget(
          onTopBarButtonClickListener: () {
            //TODO
          },
        ),
      ],
    );
  }

  _bodyWidget() {
    return Container(
      padding: const EdgeInsets.only(
        left: 15.0,
        right: 15.0,
        top: 100.0,
        bottom: 0.0,
      ),
      color: const Color(0xFF121517),
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      child: ListView(
        children: [
          AboutCardWidget(
            data: repository.provideData(),
          ),
          const SizedBox(
            height: 20,
          ),
          FavoritesWidget(
            data: repository.provideData(),
          ),
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

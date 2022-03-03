
import 'package:flutter_playground/src/flutterando_page/about/model/flutterando_favorites_model.dart';
import 'package:flutter_playground/src/flutterando_page/about/model/flutterando_skill_model.dart';

class FlutterandoAboutModel {
  final String userName;
  final String userImagePath;
  final String description;
  final List<SkillsModel> skillsList;
  final List<FlutterandoFavoritesModel> favorites;

  FlutterandoAboutModel(
      {required this.userImagePath,
      required this.userName,
      required this.description,
      required this.skillsList,
      required this.favorites});
}

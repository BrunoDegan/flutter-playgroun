
import 'package:flutter_playground/flutterando_page/about/model/flutterando_favorites_model.dart';
import 'package:flutter_playground/flutterando_page/about/model/flutterando_skill_model.dart';

class FlutterandoAboutModel {
  String userName;
  String userImagePath;
  String description;
  List<SkillsModel> skillsList;
  List<FlutterandoFavoritesModel> favorites;

  FlutterandoAboutModel(
      {required this.userImagePath,
      required this.userName,
      required this.description,
      required this.skillsList,
      required this.favorites});
}

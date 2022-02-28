import 'package:flutter_playground/flutterando_screen/about/data/flutterando_favorites.dart';
import 'package:flutter_playground/flutterando_screen/about/data/flutterando_skill_data.dart';

class FlutterandoAboutData {
  String userName;
  String userImagePath;
  String description;
  List<Skills> skillsList;
  List<FlutterandoFavorites> favorites;

  FlutterandoAboutData(
      {required this.userImagePath,
      required this.userName,
      required this.description,
      required this.skillsList,
      required this.favorites});
}

import 'package:flutter_playground/src/flutterando_page/about/model/favorites_model.dart';
import 'package:flutter_playground/src/flutterando_page/about/model/skill_model.dart';

class AboutModel {
  late String _userImagePath;
  late String _userName;
  late String _description;
  late List<SkillsModel> _skills;
  late List<FavoritesModel> _favorites;

  String get userImagePath => _userImagePath;
  String get userName => _userName;
  String get description => _description;
  List<SkillsModel> get skills => _skills;
  List<FavoritesModel> get favorites => _favorites;

  AboutModel(
      {required String userImagePath,
      required String userName,
      required String description,
      required List<SkillsModel> skills,
      required List<FavoritesModel> favorites}) {
    _userImagePath = userImagePath;
    _userName = userName;
    _description = description;
    _skills = skills;
    _favorites = favorites;
  }

  AboutModel.fromJson(Map<String, dynamic> json) {
    _userImagePath = json['userImagePath'];
    _userName = json['userName'];
    _description = json['description'];
    if (json['skills'] != null) {
      _skills = [];
      json['skills'].forEach((skill) {
        _skills.add(SkillsModel.fromJson(skill));
      });
    }
    if (json['favorites'] != null) {
      _favorites = [];
      json['favorites'].forEach((favorite) {
        _favorites.add(FavoritesModel.fromJson(favorite));
      });
    }
  }

  Map<String, dynamic> toJson() => {
        'userImagePath': _userImagePath,
        'userName': _userName,
        'description': _description,
        'skills': _skills.map((skill) => skill.toJson()).toList(),
        'favorites': _favorites.map((favorite) => favorite.toJson()).toList()
      };
}

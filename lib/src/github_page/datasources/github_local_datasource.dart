import 'dart:convert';

import 'package:flutter_playground/src/flutterando_page/strings/flutterando_strings.dart';
import 'package:flutter_playground/src/github_page/adapters/github_model_adapter.dart';
import 'package:flutter_playground/src/github_page/datasources/github_datasource_interface.dart';
import 'package:flutter_playground/src/github_page/model/repository_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class GithubLocalDataSource extends IGithubDatasource {
  final GithubModelAdapter adapter;
  GithubLocalDataSource({required this.adapter});

  @override
  Future<List<RepositoryModel>?> getModels() async {
    final SharedPreferences _prefs = await SharedPreferences.getInstance();
    try {
      final List<Map<String, dynamic>> models =
          _prefs.getString(GITHUB_MODEL_KEY) as List<Map<String, dynamic>>;
      List<RepositoryModel> githubModels = [];

      for (var model in models) {
        githubModels.add(adapter.fromJson(model));
      }

      return githubModels;
    } catch (ex) {
      return null;
    }
  }

  @override
  Future<void> saveModels(List<RepositoryModel?>? repositories) async {
    final SharedPreferences _prefs = await SharedPreferences.getInstance();
    List<String> repositoriesList = [];

    if (repositories != null) {
      for (var model in repositories) {
        if (model != null) {
          repositoriesList.add(adapter.toJson(model).toString());
        }
      }
    }

    _prefs.setString(GITHUB_MODEL_KEY, repositoriesList.toString());
  }
}

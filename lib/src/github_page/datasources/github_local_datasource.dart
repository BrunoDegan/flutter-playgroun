import 'dart:convert';

import 'package:flutter_playground/src/flutterando_page/strings/flutterando_strings.dart';
import 'package:flutter_playground/src/github_page/adapters/github_model_adapter.dart';
import 'package:flutter_playground/src/github_page/model/github_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class GithubLocalDataSource {
  final GithubModelAdapter adapter;
  GithubLocalDataSource({required this.adapter});

  Future<GithubModel?> getModel() async {
    final SharedPreferences _prefs = await SharedPreferences.getInstance();
    final model = _prefs.getString(GITHUB_MODEL_KEY);
    if (model != null) {
      return adapter.fromJson(jsonDecode(model));
    }
    return null;
  }

  Future<void> saveModel(GithubModel model) async {
    final SharedPreferences _prefs = await SharedPreferences.getInstance();
    _prefs.setString(GITHUB_MODEL_KEY, jsonEncode(model));
  }
}

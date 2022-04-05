import 'dart:convert';

import 'package:flutter_playground/src/flutterando_page/about/model/about_model.dart';
import 'package:flutter_playground/src/flutterando_page/strings/flutterando_strings.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AboutLocalDataSource {
  Future<AboutModel?> getModel() async {
    final SharedPreferences _prefs = await SharedPreferences.getInstance();
    final model = _prefs.getString(FLUTTERANDO_MODEL_KEY);
    if (model != null) {
      return AboutModel.fromJson(jsonDecode(model));
    }
    return null;
  }

  Future<void> saveModel(AboutModel model) async {
    final SharedPreferences _prefs = await SharedPreferences.getInstance();
    await _prefs.setString(FLUTTERANDO_MODEL_KEY, jsonEncode(model));
  }
}
import 'package:flutter_playground/src/flutterando_page/about/model/about_model.dart';

abstract class IAboutDataSource {
  Future<AboutModel?> getModel();
  Future<void> saveModel(AboutModel model);
}

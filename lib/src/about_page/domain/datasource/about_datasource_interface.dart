

import 'package:flutter_playground/src/about_page/domain/model/about_model.dart';

abstract class IAboutDataSource {
  Future<AboutModel?> getModel();
  Future<void> saveModel(AboutModel model);
}


import 'package:flutter_playground/src/flutterando_page/about/datasource/AboutPageDataSource.dart';
import 'package:flutter_playground/src/flutterando_page/about/model/flutterando_about_model.dart';

class AboutPageRepository {
  AboutPageDataSource dataSource;

  AboutPageRepository({required this.dataSource});

  FlutterandoAboutModel provideData() {
    return dataSource.getAboutData();
  }
}

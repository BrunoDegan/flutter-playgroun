
import 'package:flutter_playground/flutterando_page/about/data/flutterando_about_model.dart';
import 'package:flutter_playground/flutterando_page/about/datasource/AboutPageDataSource.dart';

class AboutPageRepository {
  AboutPageDataSource dataSource;

  AboutPageRepository({required this.dataSource});

  FlutterandoAboutModel provideData() {
    return dataSource.getAboutData();
  }
}

import 'package:flutter_playground/flutterando_screen/about/data/flutterando_about_data.dart';
import 'package:flutter_playground/flutterando_screen/about/datasource/AboutPageDataSource.dart';

class AboutPageRepository {
  AboutPageDataSource dataSource;

  AboutPageRepository({required this.dataSource});

  FlutterandoAboutData provideData() {
    return dataSource.getAboutData();
  }
}

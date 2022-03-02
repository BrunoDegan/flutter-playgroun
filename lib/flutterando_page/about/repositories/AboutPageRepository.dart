
import 'package:flutter_playground/flutterando_page/about/data/flutterando_about_data.dart';
import 'package:flutter_playground/flutterando_page/about/datasource/AboutPageDataSource.dart';

class AboutPageRepository {
  AboutPageDataSource dataSource;

  AboutPageRepository({required this.dataSource});

  FlutterandoAboutData provideData() {
    return dataSource.getAboutData();
  }
}

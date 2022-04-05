import 'package:dio/dio.dart';
import 'package:flutter_playground/src/flutterando_page/about/datasource/about_datasource_interface.dart';
import 'package:flutter_playground/src/flutterando_page/about/model/about_model.dart';

const _endpoint = 'https://my-json-server.typicode.com/BrunoDegan/demo/about';

class AboutRemoteDataSource extends IAboutDataSource {
  final Dio dio;

  AboutRemoteDataSource({required this.dio});

  @override
  Future<AboutModel?> getModel() async {
    try {
      final response = await dio.get(_endpoint);
      final Map<String, dynamic> responseJson = response.data;
      return AboutModel.fromJson(responseJson);
    } catch (e) {
      return null;
    }
  }

  @override
  Future<void> saveModel(AboutModel model) async {}
}

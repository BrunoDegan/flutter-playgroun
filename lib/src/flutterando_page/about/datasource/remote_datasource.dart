import 'package:dio/dio.dart';
import 'package:flutter_playground/src/flutterando_page/about/model/about_model.dart';

const _endpoint = 'https://my-json-server.typicode.com/BrunoDegan/demo/about';

class RemoteDataSource {
  final Dio dio;

  RemoteDataSource({required this.dio});

  Future<AboutModel?> fetchModel() async {
    try {
      final response = await dio.get(_endpoint);
      final Map<String, dynamic> responseJson = response.data;
      return AboutModel.fromJson(responseJson);
    } catch (e) {
      return null;
    }
  }
}

import 'package:dio/dio.dart';
import 'package:flutter_playground/src/github_page/adapters/github_model_adapter.dart';
import 'package:flutter_playground/src/github_page/model/github_model.dart';

const _endpoint = 'https://api.github.com/users/BrunoDegan';

class GithubRemoteDataSource {
  final Dio dio;
  final GithubModelAdapter adapter;
  GithubRemoteDataSource({required this.dio, required this.adapter});

  Future<GithubModel?> fetchModel() async {
    try {
      final response = await dio.get(_endpoint);
      final Map<String, dynamic> responseJson = response.data;
      return adapter.fromJson(responseJson);
    } catch (ex) {
      return null;
    }
  }
}

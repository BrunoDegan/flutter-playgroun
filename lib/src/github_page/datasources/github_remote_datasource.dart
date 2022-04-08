import 'package:dio/dio.dart';
import 'package:flutter_playground/src/common/services/internet_service.dart';
import 'package:flutter_playground/src/github_page/adapters/github_model_adapter.dart';
import 'package:flutter_playground/src/github_page/datasources/github_datasource_interface.dart';
import 'package:flutter_playground/src/github_page/model/github_model.dart';

const _endpoint = 'https://api.github.com/users/BrunoDegan';

class GithubRemoteDataSource extends IGithubDatasource {
  final InternetRequestService internetRequestService;
  final GithubModelAdapter adapter;
  GithubRemoteDataSource({required this.internetRequestService, required this.adapter});

  @override
  Future<GithubModel?> getModel() async {
    try {
      final response = await internetRequestService.get(_endpoint);
      final Map<String, dynamic> responseJson = response.data;
      return adapter.fromJson(responseJson);
    } catch (ex) {
      return null;
    }
  }

  @override
  Future<void> saveModel(GithubModel model) async {}
}

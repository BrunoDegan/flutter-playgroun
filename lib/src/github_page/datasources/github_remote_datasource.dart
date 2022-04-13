import 'package:dio/dio.dart';
import 'package:flutter_playground/src/common/services/internet_service.dart';
import 'package:flutter_playground/src/github_page/adapters/github_model_adapter.dart';
import 'package:flutter_playground/src/github_page/datasources/github_datasource_interface.dart';
import 'package:flutter_playground/src/github_page/model/repository_model.dart';

const _endpoint = 'https://api.github.com/users/BrunoDegan';

class GithubRemoteDataSource extends IGithubDatasource {
  final InternetRequestService internetRequestService;
  final GithubModelAdapter adapter;
  GithubRemoteDataSource(
      {required this.internetRequestService, required this.adapter});

  @override
  Future<List<RepositoryModel>?> getModels() async {
    List<RepositoryModel> githubModels = [];
    try {
      final response = await internetRequestService.get(_endpoint);
      final List<Map<String, dynamic>> jsonResponse =
          response.data as List<Map<String, dynamic>>;

      for (var githubModel in jsonResponse) {
        githubModels.add(adapter.fromJson(githubModel));
      }

      return githubModels;
    } catch (ex) {
      return null;
    }
  }

  @override
  Future<void> saveModels(List<RepositoryModel?>? model) {
    throw UnimplementedError();
  }
}

import 'package:flutter_playground/src/github_page/model/repository_model.dart';

abstract class IGithubDatasource {
  Future<List<RepositoryModel?>?> getModels();
  Future<void> saveModels(List<RepositoryModel?>? model);
}

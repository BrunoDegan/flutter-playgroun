import 'package:flutter_playground/src/github_page/domain/model/repository_model.dart';

abstract class IGithubRepository {
  Future<List<RepositoryModel>?> getModels();
}

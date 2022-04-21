import 'package:flutter_playground/src/github_page/domain/model/repository_model.dart';
import 'package:flutter_playground/src/github_page/domain/repositories/github_repository_interface.dart';

abstract class IFetchGithubDataUsecase {
  Future<List<RepositoryModel>?> call();
}

class FetchGitbubDataUsecase implements IFetchGithubDataUsecase {
  final IGithubRepository repository;

  FetchGitbubDataUsecase(this.repository);

  @override
  Future<List<RepositoryModel>?> call() async {
    return await repository.getModels();
  }
}

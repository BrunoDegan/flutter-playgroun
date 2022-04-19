import 'package:flutter_playground/src/common/services/check_internet_connectivity_service.dart';
import 'package:flutter_playground/src/github_page/domain/datasources/github_local_datasource.dart';
import 'package:flutter_playground/src/github_page/domain/datasources/github_remote_datasource.dart';
import 'package:flutter_playground/src/github_page/domain/model/repository_model.dart';
import 'package:flutter_playground/src/github_page/domain/repositories/github_repository_interface.dart';

class GithubRepository extends IGithubRepository {
  late GithubRemoteDataSource remoteDataSource;
  late GithubLocalDataSource localDataSource;
  late CheckConnectivityService connectivityService;

  GithubRepository(
      {required this.localDataSource,
      required this.remoteDataSource,
      required this.connectivityService});

  @override
  Future<List<RepositoryModel>?> getModels() async {
    List<RepositoryModel>? models;

    if (await connectivityService.isConnected()) {
      models = await remoteDataSource.getModels();
      if(models != null) {
        localDataSource.saveModels(models);
      }
    } else {
      models = await localDataSource.getModels();
    }

    return models;
  }
}

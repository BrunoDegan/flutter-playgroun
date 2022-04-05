import 'package:flutter_playground/src/common/services/check_internet_connectivity_service.dart';
import 'package:flutter_playground/src/github_page/datasources/github_local_datasource.dart';
import 'package:flutter_playground/src/github_page/datasources/github_remote_datasource.dart';
import 'package:flutter_playground/src/github_page/model/github_model.dart';

class GithubRepository {
  late GithubRemoteDataSource remoteDataSource;
  late GithubLocalDataSource localDataSource;
  late CheckConnectivityService connectivityService;

  GithubRepository(
      {required this.localDataSource,
      required this.remoteDataSource,
      required this.connectivityService});

  Future<GithubModel?> getModel() async {
    GithubModel? model;

    if (await connectivityService.isConnected()) {
      model = await remoteDataSource.fetchModel();
      if (model != null) {
        localDataSource.saveModel(model);
      }
    } else {
      model = await localDataSource.getModel();
    }
    return model;
  }
}

import 'package:flutter_playground/src/common/services/check_internet_connectivity_service.dart';
import 'package:flutter_playground/src/flutterando_page/about/datasource/about_local_datasource.dart';
import 'package:flutter_playground/src/flutterando_page/about/datasource/about_remote_datasource.dart';
import 'package:flutter_playground/src/flutterando_page/about/model/about_model.dart';
import 'package:flutter_playground/src/flutterando_page/about/repositories/about_repository_interface.dart';
import 'package:flutter_playground/src/flutterando_page/states/about_page_state.dart';
import 'package:flutter_playground/src/common/page_state.dart';

class AboutRepository extends IAboutRepository {
  late AboutRemoteDataSource remoteDataSource;
  late AboutLocalDataSource localDataSource;
  late CheckConnectivityService connectivityService;

  AboutRepository(
      {required this.remoteDataSource,
      required this.localDataSource,
      required this.connectivityService});

  @override
  Future<PageState> getModel() async {
    if (await connectivityService.isConnected()) {
      AboutModel? model = await remoteDataSource.getModel();
      if (model != null) {
        localDataSource.saveModel(model);
        return SuccessState(model);
      } else {
        return ErrorState('Erro ao fazer requisição para obter modelo da API');
      }
    } else {
      AboutModel? model = await localDataSource.getModel();
      if (model != null) {
        return SuccessState(model);
      } else {
        return ErrorState('Erro ao carregar o modelo da memória');
      }
    }
  }
}

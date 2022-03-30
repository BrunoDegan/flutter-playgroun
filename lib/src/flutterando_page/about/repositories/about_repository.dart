import 'package:flutter_playground/src/flutterando_page/about/datasource/local_datasource.dart';
import 'package:flutter_playground/src/flutterando_page/about/datasource/remote_datasource.dart';
import 'package:flutter_playground/src/flutterando_page/about/model/about_model.dart';
import 'package:flutter_playground/src/flutterando_page/about/services/check_internet_connectivity_service.dart';
import 'package:flutter_playground/src/flutterando_page/states/flutterando_page_state.dart';

class AboutRepository {
  late RemoteDataSource remoteDataSource;
  late LocalDataSource localDataSource;
  late CheckConnectivityService connectivityService;

  AboutRepository(
      {required this.remoteDataSource,
      required this.localDataSource,
      required this.connectivityService});

  Future<PageState> getModel() async {
    if (await connectivityService.isConnected()) {
      AboutModel? model = await remoteDataSource.fetchModel();
      if (model != null) {
        localDataSource.saveModel(model);
        return SuccessState(model);
      } else {
        return ErrorState('Erro ao fazer requisição para obter modelo da API');
      }
    } else {
      AboutModel? model = await localDataSource.getModel();
      if (model == null) {
        return ErrorState('Erro ao carregar o modelo da memória');
      } else {
        return SuccessState(model);
      }
    }
  }
}

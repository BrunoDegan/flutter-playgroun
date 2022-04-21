import 'package:flutter_playground/src/about_page/domain/datasource/about_datasource_interface.dart';
import 'package:flutter_playground/src/about_page/domain/model/about_model.dart';
import 'package:flutter_playground/src/common/services/internet_request_service.dart';

const _endpoint = 'https://my-json-server.typicode.com/BrunoDegan/demo/about';

class AboutRemoteDataSource extends IAboutDataSource {
  final InternetRequestService internetRequestService;
  AboutRemoteDataSource({required this.internetRequestService});

  @override
  Future<AboutModel?> getModel() async {
    try {
      final response = await internetRequestService.get(_endpoint);
      final Map<String, dynamic> responseJson = response.data;
      return AboutModel.fromJson(responseJson);
    } catch (e) {
      return null;
    }
  }

  @override
  Future<void> saveModel(AboutModel model) async {}
}

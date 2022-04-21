import 'package:dio/dio.dart';
abstract class InternetRequestServiceInterface {
  Future get(String url);
}

class InternetRequestService implements InternetRequestServiceInterface  {
  late final Dio dio;

  InternetRequestService({required this.dio});

  @override
  Future get(String url) {
    return dio.get(url);
  }
}

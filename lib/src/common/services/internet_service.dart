import 'package:dio/dio.dart';

class InternetRequestService {
  late final Dio dio;

  InternetRequestService({required this.dio});

  Future get(String url) {
    return dio.get(url);
  }
}

import 'dart:developer';
import 'package:cryptos/app/utils/constants.dart';
import 'package:dio/dio.dart';

class HTTPService {
  final Dio _dio = Dio();

  HTTPService() {
    _configureDio();
  }

  void _configureDio() {
    _dio.options = BaseOptions(
      baseUrl: 'https://api.cryptorank.io/v1/',
      queryParameters: {
        'api_key': apiKey,
      },
    );
  }

  Future<dynamic> get(String path) async {
    try {
      Response response = await _dio.get(path);
      return response.data;
    } catch (e) {
      log(e.toString());
    }
  }
}

import 'package:dio/dio.dart';

class MyPath {
  static final Dio url =
      Dio(BaseOptions(baseUrl: 'https://coded-bank-api.herokuapp.com'));
}

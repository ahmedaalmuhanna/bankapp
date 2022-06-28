import 'package:dio/dio.dart';

class MyPath {
  static final path =
      Dio(BaseOptions(baseUrl: 'https://coded-bank-api.herokuapp.com'));
}

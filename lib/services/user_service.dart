import 'package:bankapp/models/user.dart';
import 'package:bankapp/services/backendpath.dart';
import 'package:dio/dio.dart';

class UserService {
  final _dio = Dio();

  Future<String> signup({required User user}) async {
    late String token;
    try {
      Response response = await MyPath.path.post("/signup", data: user);
      token = response.data["token"];
      print(token);
    } on DioError catch (error) {
      print(error);
    }
    return token;
  }
}

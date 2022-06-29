import 'package:bankapp/models/user.dart';
import 'package:bankapp/pages/signin.dart';
import 'package:bankapp/services/backendpath.dart';
import 'package:dio/dio.dart';

class UserService {
  final _dio = Dio();

  Future<String> signup({required User myUser}) async {
    String token = '';

// we are using FormData to post a file .
// 1. creat a Response variable.
// 2. creat a FormData variable.
// 3.use FormData.formMap({"username":  .... })
// 4. use the Response variable to post the data:
//    await MyPath.url.post("https://coded-bank-api.herokuapp.com", data: myData);
//    MyPath.url is a clinet <==> backendpath.dart
// 5. use the variable token to have the token from the Response:
//    token = myResponse.data["token"];

    try {
      Response myResponse;
      FormData myData;
      myData = FormData.fromMap({
        "username": myUser.username,
        "password": myUser.password,
        "image": await MultipartFile.fromFile(myUser.image!),
      });
      myResponse = await MyPath.url.post("/signup", data: myData);
      token = myResponse.data["token"];
    } on DioError catch (error) {
      print(error);
    }
    print("my token is \n $token");

    return token;
  }

  Future<String> signIn({required User myUser}) async {
    String token = '';

// we are using FormData to post a file .
// 1. creat a Response variable.
// 2. creat a FormData variable.
// 3. use the Response variable to post the data:
//    await MyPath.url.post("https://coded-bank-api.herokuapp.com", data: myData);
//    MyPath.url is a clinet <==> backendpath.dart
// 4. use the variable token to have the token from the Response:
//    token = myResponse.data["token"];

    try {
      Response myResponse;
      FormData myData;

      myResponse = await MyPath.url.post("/signin", data: myUser.toJson());
      token = myResponse.data["token"];
    } on DioError catch (error) {
      print(error);
    }
    print("my token is \n $token");

    return token;
  }
}

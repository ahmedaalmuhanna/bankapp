import 'dart:io';

import 'package:bankapp/models/user.dart';
import 'package:bankapp/services/backendpath.dart';
import 'package:bankapp/services/user_service.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:jwt_decode/jwt_decode.dart';

class UserProvider extends ChangeNotifier {
  String token = '';
  User? user;
  Future<bool> signUp(User myUser) async {
    try {
      token = await UserService().signup(myUser: myUser);
      user = User.fromMap(
          Jwt.parseJwt(token)); // decode the user // to assign the user .
      print("token is in provider: \n $token");
      print("\n\n\n\n\n\n\n\n ${Jwt.parseJwt(token)}\n\n\n\n\n\n\n\n}");
      notifyListeners();
      MyPath.url.options.headers[HttpHeaders.authorizationHeader] =
          "Bearer $token"; // configiring Authorization header.

      return true;
    } catch (error) {
      print(error);
      return false;
    }
  }

  Future<bool> signIn(User myUser) async {
    try {
      token = await UserService().signIn(myUser: myUser);
      user = User.fromMap(Jwt.parseJwt(token)); // decode the user
      print(
          "\n\n\n///////////////////////////\n  ${Jwt.parseJwt(token)} \n\n\n///////////////////////////\n}");

      print("token is in provider: \n ${token}");
      notifyListeners();
      MyPath.url.options.headers[HttpHeaders.authorizationHeader] =
          "Bearer $token"; // configiring Authorization header.
      return token.isNotEmpty;
    } catch (error) {
      print(error);
      return false;
    }
  }

  Future<bool> upDate(User myUser) async {
    print(
        "\n\n\n///////////////////////////\n  ${Jwt.parseJwt(token)} \n\n\n///////////////////////////\n}");
    try {
      token = await UserService().upDate(myUser: myUser);
      user = User.fromMap(Jwt.parseJwt(token)); // decode the user
      notifyListeners();
      MyPath.url.options.headers[HttpHeaders.authorizationHeader] =
          "Bearer $token"; // configiring Authorization header.
      return token.isNotEmpty;
    } catch (error) {
      print(error);
      return false;
    }
  }

  bool get IsAuth {
    if (token.isEmpty && Jwt.getExpiryDate(token)!.isAfter(DateTime.now())) {
      user = User.fromMap(Jwt.parseJwt(token)); // decode the user
      return false;
    } else {
      return true;
    }
  }
}

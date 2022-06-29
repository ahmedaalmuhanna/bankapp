import 'package:bankapp/models/user.dart';
import 'package:bankapp/services/user_service.dart';
import 'package:flutter/cupertino.dart';
import 'package:jwt_decode/jwt_decode.dart';

class UserProvider extends ChangeNotifier {
  String token = '';
  User? user;
  void signUp(User User) async {
    token = await UserService().signup(myUser: User);
    print("token is in provider: \n $token");
    notifyListeners();
  }

  void signIn(User User) async {
    token = await UserService().signIn(myUser: User);
    print("token is in provider: \n $token");
    notifyListeners();
  }

  bool get IsAuth {
    if (token.isEmpty && Jwt.getExpiryDate(token)!.isAfter(DateTime.now())) {
      user = User.fromMap(Jwt.parseJwt(token));
      return false;
    } else {
      return true;
    }
  }
}
